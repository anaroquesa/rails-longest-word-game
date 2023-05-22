require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def home
  end

  def new
    alphabet = ('a'..'z').to_a
    @letters = []
    10.times do
      @letters << alphabet.sample
    end
  end

  def score
    word = params[:score].chars
    letters = params[:letters]

    valid_word = true
    word.each do |letter|
      valid_word = false unless letters.include?(letter)
    end

    url = "https://wagon-dictionary.herokuapp.com/"
    checked = JSON.parse(URI.open(url).read)

    if valid_word && checked
      @result = "Congratulations! You did good with #{params[:score]}!"
    else
      @result = "Go home!"
    end

  end

end
