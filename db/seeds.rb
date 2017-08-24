require_relative('../models/tags')
require_relative('../models/transactions')

tag1 = Tag.new({'name' => 'food'})
tag2 = Tag.new({'name' => 'books'})

tag1.save
tag2.save

transaction1 = Transaction.new({'amount' => '7.50', 'merchant' => 'British Heart', 'tag' => 'books'})

transaction1.save 
