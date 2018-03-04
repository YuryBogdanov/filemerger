# Filemerger  

[![Gem Version](https://badge.fury.io/rb/filemerger.svg)](https://badge.fury.io/rb/filemerger)  
Merger is a simple gem for merging files matching specified name patterns.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'filemerger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filemerger

## Usage

Create `Mergefile.yaml` in directory where you would like your files merged. This file should contain the following:
```yaml
# Specify which files should be merged. The gem will look up for files matching patterns you input here.
# Do not use asterisk (*).
# Example:
# masks:
#   - 'PatternOne.swift'
#   - 'PatternTwo.swift'
#   - 'PatternThree.swift'

masks:
  - 'PatternOne.swift'
  - 'PatternTwo.swift'
  - 'PatternThree.swift'

# Specify which prefix should contain newly created files (which contain merged content)
# Example:
# result_mask: 'PatternIO.swift'
result_mask: 'PatternIO.swift'

# Specify if files should be deleted after merge
delete_old_files: true

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/filemerger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Filemerger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/filemerger/blob/master/CODE_OF_CONDUCT.md).
