require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name = "NULL", type = "NULL", db = "NULL", hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type,  db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    Pokemon.new(data[0],data[1],data[2])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, self.id)
  end
end
