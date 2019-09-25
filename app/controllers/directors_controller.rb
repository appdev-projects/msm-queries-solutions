class DirectorsController < ApplicationController
  def last
    @youngest = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc }).
      at(0)

    render({ :template => "director_templates/youngest" })
  end

  def under_55
    fifty_five_years_ago = Time.now - 55.years

    @young_directors = Director.
    all.
    where("dob > ?", fifty_five_years_ago).
    order({ :dob => :desc })

    render({ :template => "director_templates/young" })
  end

  def francis
    # @the_director = Director.where({ :name => "Francis Ford Coppola" }).at(0)
    
    @the_director = Director.where("name LIKE ?", "%Francis%Coppola%").at(0)

    # get the director's ID number
    francis_id = @the_director.id
    
    # go to the movie table
    # find the rows where the director's ID is in the director_id column
    @the_movies = Movie.where({ :director_id => francis_id })
    
    # count them
    @num_films = @the_movies.count

    render({ :template => "director_templates/coppola.html.erb" })
  end
end