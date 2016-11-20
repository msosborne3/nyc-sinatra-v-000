class FiguresController < ApplicationController


  # displays a list of landmarks
  get '/figures' do
    erb :'figures/index'
  end

  # displays a form to create a new landmark
  get '/figures/new' do
    erb :'figures/new'
  end

  # displays a page for a single landmark
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :"/figures/show"
  end

  # uses input from a form to create a new figure
  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title]) unless params[:title][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
    @figure.save

    redirect to "/figures/#{ @figure.id }"
  end

  # displays a form to edit a single landmark
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    erb :"/figures/edit"
  end

  #updates information about a figure including name, titles, and landmarks
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.create(params[:title]) unless params[:title][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
    @figure.save

    redirect to "/figures/#{figure.id}"
  end
end
