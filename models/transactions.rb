require_relative('sql_runner')
class Transaction

  attr_accessor :amount, :merchant, :tag_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
    @merchant = options['merchant']
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (amount, merchant, tag_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@amount, @merchant, @tag_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def tag()
    tag = Tag.find(@tag_id)
    return tag
  end

  def update()
    sql = "UPDATE transactions
    SET
    (amount, merchant, tag_id)
    =
    ($1, $2, $3)
    WHERE id = $4"
    values = [ (@amount * (-1)), @merchant, @tag_id, @id ]
    SqlRunner.run(sql, values)
  end

def delete()
  sql = "DELETE FROM transactions
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM transactions"
  values = [ ]
  transaction_data = SqlRunner.run(sql, values)
  transactions = map_items(transaction_data)
  return transactions
end

def self.map_items(transaction_data)
  return transaction_data.map {|transaction| Transaction.new(transaction)}
end

def self.find(id)
  sql = "SELECT * FROM transactions
  WHERE id = $1"
  values = [id]
  result = SqlRunner.run(sql, values).first
  transaction = Transaction.new(result)
  return transaction
end

# potentially dodgy; doing at 10 p.m...

def self.sum()
  sql = "SELECT sum(amount) AS total FROM transactions"
  values = [ ]
  result = SqlRunner.run(sql, values)[0]["total"].to_f
  return result
end

def self.sum()
  sql = "SELECT merchant, count(*) FROM transactions GROUP BY merchant"
  values = [ ]
  result = SqlRunner.run(sql, values)[0]["total"].to_f
  return result
end

end
