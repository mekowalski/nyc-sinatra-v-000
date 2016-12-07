class FiguresController < ApplicationController

  get '/figures' do
    # list of all figures
    # "listing"
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    # create new figure w/ title/landmark, w/ new title/new landmark
    # "testing"
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  end

  get '/figures/:id' do
    # single figure
    # "One Figure"
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    # view form to edit single figure
    "edit figure"
  end

end
