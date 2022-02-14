class HomeController < ApplicationController
  def index
  end

  # GET /home/games
  def games
    @media = Medium.all
    @path = request.path
    @mediaType = if @path.include? "game"
      "game"
    else
      "none"
    end
  end

  # GET /home/movies
  def movies
    @media = Medium.all
    @path = request.path
    @mediaType = if @path.include? "movie"
      "movie"
    else
      "none"
    end
  end

   # GET /home/shows
   def shows
    @media = Medium.all
    @path = request.path
    @mediaType = if @path.include? "show"
      "show"
    else
      "none"
    end
  end

   # GET /home/books
   def books
    @media = Medium.all
    @path = request.path
    @mediaType = if @path.include? "book"
      "book"
    else
      "none"
    end
  end
end
