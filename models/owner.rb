
require('pg')
require_relative("../db/sql_runner")

class Owner
  attr_accessor :first_name, :last_name, :address,
                :email_address, :animal_preference
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @email_address = options['email_address']
    @animal_preference = options['animal_preference']
  end

def save()
  sql = "INSERT INTO owners
  (
    first_name,
    last_name,
    address,
    email_address,
    animal_preference
  )
  VALUES
  (
    $1, $2, $3, $4, $5
  )
  RETURNING id"
  values = [@first_name, @last_name, @address, @email_address, @animal_preference]
  owner = SqlRunner.run(sql, values).first
  @id = owner['id'].to_i
end

  def update() #UPDATE
    sql = "UPDATE owners SET
      (
        first_name,
        last_name,
        address,
        email_address,
        animal_preference
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@first_name, @last_name, @address, @email_address, @animal_preference, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all() #READ
    sql = "SELECT * FROM owners"
    values = []
    owners = SqlRunner.run(sql, values)
    return owners.map{ |owner| Owner.new(owner)}
  end

  def self.delete_all() #DELETE
    sql = "DELETE FROM owners"
    values = []
    SqlRunner.run(sql, values)
  end

# TODO display all the animals a particular owner has adopted

  def animal()
    sql = "SELECT animals.*
    FROM animals
    INNER JOIN adoptions
    ON animals.id = animal_id
    WHERE owner_id = $1"
    values = [@id]
    animals = SqlRunner.run(sql, values)
    return animals.map{ |animal| Animal.new(animal) }
  end
#### TODO - done

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    owner_hash = SqlRunner.run(sql, values).first
    result = Owner.new(owner_hash)
    return result
  end

  def nice_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end
