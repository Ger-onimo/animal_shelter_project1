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
