require "nweaapi/version"
require 'sinatra'
require 'datamapper'

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

