
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

  get '/posts/delete_all' do
    Post.all.each do |post|
      post.destroy
    end

    redirect to :'/posts'
  end

  post '/posts' do
    post = Post.new(params[:post])
    post.save
    
    redirect to :'/posts'
  end
end
