require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')


  get '/adoptions/new' do
    # @animals = Animal.all()
    @owners = Owner.all
    # was going to use for assigning animal
    # but with condition for adoptable animals only
    erb(:"adoptions/new")
  end
