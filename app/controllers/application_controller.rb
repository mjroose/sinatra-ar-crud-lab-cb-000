
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    erb :index
  end

  post '/posts' do
    post = Post.new(params[:post])
    post.save
    binding.pry
    redirect to :'/posts'
  end
end
