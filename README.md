# ExtensibleAttrAccessor

Allow `attr_accessor`, `attr_reader`, `attr_writer` to accept blocks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'extensible_attr_accessor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install extensible_attr_accessor

## Usage

`attr_xxx` can make multiple accessor at one line, but they cannot be easily modified.

With this gem, `attr_accessor`, `attr_reader`, `attr_writer` can have a block, and common modification can be applied to multiple accessors.

Without a block, all metamethods call original ones, so this gem causes no impact for existing code.

### Module#attr_reader
When `attr_reader` is used with a block, the block is called when generated methods are called with one parameter (raw value of corresonding instance variable).

The return values of generated methods are the ones from block.

```ruby
  #define getters converting to string
  attr_reader(:foo, :bar){|val| val.to_s }
  
  #shorthand
  attr_reader :foo, :bar, &:to_s
```

### Module#attr_writer
When `attr_writer` is used with a block, the block is called when generated methods are called with one parameter (the input parameter of setter method).

The return value of the block is stored by the setter.

```ruby
  #define setters always capitalizing
  attr_writer(:foo, :bar){|val| val.capitalize }
  
  #shorthand
  attr_writer :foo, :bar, &:capitalize
```

### Module#attr_accessor
Doing above two functionalities in one `attr_accessor`. The block is called with **two** arguments, the first one is value, next one is operation mode (`:get` or `:set`).

I wonder where this method is useful, but made this for completeness.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/jkr2255/extensible_attr_accessor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
