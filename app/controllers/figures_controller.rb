class FiguresController < Sinatra::Base
  # add controller methods

  set :views, "./app/views/figures"
  set :method_override, true

  get "/figures" do
    erb :index
  end

  get "/figures/new" do
    erb :new
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params["id"])
    erb :edit
  end
  patch "/figures/:id" do
    figure = Figure.find(params["id"])
    figure.update(params["figure"])
    if !params["title"]["name"].empty?
      new_title = Title.create(params["title"])
      figure.titles << new_title
    end
    if !params["landmark"]["name"].empty? || !params["landmark"]["year_completed"].empty?
      new_landmark = Landmark.create(params["landmark"])
      figure.landmarks << new_landmark
    end
    redirect "/figures/#{figure.id}"
  end


  get "/figures/:id" do
    @figure = Figure.find(params["id"])
    erb :show
  end

  post "/figures" do
    figure = Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      new_title = Title.create(params["title"])
      figure.titles << new_title
    end
    if !params["landmark"]["name"].empty? || !params["landmark"]["year_completed"].empty?
      new_landmark = Landmark.create(params["landmark"])
      figure.landmarks << new_landmark
    end
    redirect "/figures/#{figure.id}"
  end

 
  
end
