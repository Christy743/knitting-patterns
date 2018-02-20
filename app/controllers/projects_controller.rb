class ProjectsController < ApplicationController

  get '/projects' do
    if logged_in?
      @projects = Project.all
      erb :'projects/index'
    else
      redirect to "/login"
    end
  end

  get '/projects/new' do
    if logged_in?
      erb :'projects/new'
    else
      redirect to "/login"
    end
  end

  post '/projects' do
    if params[:name] == "" && params[:materials] == "" && params[:directions] == ""
      redirect to "/projects/new"
    else
      @project = current_user.projects.create(:name => params[:name],
                                              :materials => params[:materials],
                                              :directions => params[:directions])
      if @project.save
        redirect to "/projects/#{@project.id}"
      end
    end
  end

  get '/projects/:id' do
    if logged_in?
      @project = Project.find_by(id: params[:id])
      erb :'projects/show_projects'
    else
      redirect to "/login"
    end
  end

  get '/projects/:id/edit' do
    if logged_in?
      @project = Project.find_by(id: params[:id])
      if current_user == @project.user
        erb :'projects/edit'
      else
        redirect to "/projects"
      end
    end
  end

  patch '/projects/:id' do
    if logged_in?
      if @project = current_user.projects.find_by(id: params[:id])
        if @project.update(:name => params[:name], :materials => params[:materials], :directions => params[:directions])
          redirect to "/projects/#{@project.id}"
        else
          redirect to "/projects/#{@project.id}/edit"
        end
      else
        redirect to '/projects'
      end
    else
      redirect to '/login'
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
