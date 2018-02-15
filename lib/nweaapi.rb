require "nweaapi/version"
require "nweaapi/blog"
require 'sinatra'
require 'datamapper'

DataMapper::setup(:default, "sqlite://#{Dir.pwd}/resources/blog.db")

class Post
  include DataMapper::Resource
  property :post_id, Serial
  property :title, Text
  property :body, Text
end

DataMapper.finalize

get '/' do
  'This is not a valid endpoint. Please use /post or /posts'
end

