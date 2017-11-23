#require 'rack-flash'
class UsersController < ApplicationController

  #use Rack::flash

  get '/users/slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/sign_up'
    else
      redirect to '/projects'
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/projects'
    else
      redirect to '/signup'
    end
  end

end
