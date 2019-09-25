class ActorsController < ApplicationController
  def morgan
    @the_actor = Actor.where({ :name => "Morgan Freeman" }).at(0)
    
    # get the actor's ID number
    morgan_id = @the_actor.id
    
    # go to the characters table
    # find the rows where the actor's ID is in the actor_id column
    the_character_rows = Character.where({ :actor_id => morgan_id })

    # get the movie IDs from the characters
    morgan_movie_id_array = the_character_rows.map_relation_to_array(:movie_id)

    # Finally, retrieve the films
    @the_movies = Movie.all.where({ :id => morgan_movie_id_array })
    
    # count them
    @num_films = @the_movies.count

    render({ :template => "actor_templates/freeman.html.erb"})
  end
end