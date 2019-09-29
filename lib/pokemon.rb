class Pokemon
  attr_accessor :id, :name, :type, :db

  def self.save(name, type, db)
    # if self.id
    #   self.update
    # else

      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL

      db.execute(sql, name, type)
      id = db.execute("SELECT last_insert_rowid() FROM pokemon;")[0][0]
    # end

  end

  def self.find(num, db)
    # finds a pokemon from the database by an id number passed in
    # returns a new Pokemon object
    query_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", num).flatten
    Pokemon.new(id: query_pokemon[0], name: query_pokemon[1], type: query_pokemon[2], db: db)
  end

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

end
