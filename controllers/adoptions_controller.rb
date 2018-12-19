require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')


  get '/adoptions/new' do
    @animals = Animal.adoptable
    @owners = Owner.all
    erb(:"adoptions/new")
  end

  post '/adoptions/new' do
    binding.pry
    Adoption.new(params).save
    animal = Animal.find(params[:animal_id])
    animal.adopted == true
    animal.ready_to_adopt == false
    # do I need owner = Owner.find(params[:owner_id])
    redirect to '/animals'
  end
