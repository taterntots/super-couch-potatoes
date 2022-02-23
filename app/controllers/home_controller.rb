class HomeController < ApplicationController
  def index
  end

  # GET /home/games
  def games
    @gameMedia = Medium.where(:media_type => "game").order('date_completed ASC')
    @selectedYear = 2022
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
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
