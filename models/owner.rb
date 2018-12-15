
require('pg')
require_relative("../db/sql_runner")

class Owner
  attr_accessor :first_name, :last_name, :address, :email_address
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @email_address = options['email_address']
  end

def save()
  sql = "INSERT INTO owners
  (
    first_name,
    last_name,
    address,
    email_address
  )
  VALUES
  (
    $1, $2, $3, $4
  )
  RETURNING id"
  values = [@first_name, @last_name,
            @address, @email_address]
  owner = SqlRunner.run(sql, values).first
  @id = owner['id'].to_i
end

  def update() #UPDATE
    sql = "UPDATE owners SET
      (
        first_name,
        last_name,
        address,
        email_address
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@first_name, @last_name,
                @address, @email_address, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
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

  def self.find_owner_by(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    owner_hash = SqlRunner.run(sql, values).first
    result = Owner.new(owner_hash)
    return result
  end



end
