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
    db.close

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



end
