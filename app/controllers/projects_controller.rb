class ProjectsController < ApplicationController

  get '/projects' do
    if logged_in?
      @projects = Project.all
      erb :'projects/projects'
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

  post '/project' do
    if params[:descriptions] == ""
      redirect to "/projects/new"
    else
      @project = current.user.tweets.create(:descriptions => params[:descriptions])
      redirect to "/projects/#{@project.id}"
    end
  end
  
end
