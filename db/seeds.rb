require_relative('../models/tags')
require_relative('../models/transactions')

tag1 = Tag.new({'name' => 'food'})
tag2 = Tag.new({'name' => 'books'})

tag1.save
tag2.save

transaction1 = Transaction.new({
  'amount' => '7',
  'merchant' => 'British Heart',
  'tag_id' => tag2.id})

transaction3 = Transaction.new({
  'amount' => '17.99',
  'merchant' => 'CoOp',
  'tag_id' => tag1.id})

transaction1.save
transaction3.save
