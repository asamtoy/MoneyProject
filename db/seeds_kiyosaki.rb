require_relative('../models/tags')
require_relative('../models/transactions')

tag0 = Tag.new({'name' => 'Assets'})
tag1 = Tag.new({'name' => 'Liabilities'})
tag2 = Tag.new({'name' => 'Charity'})

tag0.save
tag1.save
tag2.save

startingamount = Transaction.new({
  'amount' => '480.00',
  'merchant' => "Deposit",
  "tag_id" => tag0.id})

startingamount.save
