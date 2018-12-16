require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end
