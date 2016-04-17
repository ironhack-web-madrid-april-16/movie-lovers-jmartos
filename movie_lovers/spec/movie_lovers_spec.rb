require 'pry'
require_relative '../lib/movie_lovers.rb'

RSpec.describe "IMDBsearcher" do

  before :all do
    @IMDB = SearchIMDB.new
    @films = @IMDB.search_films  "titanic"
  end

  describe "#searcher_films" do
    it "return an array with the films" do
      expect(@films).to be_truthy
    end
  end

  describe "#check_poster" do 
    it "return the url when the input is 0" do
      expect(@IMDB.check_poster(0)).to be_truthy 
    end
  end

  describe "#load_nine_movies" do 
    it "return an array with 9 movies with poster" do
      expect(@IMDB.load_nine_movies("titanic").size).to eq(9) 
    end
  end
end

