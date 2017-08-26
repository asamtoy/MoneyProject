require_relative('../models/tags')
require_relative('../models/transactions')

tag1 = Tag.new({'name' => 'groceries'})
tag2 = Tag.new({'name' => 'books'})
tag3 = Tag.new({'name' => 'clothes'})
tag4 = Tag.new({'name' => 'coffee'})
tag5 = Tag.new({'name' => 'physical skill development'})
tag6 = Tag.new({'name' => 'restaurants'})
tag7 = Tag.new({'name' => 'mountaineering supplies'})
tag8 = Tag.new({'name' => 'rent'})

bank = Tag.new({'name' => 'bank deposit'})

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save
tag6.save
tag7.save
tag8.save

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
