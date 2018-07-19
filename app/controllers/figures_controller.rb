class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    @titles = Title.all
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @titles = Title.all
    params[:title][:name].each do |id|
      title = Title.find_by(name: id)
      @figure.titles << title
    end
    binding.pry
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure][:name])
    redirect to "/figures/#{@figure.id}"
  end

  delete '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.delete
    redirect to '/figures'
  end
end
