
require('pg')
require_relative("../db/sql_runner")

class Owner
  attr_accessor :first_name, :last_name, :address,
                :postcode, :tel_number, :email_address,
                :animal_adopted
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
    @postcode = options['postcode']
    @tel_number = options['tel_number']
    @email_address = options['email_address']
    @animal_adopted = options['animal_adopted']
  end

def save()
  sql = "INSERT INTO owners
  (
    first_name,
    last_name,
    address,
    postcode,
    tel_number,
    email_address,
    animal_adopted
  )
  VALUES
  (
    $1, $2, $3, $4, $5, $6, $7
  )
  RETURNING id"
  values = [@first_name, @last_name,
            @address, @postcode,
            @tel_number, @email_address,
            @animal_adopted]
  owner = SqlRunner.run(sql, values).first
  @id = owner[:id].to_i
end

  def update() #UPDATE
    sql = "UPDATE owners
    SET
      (
        first_name,
        last_name,
        address,
        postcode,
        tel_number,
        email_address,
        animal_adopted
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@first_name, @last_name,
                @address, @postcode,
                @tel_number, @email_address,
                @animal_adopted, @id]
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

end
