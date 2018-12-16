require('pg')
require_relative('../db/sql_runner')

class Animal
  attr_accessor :name, :breed, :admission_date, :training_complete,
                :health_check_complete, :ready_to_adopt, :adopted
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @training_complete = options['training_complete']
    @health_check_complete = options['health_check_complete']
    @ready_to_adopt = options['ready_to_adopt']
    @adopted = options['adopted']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      breed,
      admission_date,
      training_complete,
      health_check_complete,
      ready_to_adopt,
      adopted
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@name, @breed,
              @admission_date, @training_complete,
              @health_check_complete, @ready_to_adopt, @adopted]
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
        adopted
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@name, @breed,
                @dmission_date, @training_complete,
                @health_check_complete, @ready_to_adopt, @adopted, @id]
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

  # TODO display all the owners of a particular animal

    def owner()
      sql = "SELECT owners.*
      FROM owners
      INNER JOIN adoptions
      ON owners.id = owner_id
      WHERE animal_id = $1"
      values = [@id]
      owners = SqlRunner.run(sql, values)
      return owners.map{ |owner| Owner.new(owner) }
    end
  #DONE - tested

#TODO - not working now, but not sure if needed

  # def self.find_animal_by(id)
  #   sql = "SELECT * FROM animals
  #   WHERE id = $1"
  #   values = [id]
  #   animal_hash = SqlRunner.run(sql, values).first
  #   result = Animal.new(animal_hash)
  #   return result
  # end


end

# @owner_id = options['owner_id'].to_i if options['owner_id']
