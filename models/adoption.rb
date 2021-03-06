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
      RETURNING id"
      values = [@owner_id, @animal_id]
      adoption = SqlRunner.run(sql, values).first
      @id = adoption['id'].to_i
    end

    def update() #UPDATE
      sql = "UPDATE adoptions SET
        (
          owner_id,
          animal_id
        ) =
        (
          $1, $2,
        )
        WHERE id = $3"
        values = [@owner_id, @animal_id, @id]
        SqlRunner.run(sql, values)
    end


    def self.all()
      sql = "SELECT * FROM adoptions"
      values = []
      adoptions = SqlRunner.run(sql, values)
      return adoptions.map{ |adoption| Adoption.new(adoption)}
    end

    def self.delete_all()
      sql = "DELETE FROM adoptions"
      values = []
      SqlRunner.run(sql, values)
    end

    def owner()
        sql = "SELECT * FROM owners
            WHERE owners.id = $1"
        values = [@owner_id]
        owner_hash = SqlRunner.run(sql, values).first
        owner = Owner.new(owner_hash)
        return owner
      end

      def animal()
        sql = "SELECT * FROM animals
          WHERE animals.id = $1"
        values = [@animal_id]
        animal_hash = SqlRunner.run(sql, values).first
        animal = Animal.new(animal_hash)
        return animal
      end
end
