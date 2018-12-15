require('pg')
require_relative('../db/sql_runner')

class Animal
  attr_accessor :name, :breed, :admission_date, :training_complete,
                :health_check_complete, :ready_to_adopt
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @training_complete = options['training_complete']
    @health_check_complete = options['health_check_complete']
    @ready_to_adopt = options['ready_to_adopt']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      breed,
      admission_date,
      training_complete,
      health_check_complete,
      ready_to_adopt
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @breed,
              @admission_date, @training_complete,
              @health_check_complete, @ready_to_adopt]
    animal = SqlRunner.run(sql, values).first
    @id = animal['id'].to_i
  end

  def update() #UPDATE
    sql = "UPDATE animals SET
      (
        name,
        breed,
        admission_date,
        training_complete,
        health_check_complete,
        ready_to_adopt,
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@name, @breed,
                @dmission_date, @training_complete,
                @health_check_complete, @ready_to_adopt, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all() #READ
    sql = "SELECT * FROM animals"
    values = []
    animals = SqlRunner.run(sql, values)
    return animals.map{ |animal| Animal.new(animal)}
  end

  def self.delete_all() #DELETE
    sql = "DELETE FROM animals"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.find_animal_by(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    animal_hash = SqlRunner.run(sql, values).first
    result = Animal.new(animal_hash)
    return result
  end

  # def self.admission_dates()
  #   sql = 'SELECT'
  #
  # end
  # for all the animals in animals table, return
  # animals and admission date.

end

# @owner_id = options['owner_id'].to_i if options['owner_id']
