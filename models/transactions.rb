# Need ID, amount, merchant, tag
require_relative('sql_runner')
require_relative('tags')
class Transaction

  attr_accessor :amount, :merchant, :tag
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
    @merchant = options['merchant']
    @tag = options['tags_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (amount, merchant, tags_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@amount, @merchant, @tags_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
