class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    # binding.pry
    landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      figure = Figure.create(name: params[:figure][:name])
    else
      figure = Figure.find(params[:figure][:id])
    end
    landmark.figure = figure
    landmark.save
    redirect to '/landmarks'
  end

end
