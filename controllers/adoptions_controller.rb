require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')

  get '/adoptions/?' do
    @animals = Animal.all()
    # but with condition for adoptable animals only
    erb ( :"adoptions/index" )
  end
