class LandmarksController < ApplicationController
  get '/landmarks' do #read action - all
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do #new action
    erb :'landmarks/new'
  end

  post '/landmarks' do #create action
    # binding.pry
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do #read -single
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do #edit
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.assign_attributes(params[:landmark])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
