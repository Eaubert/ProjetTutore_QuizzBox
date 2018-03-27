
exports.up = function(knex, Promise) {
    return Promise.all([
        knex.schema.createTable('question', function(table) {
        table.increments('id').primary();
        table.string('question');
        table.string('repb');
        table.string('rep1');
        table.string('rep2');
        table.string('rep3');
        table.string('id_quizz');
      })
    ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('question')
  ])
};
