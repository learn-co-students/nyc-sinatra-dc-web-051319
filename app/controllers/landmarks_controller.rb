# frozen_string_literal: true

class LandmarksController < ApplicationController
  set :method_override, true

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    new_landmark = Landmark.create(params[:landmark])
    redirect "/landmarks/#{new_landmark.id}"
  end

  get '/landmarks/:id' do
    id = params[:id]
    @landmark = Landmark.find(id)
    erb :'landmarks/show'
  end

  put '/landmarks/:id' do
    id = params[:id]
    Landmark.update(id, params[:landmark])
    redirect "/landmarks/#{id}"
  end

  get '/landmarks/:id/edit' do
    id = params[:id]
    @landmark = Landmark.find(id)
    erb :'landmarks/edit'
  end
end
