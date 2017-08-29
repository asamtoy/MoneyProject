require_relative('../models/tags')
require_relative('../models/transactions')

tag0 = Tag.new({'name' => 'Deposit'})
tag1 = Tag.new({'name' => 'Mental Health'})
tag2 = Tag.new({'name' => 'Physical Health'})
tag3 = Tag.new({'name' => 'Social Health'})
tag4 = Tag.new({'name' => 'Spiritual Health'})
tag5 = Tag.new({'name' => 'Luxuries'})

tag0.save
tag1.save
tag2.save
tag3.save
tag4.save
tag5.save

startingamount = Transaction.new({
  'amount' => '480.00',
  'merchant' => "Deposit",
  "tag_id" => tag0.id})

startingamount.save
