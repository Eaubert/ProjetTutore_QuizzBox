
exports.up = function(knex, Promise) {
    return Promise.all([
      knex.schema.createTable('quizz', function(table) {
      table.increments('id').unsigned().primary();
      table.string('description');
      table.string('nom');
      table.string('img');
      table.string('id_categorie');
      })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('quizz')
  ])
};
