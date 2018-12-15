require('pg')
require_relative('../db/sql_runner')

class Adoption
attr_reader :id, :owner_id, :animal_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id'].to_i
    @animal_id = options['animal_id'].to_i
  end

  def save
      sql = "INSERT INTO adoptions
      (
        owner_id,
        animal_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING *"
      values = [@owner_id, @animal_id]
      adoption = SqlRunner.run(sql, values).first
      @id = adoption['id'].to_i
    end

end

# @owner_id = options['owner_id'].to_i if options['owner_id']
