require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/pizza_order')
require_relative('./models/customer')
also_reload('./models/*')

# Index
get '/pizzas' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# New

get '/pizzas/new' do
  @customers = Customer.all()
  erb(:new)
end

# Show
get '/pizzas/:id' do
  id = params['id'].to_i()
  @order = PizzaOrder.find(id)
  erb(:show)
end

# Create
post '/pizzas' do
  new_order = PizzaOrder.new(params)
  new_order.save
  erb(:create)
end

# Edit - /pizzas/:id/edit - get
get '/pizzas/:id/edit' do
  id = params['id'].to_i()
  @order = PizzaOrder.find(id)
  
  erb(:edit)
end
# Update - /pizzas/:id - (put) POST.


# Destroy - (/pizzas/:id) /pizzas/:id/delete - (delete) Post
post '/pizzas/:id/delete' do
  id = params['id'].to_i()
  p id
  PizzaOrder.delete(id)
  erb(:destroyed)
end
