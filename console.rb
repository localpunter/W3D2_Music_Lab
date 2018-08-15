require('pry-byebug')
require_relative('models/artists.rb')
require_relative('models/albums.rb')

artist1 = Artist.new({
  "name" => "Ian Brown"
  })

artist1.save

artist2 = Artist.new({
  "name" => "David Bowie"
  })

artist2.save

album1 = Album.new({
  "album_name" => "Golden Greats",
  "genre" => "Indie",
  "artist_id" => artist1.id
  })

album1.save

album2 = Album.new({
  "album_name" => "Solarized",
  "genre" => "Indie",
  "artist_id" => artist1.id
  })

album2.save

album3 = Album.new({
  "album_name" => "Heroes",
  "genre" => "Rock",
  "artist_id" => artist2.id
  })

album3.save

album4 = Album.new({
  "album_name" => "Diamond Dogs",
  "genre" => "Rock",
  "artist_id" => artist2.id
  })

album4.save







binding.pry
nil
