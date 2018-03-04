# Merger

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/merger`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'merger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install merger

## Usage

Create `Mergefile.json` in directory where you would like your files merged. This file should contain the following:
```
{
  "masks": ["PatternOne.swift", "PatternTwo.swift", "PatternThree.swift"],
  "result_mask": "PatternIO.swift",
  "delete_old_files": false
}
```

|| Parameter || Description ||
| **masks** | Gem will look up for files matching masks you specify in this parameter and then merge them. Do not includ asterisks (`*`). |
| **result_mask** | This mask will be applied to result file. |
| **delete_old_files** | If set to `true` then old files will be removed. |

## Example

Let's say you have lots of files called something like
`FirstViewInput.swift`  
`FirstViewOutput.swift`
`SecondViewInput.swift`
`SecondViewOutput.swift`
etc.

and you want to merge them into single file for each view, something like:
`FirstViewIO.swift`  
`SecondViewIO.swift`

In this case you should create `Mergefile.json` in your project's root directory (or any other which contains files for merging), navigate to this directory in terminal and run command:
`merger merge`


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/merger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Merger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/merger/blob/master/CODE_OF_CONDUCT.md).
