
exports.up = function(knex, Promise) {
    return Promise.all([
        knex.schema.createTable('commentaire', function(table) {
        table.increments('id').primary();
        table.string('commentaire');
        table.string('pseudo');
        table.string('dateComm');
        table.integer('note');
        table.string('id_quizz');
        table.string('id_user');
      })
    ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('commentaire')
  ])
};
