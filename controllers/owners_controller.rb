require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')

get '/owners/?' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  # get the name and type of animal for an owner
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners/#{params['id']}"
end

post '/owners/:id/delete' do
  owner = Owner.find(params['id'])
  owner.delete
  redirect to '/owners'
end
