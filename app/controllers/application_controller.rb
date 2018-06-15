
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get "/posts/new" do
    erb :new
  end

  post "/posts" do
   @post = Post.create(params)

  erb :index
  end

  get "/posts" do
    @posts = Post.all.to_a
    #binding.pry
    erb :index
  end

  get "/posts/:id" do
    #binding.pry
    id = params[:id]
    @post = Post.find(id)
    #binding.pry
    erb :show
  end

  get "/posts/:id/edit" do
    erb :edit
  end

  patch "/posts/:id"

end
