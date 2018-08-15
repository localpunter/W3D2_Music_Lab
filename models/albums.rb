require("pg")
require_relative("artists.rb")

class Album

attr_reader :id, :artist_id
attr_accessor :album_name, :genre

  def initialize(data)
    @id = data['id'].to_i if data['id']
    @album_name = data['album_name']
    @genre = data['genre']
    @artist_id = data['artist_id'].to_i if data['artist_id']

  end

  def save()
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "INSERT INTO albums
        (album_name, genre, artist_id)
        VALUES
        ($1, $2, $3) RETURNING *"
    values = [@album_name, @genre, @artist_id]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def update()
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "UPDATE albums
    SET
    (album_name, genre, artist_id)
    = ($1, $2, $3)
    WHERE id = $4"
    values = [@album_name, @genre, @artist_id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

  def artist
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "SELECT * FROM artists
           WHERE artist_id = $1"
    values = [@artist_id]
    db.prepare("artist", sql)
    result = db.exec_prepared("artist", values)
    db.close()
    return result[0]
  end


  

  def Album.all()
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "SELECT * FROM albums"
    db.prepare("all", sql)
    albums = db.exec_prepared("all")
    db.close()
    return albums.map {|albums| Album.new(album)}
  end

  def Album.find_by_id(id)
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  db.prepare("find_by_id", sql)
  result = db.exec_prepared("find_by_id", values)
  db.close()
  if result.count > 0
    return result[0]
  else
    return nil
  end
end



end
