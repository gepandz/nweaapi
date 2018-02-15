require 'nweaapi'
require 'sqlite3'

class Nweaapi
  class Blog
    attr_accessor :db

    def initialize
      @db = SQLite3::Database.open Pathname.new(__dir__) + '..' + 'resources' + 'blog.db'
    end

    def get_posts
      stm = db.prepare "SELECT * FROM posts"
      stm.execute # Returns a ResultSet, which should look like an Array
    end

    def add_post title, body
      stm = db.prepare "INSERT INTO posts (title, body) VALUES( ?, ? )"
      stm.bind_param 1, title
      stm.bind_param 2, body
      rs = stm.execute
    end
  end
end
