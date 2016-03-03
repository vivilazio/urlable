# Urlable

Urlable is a gem that creates a relation between an Url model and other multiple RoR ActiveRecord models that need an url that could change without losing the previous urls.

So old urls could be redirected to the active one.

This gem was loosely inspired by a similar mechanism present on Drupal.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'urlable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urlable

## Usage

Create the Url model:

```ruby
create_table "urls", force: :cascade do |t|
  t.integer "urlable_id", null: false
  t.string  "urlable_type", null: false
  t.string "dst", null: false
end
```

then in the model that need url you currently need a String field named url:
```ruby
#  url               :string(255)
class Article < ActiveRecord::Base
  acts_as_urlable
end
```

now you can:
```ruby
article = Article.create(title: "foo")
article.link_url "bar"
puts article.url
puts article.urls
article.link_url "foobar"
puts article.url
puts article.urls
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/urlable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
