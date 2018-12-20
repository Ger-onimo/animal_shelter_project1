require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')
also_reload('../models/*')

get '/animals/?' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

#new
get '/animals/new' do
  erb(:"animals/new")
end

#save
post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

#show
get '/animals/:id' do
  @animal = Animal.find(params['id'])
  erb(:"animals/show")
end

#edit
get '/animals/:id/edit' do
  @animal = Animal.find(params['id'])
  erb(:"animals/edit")
end

# update
post '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/animals/#{params['id']}"
end

post '/animals/:id/delete' do
  animal = Animal.find(params['id'])
  animal.delete
  redirect to '/animals'
end
