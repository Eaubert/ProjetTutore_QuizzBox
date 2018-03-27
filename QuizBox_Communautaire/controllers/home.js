var bookshelf = require('../config/bookshelf');
var User = require('../models/User');
var Quizz = require('../models/Quizz');
var Categorie = require('../models/Categorie');
var Question = require('../models/Question');
var Commentaire = require('../models/Commentaire');
var dateFormat = require('dateformat');
var fs = require('fs');

exports.index = function(req, res) {
    Commentaire.query(function (qb) {
      qb.join('quizz', 'quizz.id', 'commentaire.id_quizz')
      qb.groupBy('id_quizz');
      qb.select("*");
      qb.avg('note as moy');
      qb.orderBy("moy");
      qb.limit("5");
    }).fetchAll().then(function(comm){
      console.log(comm.models);
      Categorie.fetchAll().then(function(catg){
        res.render('home', {
        	title: 'Accueil',
          comm: comm.models,
          catg: catg.models,
        });
      });
    });
};

exports.quizzById = function(req, res) {
  Quizz.forge().query(function (qb) { qb.where('id', '=', req.params.id) }).fetch().then(function(quizz) {
    Categorie.forge().query(function (qb) { qb.where('id', '=', quizz.attributes.id_categorie) }).fetch().then(function(catg) {
      Question.forge().query(function (qb) { qb.where('id_quizz', '=', req.params.id) }).fetchAll().then(function(tab) {
        Commentaire.forge().query(function (qb) { qb.where('id_quizz', '=', req.params.id) }).fetchAll().then(function(comm) {
          console.log(quizz.attributes);
          res.render('quizzById', {
            title: 'quizz',
            tab : tab.models,
            quizz : quizz.attributes,
            catg : catg.attributes,
            comm : comm.models,
          });
        });
      });
    });
  });
};

exports.catgById = function(req, res) {
  Quizz.forge().query(function (qb) { qb.where('id_categorie', '=', req.params.id) }).fetchAll().then(function(quizz) {
    Categorie.forge().query(function (qb) { qb.where('id', '=', req.params.id) }).fetch().then(function(catg) {
        res.render('catgById', {
            title: 'categorie',
            quizz : quizz.models,
            catg : catg.attributes,
          });
    });
  });
};

exports.uploadComm = function(req, res) {

  Commentaire.forge().query(function (qb) {
    qb.where('id_user', '=', req.user.attributes.id);
    qb.where('id_quizz', '=', req.param('id_quizz'));
 }).fetch().then(function(comm) {
    if(comm == null){
        new Commentaire({
          commentaire:req.param('commentaire'),
          pseudo:req.user.attributes.name,
          dateComm:dateFormat(new Date(), "dd-mm-yyyy"),
          note:req.param('stars'),
          id_quizz:req.param('id_quizz'),
          id_user:req.user.attributes.id
        }).save();
        res.redirect('back');
    }else{
      res.send('<script>alert("Vous avez déjà voté")</script>');
    }
  });
};

exports.search =  function(req, res) {
 Quizz.forge().query(function (qb) {

    var search =  "%"+ req.body.search + "%";
     qb.where('nom', 'LIKE', search)/*.orWhere('description', 'LIKE', search)*/;

 }).fetchAll().then(function(tab) {
   res.render('Quizz', {
     title: 'quizz',
     tab : tab.models
   });
 });
};

exports.searchCatg =  function(req, res) {
 Categorie.forge().query(function (qb) {

    var search =  "%"+ req.body.search + "%";
     qb.where('nom', 'LIKE', search)/*.orWhere('description', 'LIKE', search)*/;

 }).fetchAll().then(function(tab) {
   res.render('Categorie', {
     title: 'categorie',
     tab : tab.models
   });
 });
};

exports.quizz = function(req, res) {
   	Quizz.fetchAll().then(function(tab) {
  		res.render('Quizz', {
      	title: 'quizz',
  			tab : tab.models
  		});
  	});
};


exports.categorie = function(req, res) {
   	Categorie.fetchAll().then(function(tab) {
  		res.render('Categorie', {
      	title: 'categorie',
  			tab : tab.models
  		});
  	});
};

exports.newquizz = function(req, res) {
  res.render('newquizz', {
    title: 'quizz'
  });
};

exports.uploadimg = function(req, res){
  new Quizz({
    description:req.param('message'),
    nom: req.param('name'),
    img: req.file.filename
  }).save();
  Quizz.fetchAll().then(function(tab) {
    for(var i=1;i<11;i++){
      new Question({
        question:req.param(i+'1'),
        repb:req.param(i+'2'),
        rep1:req.param(i+'3'),
        rep2:req.param(i+'4'),
        rep3:req.param(i+'5'),
        id_quizz:tab.length+1
      }).save();
    }
  })
};

exports.export = function(req, res) {
  Quizz.fetchAll().then(function(tab) {
  res.render('export', {
    title: 'export',
    quiz: tab.models
  });
});
};

global.quiz='';
global.ques='';
exports.extration = function(req, res) {
  if(Array.isArray(req.body.quiz)==true){
    for( var i=0;i<req.body.quiz.length;i++){
      Quizz.where('nom','=',req.body.quiz[i]).query().select().then(function(t) {
        global.quiz=global.quiz+JSON.stringify(t);

        for(var j=0;j<t.length;j++){
          Question.where('id_quizz','=',t[j].id).query().select().then(function(ta) {
            global.ques=global.ques+JSON.stringify(ta);
          });
        }

      });
    }
    fs.writeFileSync("Extraction",global.quiz+global.ques)
  }
  else{
    Quizz.where('nom','=',req.body.quiz).query().select().then(function(t) {

      Question.where('id_quizz','=',t[0].id).query().select().then(function(ta) {
        fs.writeFileSync("Extraction",JSON.stringify(t)+JSON.stringify(ta))
      });

    });
  }
  var file = './Extraction';
  res.download(file);


  // JSON.parse(fs.writeFileSync("Extraction","contenu du fichier", "UTF-8"))
};
