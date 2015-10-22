# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all

users = []
bands = []
albums = []
tracks = []

5.times do |i|
  users << User.create!(email: "User#{i}", password: "password#{i}")
end


5.times do |i|
  bands << Band.create!(name: "Band#{i}")
end

5.times do |i|
  albums << Album.create!(title: "The Wall #{i}", band_id: bands[i].id, rtype: "Studio")
end

3.times do |i|
  albums << Album.create!(title: "The Dark Side of the M#{i}#{i}n", band_id: bands.first.id, rtype: %w(Live Studio).sample)
end

8.times do |i|
  5.times do |j|
    tracks << Track.create!(title: "Title#{j} of #{albums[i].title}", track_type: %w( Regular Bonus ).sample, album_id: albums[i].id)
  end
end
