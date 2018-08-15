require('pry-byebug')
require_relative('models/artists.rb')
require_relative('models/albums.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "name" => "Ian Brown"
  })

artist1.save

artist2 = Artist.new({
  "name" => "David Bowie"
  })

artist2.save

artist3 = Artist.new({
  "name" => "Lady Gaga"
  })

artist3.save

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

album5 = Album.new({
  "album_name" => "The Fame",
  "genre" => "Pop",
  "artist_id" => artist3.id
  })

album5.save

album6 = Album.new({
  "album_name" => "Artpop",
  "genre" => "Pop",
  "artist_id" => artist3.id
  })

album6.save







binding.pry
nil
