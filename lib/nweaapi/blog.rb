require 'nweaapi'
require 'sqlite3'

class Nweaapi
  class Blog
    attr_accessor :db

    def initialize
      @db = SQLite3::Database.open Pathname.new(__dir__) + '..' + 'resources' + 'blog.db'
    end
  end
end
