get '/post/:id' do
  #this route will get a single particular post
  @post = Post.find_by_id(params[:id])
  erb :post
end

get '/create_post' do
  @post = Post.new
erb :create_post
end

post '/create_post' do
 #this will allow you to create a new post
 #ability to create tags
 @post = Post.create(params)

# @post = Post.new(params)

if @post.save
 redirect '/'
else
  erb :create_post
  end
end

get '/edit_post/:id' do
  @post = Post.find_by_id(params[:id])
 erb :edit_post
end

post '/edit_post/:id' do
  # @post = Post.find_by_id(params[:id])
  @post = Post.update(params[:id], :title => params[:title], :author => params[:author], :body => params[:body])
  redirect "/post/#{@post.id}"
end

get '/delete_post/:id' do
   #delete an existing post
   post = Post.find(params[:id])
   post.destroy

redirect '/'
end
