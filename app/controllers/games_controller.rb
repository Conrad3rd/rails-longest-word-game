require 'open-uri'
require 'json'

# Game
class GamesController < ApplicationController
  def score
    # raise
    @new_game = params[:new]

    url = "https://wagon-dictionary.herokuapp.com/#{@new_game}"
    found = JSON.parse(URI.open(url).read)['found']
    if found
      @result = "Congratulations! #{@new_game.upcase} is a valid English word!"
    else
      @result = "Sorry but #{@new_game.upcase} does not seem to be a valid English word..."
    end
  end

  def new
    @new_word = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end
end
