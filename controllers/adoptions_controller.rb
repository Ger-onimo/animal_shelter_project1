require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')


  get '/adoptions/new' do
    @animals = Animal.adoptable
    @owners = Owner.all
    erb(:"adoptions/new")
  end
  #
  # post '/animals' do
  #   Animal.new(params).save
  #   redirect to '/animals'
  # end
  #
  # #update or save???
  # post '/animals/:id' do
  #   animal = Animal.new(params)
  #   animal.update
  #   redirect to "/animals/#{params['id']}"
  # end
