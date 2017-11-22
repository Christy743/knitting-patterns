#require 'rack-flash'
class UsersController < ApplicationController

  #use Rack::flash

  get '/users/slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/signup' do
    erb :'/users/sign_up'
  end



end
