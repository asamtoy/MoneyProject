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

get '/transactions/category_select' do
  @tags = Tag.all
  redirect to "/transactions/all/category/:id"
end


#TAG SHOW

get '/categories' do
  @tags = Tag.all
  erb(:"categories/index")
end

get '/categories/:id' do
  @category = Tag.find( params[:id] )
  @sum = Transaction.sum_by_category( params[:id] )
  puts "sum #{@sum}"
  # category_total = @transactions.to_i.sum
  erb(:"categories/show")
end

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
