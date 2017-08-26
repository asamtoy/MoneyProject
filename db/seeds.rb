require_relative('../models/tags')
require_relative('../models/transactions')

tag1 = Tag.new({'name' => 'food'})
tag2 = Tag.new({'name' => 'books'})
bank = Tag.new({'name' => 'bank deposit'})
tag1.save
tag2.save
bank.save

startingamount = Transaction.new({
  'amount' => '480',
  'merchant' => "Bank of Alice",
  "tag_id" => bank.id})

transaction1 = Transaction.new({
  'amount' => '7',
  'merchant' => 'British Heart',
  'tag_id' => tag2.id})

transaction3 = Transaction.new({
  'amount' => '17.99',
  'merchant' => 'CoOp',
  'tag_id' => tag1.id})

transaction4 = Transaction.new({
  'amount' => '400',
  'merchant' => 'n/a',
  'tag_id' => bank.id})

transaction1.save
transaction3.save
transaction4.save 
