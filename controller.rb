require('sinatra')
require('sinatra/contrib/all')
require_relative('models/tags')
require_relative('models/transactions')

get '/' do
  erb(:homepage)
end

get '/transactions' do
  erb(:homepage)
end

get '/transactions/all' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transactions/new' do
  @tags = Tag.all
  erb(:new)
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/sum' do
  erb(:sum)
end

post '/transactions/delete_all' do
  Transaction.delete_all
  redirect to '/transactions'
end

#TAG SHOW

get '/categories' do
  @tags = Tag.all
  erb(:"categories/index")
end

get '/categories/:id' do
  @tags = Tag.all
  @category = Tag.find( params[:id] )
  # @tag = Tag.find( params[:id])
  @sum = Transaction.sum_by_category( params[:id] )
  puts "sum #{@sum}"
  # category_total = @transactions.to_i.sum
  erb(:"categories/show")
end

# /categories/show?

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:show)
end

get '/transactions/:id/edit' do
  @tags = Tag.all
  @transaction = Transaction.find(params['id'])
  erb(:edit)
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions/#{params['id']}"
end

post '/transactions/:id/delete' do
  transaction = Transaction.find( params[:id] )
  transaction.delete()
  redirect to '/transactions'
end
