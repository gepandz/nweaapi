require "nweaapi/version"
require 'sinatra'
require 'data_mapper'

# Connect to our local DB, which is kept at lib/resources/blog.db
# Note: This requires setting up a :default DB at this point
DataMapper::setup(:default, "sqlite://#{Dir.pwd}/resources/blog.db")

# Define a modle object that DataMapper can use to talk to the DB
class Post
  include DataMapper::Resource
  property :post_id, Serial
  property :title, Text
  property :body, Text
end

# We're done defining models, so compile the model so we can use it
DataMapper.finalize

# Offer some pointers to where to go from here
get '/' do
  'This is not a valid endpoint. Please use /post or /posts'
end

get '/posts' do
  @posts = Post.all :order => :post_id.desc
  @posts.to_json
end

post '/post' do
  request.body.rewind # In case someone already read it
  ary = JSON.parse(request.body.read)
  ary.each do |data|
    puts data
    p = Post.new
    p.title = data["title"]
    p.body = data["body"]
    p.save
  end
  return
end
