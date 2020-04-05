# URL shortener

## How to use

1. Clone this repo
2. Install PostgreSQL in case you don't have it
3. Create your `database.yml` and `application.yml` file
4. `bundle install`
5. Generate a secret key with `rake secret` and paste this value into the `application.yml`.
6. `rails db:create db:migrate`
7. `rspec` and make sure all tests pass
8. `rails s`


## Algorithm used

```ruby
def generate_short_url
  range = (('a'..'z').to_a << ('A'..'Z').to_a << (1..9).to_a).flatten
  characters = (id.to_f/range.size).ceil
  position = id % range.size
  range.combination(characters).to_a[position].join
end
```

1. Generate an array with all the url safe characters.
2. Get the least amount of characters I need to use depending on the id and the amount of available characters.
3. Generate an array of combinations and select the one in the position `id % range.size`
