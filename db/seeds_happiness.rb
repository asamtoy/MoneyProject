# http://www.bakadesuyo.com/2013/04/6-ways-money-can-buy-happiness/

require_relative('../models/tags')
require_relative('../models/transactions')

tag0 = Tag.new({'name' => 'Small Pleasures'})
tag1 = Tag.new({'name' => 'Fundamental Feelings'})
tag2 = Tag.new({'name' => 'Others'})
tag3 = Tag.new({'name' => 'Time'})
tag4 = Tag.new({'name' => 'Delayed Gratification'})
tag5 = Tag.new({'name' => 'Experiences'})

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
