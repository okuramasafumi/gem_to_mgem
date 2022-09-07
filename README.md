# GemToMgem

Convert gems to mgems!

## Installation

Simply run:

    $ gem install gem_to_mgem

## Usage

After installation, `gem_to_mgem` command is available. Cd to the root directory of the target gem and run `gem_to_mgem`. It generates production code and test code under `mgem` directory. You need to move and tweak these files manually if you want to ship mgem.

## TODO

- Create complete mgems from gems, including build scripts.
- Remove some methods that mruby doesn't support (e.g. `public_send`)
- Support RSpec as a testing framework (it should be really hard, though)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/okuramasafumi/gem_to_mgem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/okuramasafumi/gem_to_mgem/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GemToMgem project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/okuramasafumi/gem_to_mgem/blob/master/CODE_OF_CONDUCT.md).
