require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params["id"])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params["id"])
    erb :show
  end

  patch '/recipes/:id' do
  #  binding.pry
    recipe = Recipe.find_by_id(params["id"])
    recipe.update_attributes(params["recipe"])
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.destroy
    erb :delete
  end

  get '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.destroy
    erb :delete
  end


end
