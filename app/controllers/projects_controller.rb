class ProjectsController < ApplicationController

  get '/projects' do
    if logged_in? #&& @user = current_user
      @projects = Project.all
      #@user = current_user
      #@projects = Project.find_by(:user_id => params[:user_id])
      erb :'projects/index'
    else
      redirect to '/login'
    end
  end

  get '/projects/new' do
    if logged_in?
      erb :'projects/new'
    else
      redirect to '/login'
    end
  end

  post '/projects' do
    if params[:directions] == ""
      redirect to "/projects/new"
    else
      @project = current_user.projects.create(:name => params[:name], :directions => params[:directions], :material_name => params[:material_name])
      redirect to "/projects/#{@project.id}"
    end
  end

  get '/projects/:id' do
    if logged_in? #|| @project.user_id == session[:user_id]
      @project = Project.find_by(:id => params[:id])
      erb :'projects/show_projects'
    else
      redirect to '/login'
    end
  end

    get '/projects/:id/edit' do
      if logged_in?
        @user = current_user
        @project = Project.find_by(params[:user_id])
        erb :'/projects/edit'
      end
    end

    post '/projects/:id' do
      @project = Project.find_by(params[:user_id])
      if @project.save
        redirect to '/projects/#{@project.id}'
      else
        redirect to '/projects/#{@project.id}/edit'
      end
    end

    get '/projects/' do
      if !logged_in?
        @project = Project.find_by_id(params[:id])
        erb :'projects'
      else
        redirect to '/login'
      end
    end

    delete '/projects/delete' do
      @project = Project.find_by(params[:id])
      if current_user == @project.user
        @project.delete
      end
        redirect to '/projects'
    end


  #get '/projects/:id/edit' do   #*******Stopped at this point to figure out projects.erb form
  #  if logged_in?
  #    @project = Project.find_by(params[:id])
  #    if current_user == @user
  #      erb :'projects/edit'
  #    else
  #      redirect to '/projects'
  #    end
#    else
#      redirect to '/login'
#    end
#  end

#  post '/projects/:id/edit' do
#    @project = Project.find_by(id: params[:id])
#    @project = current_user.projects.update(:name => params[:name], :directions => params[:directions], :material_id => params[:material_id])
#    @project.save
#      redirect to '/projects/#{#project.id}/edit'
#  end


#  get '/projects/:id/:slug' do
#    if logged_in?
#      @user = current_user
#      @project = Project.find_by(params[:user_id])
#      erb :'/projects/edit'
#    end
#  end

  #get '/projects/new' do  #this works
  #  if logged_in?
  #    erb :'projects/new'
  #  else
#      redirect to '/login'
#    end
#  end



  #get '/projects/:id/:slug/edit' do
#
  #  if logged_in?
  #    @project = Project.find_by(params[:id])
  #    if current_user == @project.users
  #      erb :'projects/edit'
  #    else
  #      redirect to '/projects'
  #    end
  #  else
  #    redirect to '/login'
  #  end
  #end



#  post '/projects/:id' do
#    @project = Project.find(params[:id])
#    @project.directions = [:directions]
#
#    if @project.save
#      redirect to "/projects/#{@project.id}"
#    else
#      redirect to "/projects/#{@project.id}/edit"
#    end
#  end

#  get '/projects/:id/edit' do
#    if logged_in?
#      @project = Project.find(params[:id])
#      erb :'projects/edit'
#    end
#  end

#  post '/projects' do  #this works
#    if params[:name] == "" || params[:directions] == ""
#      redirect to "/projects/new"
#    else
#      @project = current_user.projects.create(:name => params[:name], :directions => params[:directions])
#      redirect to "/projects/#{@project.id}"
#    end
#  end

#  get '/projects/:id/:slug' do
#    if !logged_in?
#      @project = Project.find_by_id(params[:id])
#      erb :'projects'
#    else
#      redirect to '/login'
#    end
#  end

#    delete '/projects/:id/delete' do
#      @project = Project.find_by(params[:id])
#      if current_user == @project.user
#        @project.delete
#      end
#      redirect to '/projects'
#    end

end
