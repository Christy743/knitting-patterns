class ProjectsController < ApplicationController

  get '/projects' do  #This works
    if logged_in?
      @project = Project.all
      erb :'projects/index'
    else
      redirect to '/login'
    end
  end

  get '/projects/new' do  #this works
    if logged_in?
      erb :'projects/new'
    else
      redirect to '/login'
    end
  end

  post '/projects' do  
    @project = current_user.projects.create(:name => params[:name], :directions => params[:directions])
    binding.pry
    redirect to "/projects/#{@project.id}"
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
      @project = Project.find_by_id(params[:id])
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
      @project.name = params[:name]
      @project.directions = [:directions]

      if @project.save
        redirect to "/projects/#{@project.id}"
      else
        redirect to "/projects/#{@project.id}/edit"
      end
    end

    delete '/projects/:id/delete' do
      @project = Project.find_by_id(params[:id])
      if current_user == @project.user
        @project.delete
      end
      redirect to '/projects'
    end

end
