class LandmarksController < ApplicationController

  get '/landmarks' do
    # list of all landmarks
    # "landmarks"
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    # create new landmark w/ name/completion year
    # "testing"
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    # single landrmark
    # "One Landmark"
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    # iew form edit single landmark
    # "edit landmark"
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'   
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

end
