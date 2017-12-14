class ProjectsController < ApplicationController

  get '/projects' do
    if logged_in?
      @projects = Project.all
      @user = current_user
      erb :'projects/index'
    else
      redirect to "/login"
    end
  end

  get '/projects/new' do
    #@materials = Material.all
    if logged_in?
      erb :'projects/new'
    else
      redirect to "/login"
    end
  end

  post '/projects' do
    if params[:name] == "" && params[:directions] == "" && params[:material_name] == ""
      redirect to "/projects/new"
    else
      @materials = Material.all
      @project = current_user.projects.create(:name => params[:name], :directions => params[:directions])
      @materials = @project.materials.create(:material_name => params[:material_name])
      #@materials.save
      #binding.pry
      if @project.save && @materials.save
        redirect to "/projects/#{@project.id}"
      end
    end
  end

  get '/projects/:id' do
    if logged_in? #|| @project.user_id == session[:user_id]
      @project = Project.find_by(id: params[:id])
      @materials = Material.find_by(project_id: params[:project_id])
      binding.pry
      #@project.name = params[:name]
      #@project.directions = params[:directions]
      erb :'projects/show_projects'
    else
      redirect to "/login"
    end
  end

  get '/projects/:id/edit' do
    if logged_in?
      @project = Project.find_by(id: params[:id])
      @materials = Material.find_by(project_id: params[:project_id])
      if current_user == @project.user
        erb :'projects/edit'
      else
        redirect to "/projects"
      end
    else
      redirect to "/login"
    end
  end

  post '/projects/:id' do
    @project = Project.find(params[:id])
    @materials = Material.find_by(project_id: params[:project_id])
    @project.update(:name => params[:name], :directions => params[:directions])
    @materials.update(:material_name => params[:material_name])
    #@materials.save
    #binding.pry
    #@project.directions = [:directions]
    if @project.save && @materials.save
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
    redirect to "/projects"
  end

end
