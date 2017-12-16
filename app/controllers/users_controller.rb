require 'rack-flash'

class UsersController < ApplicationController

  use Rack::Flash, :sweep => true

  get '/users/slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect to '/projects'
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username],
                     :email => params[:email],
                     :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/projects'
    else
      flash[:message] = "You must have all fields completed to sign up."
      redirect to '/signup'
    end
  end

  get "/login" do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/projects'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/projects'
    else
      flash[:message] = "Oh no! Something went wrong! Did you forget your password?"
      redirect to "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
