# frozen_string_literal: true

require 'pry'

class FiguresController < ApplicationController
  set :method_override, true

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    figure = params[:figure]
    landmark = params[:landmark]
    title = params[:title]

    new_figure = Figure.create(figure)
    unless title[:name].empty?
      new_title = Title.create(title)
      new_figure.titles += [new_title]
    end
    unless landmark[:name].empty?
      new_landmark = Landmark.create(landmark)
      new_figure.landmarks += [new_landmark]
    end

    redirect "/figures/#{new_figure.id}"
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    id = params[:id]
    @figure = Figure.find(id)
    erb :'figures/show'
  end

  put '/figures/:id' do
    id = params[:id]
    figure = params[:figure]
    landmark = params[:landmark]
    title = params[:title]

    updated_figure = Figure.update(id, figure)

    unless title[:name].empty?
      new_title = Title.create(title)
      updated_figure.titles += [new_title]
    end
    unless landmark[:name].empty?
      new_landmark = Landmark.create(landmark)
      updated_figure.landmarks += [new_landmark]
    end

    redirect "/figures/#{id}"
  end

  get '/figures/:id/edit' do
    id = params[:id]
    @figure = Figure.find(id)
    erb :'figures/edit'
  end
end
