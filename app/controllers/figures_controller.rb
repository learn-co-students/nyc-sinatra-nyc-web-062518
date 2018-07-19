class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.title_ids = params[:title][:id]
    if !params[:title][:name].empty?
       new_title = Title.create(name: params[:title][:name])
       @figure.titles << new_title
    end

    @figure.landmark_ids = params[:landmark][:id]
    if !params[:landmark][:name].empty?
      new_landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
      @figure.landmarks << new_landmark
    end

    @figure.save
    redirect to '/figures'
  end

end
