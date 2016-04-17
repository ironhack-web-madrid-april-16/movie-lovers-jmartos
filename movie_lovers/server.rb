# require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'imdb'
require_relative 'lib/movie_lovers.rb'

enable(:sessions)

get "/" do
  redirect("/home")
end

get "/home" do
  erb(:home)
end

post "/search" do
  @nine_films = SearchIMDB.new.load_nine_movies(params[:movie])
  session[:nine_films] = @nine_films

  erb(:show_films)
end

get "/show_movies" do
  erb(:show_film)
end

get "/response" do
    @nine_films = session[:nine_films]
    @years = []
    @nine_films.each do |movie|
    @years.push(movie.year)
  end
    @year = 0   
    @nine_films.each do |movie|   
    @year = movie.year
   end
  erb(:response)
end
