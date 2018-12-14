require('pg')
require_relative('../db/sql_runner')

class Animal
  attr_accessor :name, :animal_type, :admission_date, :completed_training,
                :completed_health_check, :ready_to_adopt, :owner_id
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @animal_type = options['animal_type']
    @admission_date = options['admission_date']
    # @completed_training = options['completed_training']
    # @completed_health_check = options['completed_health_check']
    # @ready_to_adopt = options['ready_to_adopt']
    @owner_id = options['id'].to_i if options['owner_id']
  end

  # def save()
  #   sql = "INSERT INTO animals
  #   (
  #     name,
  #     animal_type,
  #     admission_date
  #     completed_training,
  #     completed_health_check,
  #     ready_to_adopt,
  #     owner_id
  #   )
  #   VALUES
  #   (
  #     $1, $2, $3, $4, $5, $6, $7
  #   )
  #   RETURNING id"
  #   values = [@name, @animal_type,
  #             @admission_date, @completed_training,
  #             @completed_health_check, @ready_to_adopt,
  #             @owner_id]
  #   animal = SqlRunner.run(sql, values).first
  #   @id = animal[:id].to_i
  # end


end
