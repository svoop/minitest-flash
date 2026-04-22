[![Version](https://img.shields.io/gem/v/minitest-flash.svg?style=flat)](https://rubygems.org/gems/minitest-flash)
[![Tests](https://img.shields.io/github/actions/workflow/status/svoop/minitest-flash/test.yml?style=flat&label=tests)](https://github.com/svoop/minitest-flash/actions?workflow=Test)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/svoop/minitest-flash.svg?style=flat)](https://codeclimate.com/github/svoop/minitest-flash/)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/svoop.svg)](https://github.com/sponsors/svoop)

# Minitest::Flash

Simple Minitest reporter to indicate the result of test runs in as fancy a way you like. Here's how I like it: Flash the screen in green or red and play a short sound effect.

* [Homepage](https://github.com/svoop/minitest-flash)
* Author: [Sven Schwyn - Bitcetera](https://bitcetera.com)

Thank you for supporting free and open-source software by sponsoring on [GitHub](https://github.com/sponsors/svoop) or on [Donorbox](https://donorbox.com/bitcetera). Any gesture is appreciated, from a single Euro for a ☕️ cup of coffee to 🍹 early retirement.

## Install

Add the following to the <tt>Gemfile</tt> or <tt>gems.rb</tt> of your [Bundler](https://bundler.io) powered Ruby project:

```ruby
gem 'minitest-flash'
```

And then install the bundle:

```
bundle install
```

Make sure you load plugins in `test_helper.rb` or `spec_helper.rb`:

```ruby
Minitest.load_plugins
```

## Usage

After every test run, the reporter simply invokes the `minitest-flash` executable:

* `minitest-flash green` if the run passed
* `minitest-flash red` if the run failed or has errors

It's your job to create the `minitest-flash` executable to your liking and to place it somewhere in the `PATH`.

Other people might work on the same code and prefer not use `minitest-flash`. This is no problem as it won't do a thing unless a `minitest-flash` executable exists.

## Example

I'm on macOS and like things to be as obvious and unobtrusive as possible: Flash the screen border either in green or red and optionally play a sound effect.

![example](https://github.com/svoop/minitest-flash/raw/main/doc/example.gif)

Here's what my `/usr/local/bin/minitest-flash` executable looks like:

```zsh
#!/bin/zsh

typeset -A flash_args
flash_args=(
  [green]="0 200 0 8 2"
  [red]="200 0 0 8 2"
)

if [ -z "$MINITEST_NO_FLASH" ]; then
  border-flash ${=flash_args[$1]} &
fi

if [ -z "$MINITEST_NO_SOUND" ]; then
  mpg123 $0.d/$1.mp3 2>/dev/null &
fi
```

As you see, the sound or flash effects can easily be muted with:

```zsh
export MINITEST_NO_FLASH=1
export MINITEST_NO_SOUND=1
```

For the above to work, you have to install the following additional tools and files.

### border-flash

Follow the simple install instructions of [border-flash](https://github.com/svoop/border-flash).

### mpg123

This is easiest installed through [Homebrew](https://brew.sh/):

```zsh
brew install mpg123
```

The sound files are also necessary:

```zsh
sudo mkdir /usr/local/bin/minitest-flash.d
sudo wget -P /usr/local/bin/minitest-flash.d/green.mp3 https://github.com/svoop/minitest-flash/raw/main/doc/green.mp3
sudo wget -O /usr/local/bin/minitest-flash.d/red.mp3 https://github.com/svoop/minitest-flash/raw/main/doc/red.mp3
```

## Development

To install the development dependencies and then run the test suite:

```
bundle install
bundle exec rake    # run tests once
bundle exec guard   # run tests whenever files are modified
```

You're welcome to [submit issues](https://github.com/svoop/minitest-flash/issues) and contribute code by [forking the project and submitting pull requests](https://docs.github.com/en/get-started/quickstart/fork-a-repo).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
