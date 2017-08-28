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

get '/transactions/new_spending_category' do
  erb(:new_spending_category_2)
end

post '/transactions' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transactions/sum' do
  erb(:sum)
end

get '/transactions/category_sum' do
  erb(:category_sum)
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'])
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

get '/transactions/all/category/:id' do
  @transactions = Transaction.get_by_category( params[:id])
  category_total = @transactions.sum
  erb(:category_sum_select)
end
