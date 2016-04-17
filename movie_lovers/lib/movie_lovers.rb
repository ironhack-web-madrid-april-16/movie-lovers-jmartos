require 'imdb'


class SearchIMDB
  attr_accessor :films, :nine_films
   def initialize 
     @films = []
     @nine_films = []
   end
 
   def search_films name_film
     @films = Imdb::Search.new(name_film) 
   end
 
   def check_poster index
     @films.movies[index].poster != nil
   end
 
   def load_nine_movies name_film
     search_films name_film
     index_min = 0
     index_max = 9
     while index_min < index_max && index_min < @films.movies.size
       if check_poster index_min
         @nine_films.push @films.movies[index_min]
       else
         index_max = index_max + 1
       end
       index_min = index_min + 1
     end
     @nine_films
   end
end



