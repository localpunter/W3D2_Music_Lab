require('pg')

class Artist

  attr_reader :id
  attr_accessor :name


  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
  end

  def save()
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1) RETURNING *"
    values = [@name]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def update()
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "UPDATE artists
    SET
    (name)
    = ($1)
    WHERE id = $2"
    values = [@name, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
  db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
  sql = "DELETE FROM artists
  WHERE id = $1"
  values = [@id]
  db.prepare("delete_one", sql)
  db.exec_prepared("delete_one", values)
  db.close()
end

  def album
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    db.prepare("album", sql)
    result = db.exec_prepared("album", values)
    db.close()
    return result[0]
  end




  def Artist.all()
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "SELECT * FROM artists"
    db.prepare("all", sql)
    artists = db.exec_prepared("all")
    db.close()
    return artists.map {|artists| Artist.new(artist)}
  end

  def Artist.find_by_id(id)
    db = PG.connect({ dbname: "music_collection", host: "localhost"})
    sql = "SELECT * FROM artists WHERE id = $1"
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

  def Artist.delete_all()
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM artists"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end



end
