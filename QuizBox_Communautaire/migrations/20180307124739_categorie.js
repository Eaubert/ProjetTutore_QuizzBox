
exports.up = function(knex, Promise) {
    return Promise.all([
        knex.schema.createTable('categorie', function(table) {
        table.increments('id').primary();
        table.string('nom');
        table.string('img');
        table.string('description');
      })
    ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('categorie')
  ])
};
