# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Movie.destroy_all

movies_id= ["tt4925292","tt0266697", "tt1798709", "tt4954522", "tt0120382", "tt10370710", "tt6751668", "tt2584384", "tt4975722", "tt1226837", "tt3281548", "tt1489887", "tt8110652", ]
movies = []

movies_id.each do |i|
  api_link = "http://www.omdbapi.com/?i=#{i}&apikey=48727053"
  movie_serialized = URI.open(api_link).read
  movie = JSON.parse(movie_serialized)
  movies.push(movie)
end



puts "Seeding..."
movies.each do |i|
  Movie.create(title: i["Title"], overview: i["Plot"], poster_url: i["Poster"] , rating: i["Ratings"][0]["Value"])
end
puts "Seeding done."
