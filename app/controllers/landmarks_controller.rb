class LandmarksController < ApplicationController

  # displays a list of all landmarks
  get '/landmarks' do
    erb :"/landmarks/index"
  end

  # displays a form to create a new landmark
  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  # displays a page for a single landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"/landmarks/show"
  end

  # uses input from a form to create a new landmark
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end

  # displays a form to edit a landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :"/landmarks/edit"
  end

  # uses information from a form to edit a single landmark
  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    redirect to "/landmarks/#{landmark.id}"
  end
end
