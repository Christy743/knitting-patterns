class ProjectsController < ApplicationController

  get '/projects' do
    if logged_in?
      @projects = Project.all
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
      @project = current_user.create(:directions => params[:directions])
      redirect to "/projects/#{@project.id}"
    end
  end

  get 'projects/:id' do
    if !logged_in?
      redirect '/login'
    end

      @project = Project.find(params[:id])
      if !@user.nil? && @user == current_user
        erb :'users/show'
      else
      redirect to '/login'
      end
  end

  get '/projects/:id/edit' do
    if logged_in?
      @project = Project.find_by(params[:id])
      if current_user == @project.user
        erb :'projects/edit'
      else
        redirect to '/projects'
      end
    else
      redirect to '/login'
    end
  end

    patch '/projects/:id' do
      @project = Project.find_by(id: params[:id])
      @project.directions = params[:directions]
      if @project.save
        redirect to "/projects/#{@project.id}"
      else
        redirect to "/projects/#{@project.id}/edit"
      end
    end

    delete '/projects/:id/delete' do
      @project = Project.find_by(id: params[:id])
      if current_user == @project.user
        @project.delete
      end
      redirect to '/projects'
    end

end
