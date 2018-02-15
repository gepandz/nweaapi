# Nweaapi - The API-based blog

## Installation

Clone the repository to your local system (I'm assuming a *nix-like environment for the examples)

And then execute:

    $ bundle install

If you do not have Ruby and Bundler, please install them via your OS's standard installation system

## Usage

To run the server, execute the following from the root of this repository:

    $ bundle exec ruby lib/nweaapi.rb

To test, open a browser, such as Chrome or Firefox, and access http://localhost:4567/posts via a GET call to see the contents of the database

To insert new posts, send a JSON payload via a POST call to http://localhost:4567/post (I use Postman, but any HTTP driver should work)

To see the new posts, refresh the /posts endpoint noted above.

To reset the database to a clean state, execute:

    $ git checkout resources/blog.db

## Simplifying Assumptions and Known Facts

I make certain simplifying assumptions to keep things implementable in a short period of time:
* No user auth -- if you can access this, then you have the permissions to do so
* I should use the provided blog.db file's main DB and its posts table, which is defined thusly:
```sql
CREATE TABLE posts(
  post_id integer primary key asc autoincrement,
    title string,
      body string

);
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gepandz/nweaapi

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Credits and sources
Resources I reference while writing this, as I haven't written a Sinatra API from scratch in quite a while...:

* https://x-team.com/blog/how-to-create-a-ruby-api-with-sinatra/
* https://github.com/sinatra/sinatra/blob/master/README.md
* https://code.tutsplus.com/tutorials/singing-with-sinatra-the-recall-app--net-19128
* Miscellaneous error reports on StackOverflow
