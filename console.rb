require('pry-byebug')
require_relative('models/artists.rb')
require_relative('models/albums.rb')

artist1 = Artist.new({
  "name" => "Ian Brown"
  })

artist2 - Artist.new({
  "name" => "David Bowie"
  })

  # artist1.save

album1 = Album.new({
  "album_name" => "Golden Greats",
  "genre" => "Indie",
  "artist_id" => artist1.id
  })

album2 = Album.new({
  "album_name" => "Solarized",
  "genre" => "Indie",
  "artist_id" => artist1.id
  })

album3 = Album.new({
  "album_name" => "",
  "genre" => "",
  "artist_id" => artist2.id
  })

album3 = Album.new({
  "album_name" => "",
  "genre" => "",
  "artist_id" => artist2.id
  })







binding.pry
nil
