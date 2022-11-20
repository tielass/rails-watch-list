# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

# api_key = '47ea85cd65c8de17aa29476fb6b23955'

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

# Movie.destroy_all

puts "starting"

user["results"].each do |result|
  new_movie = Movie.new(
    title: result["original_title"],
    overview: result["overview"],
    poster_url: result["poster_path"],
    rating: result["vote_average"])
  new_movie.save
  p new_movie
end

puts "done"

# file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
# list = List.new(name: "NES", body: "A great console")
# list.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# list.save

