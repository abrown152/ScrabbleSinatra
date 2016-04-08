require 'sinatra'
require_relative 'lib/score'
require_relative 'lib/score_many'

class MyScoring < Sinatra::Base

  get '/' do
    @page_title = "Scrabble Scoring"
    erb :index
  end

  get '/score' do
    @page_title = "Score A Word"
    erb :score
  end

  get '/score_many' do
    @page_title = "Score Many Words"
    erb :score_many
  end

  post '/score' do
    @page_title = "Score A Word"
    @word = Scrabble::Word.new(params["word_hash"]["word"])
    erb :score
  end

  post '/score_many' do
  @page_title = "Score Many Words"
  @wordone = Scrabble::WordOne.new(params["word_hash"]["wordone"])
  @wordtwo = Scrabble::WordTwo.new(params["word_hash"]["wordtwo"])
  @wordthree = Scrabble::WordThree.new(params["word_hash"]["wordthree"])

  erb :score_many
  end

  run!
end
