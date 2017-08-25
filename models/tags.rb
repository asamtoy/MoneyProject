# needs primary key, name
# needs save, create functions
# May as well CRUD them

require_relative('sql_runner')

class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM tags"
    values = []
    tag_data = SqlRunner.run(sql, values)
    tags = map_items(tag_data)
    return tags
  end

  def self.map_items(tag_data)
    return tag_data.map {|tag| Tag.new(tag) }
  end
  

end