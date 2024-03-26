[![Version](https://img.shields.io/gem/v/minitest-flash.svg?style=flat)](https://rubygems.org/gems/minitest-flash)
[![Tests](https://img.shields.io/github/actions/workflow/status/svoop/minitest-flash/test.yml?style=flat&label=tests)](https://github.com/svoop/minitest-flash/actions?workflow=Test)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/svoop/minitest-flash.svg?style=flat)](https://codeclimate.com/github/svoop/minitest-flash/)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/svoop.svg)](https://github.com/sponsors/svoop)

# Minitest::Flash

Simple Minitest reporter to indicate the result of test runs in as fancy a way you like. Here's how I like it: Flash the macOS menu bar in green or red and play a short and mutable sound effect.

* [Homepage](https://github.com/svoop/minitest-flash)
* Author: [Sven Schwyn - Bitcetera](https://bitcetera.com)

Thank you for supporting free and open-source software by sponsoring on [GitHub](https://github.com/sponsors/svoop) or on [Donorbox](https://donorbox.com/bitcetera). Any gesture is appreciated, from a single Euro for a ☕️ cup of coffee to 🍹 early retirement.

## Install

This gem is [cryptographically signed](https://guides.rubygems.org/security/#using-gems) in order to assure it hasn't been tampered with. Unless already done, please add the author's public key as a trusted certificate now:

```
gem cert --add <(curl -Ls https://raw.github.com/svoop/minitest-flash/main/certs/svoop.pem)
```

Add the following to the <tt>Gemfile</tt> or <tt>gems.rb</tt> of your [Bundler](https://bundler.io) powered Ruby project:

```ruby
gem 'minitest-flash'
```

And then install the bundle:

```
bundle install --trust-policy MediumSecurity
```

Finally, require this gem in your `test_helper.rb` or `spec_helper.rb`:

```ruby
require 'minitest/flash'
```

## Usage

After every test run, the reporter simply invokes the `minitest-flash` executable:

* `minitest-flash green` if the run passed
* `minitest-flash red` if the run failed or has errors

It's your job to create the `minitest-flash` executable to your liking and to place it somewhere in the `PATH`.

Other people might work on the same code and prefer not use `minitest-flash`. This is no problem as it won't do a thing unless a `minitest-flash` executable exists.

## Example

I'm on macOS and like things to be as obvious and unobtrusive as possible: Flash the menu bar either in green or red and optionally play a sound effect.

![Screenshot](https://github.com/svoop/minitest-flash/raw/main/doc/screenshot.gif)

Here's what my `/usr/local/bin/minitest-flash` executable looks like:

```zsh
#!/bin/zsh

declare -A colors
colors[red]=bb0000
colors[green]=00bb00

if [ -z "$MINITEST_FLASH_NO_SOUND" ]; then
  mpg123 $0.d/$1.mp3 2>/dev/null &
fi

for i in {1..2}; do
  $0.d/ChangeMenuBarColor SolidColor "$colors[$1]" >/dev/null
  $0.d/ChangeMenuBarColor SolidColor "000000" >/dev/null
done
```

As you see, the sound effects can easily be muted with:

```zsh
export MINITEST_FLASH_NO_SOUND=1
```

For the above to work, you have to install `mpg123` easiest through [Homebrew](https://brew.sh/):

```zsh
brew install mpg123
```

A few support files are also necessary, let's create the directory for them:

```zsh
sudo mkdir /usr/local/bin/minitest-flash.d
```

In there you have to put three files:

* the latest binary release of [ChangeMenuBarColor](https://github.com/igorkulman/ChangeMenuBarColor)
* a [sound file `green.mp3`](https://github.com/svoop/minitest-flash/raw/main/doc/green.mp3) for successful runs
* a [sound file `red.mp3`](https://github.com/svoop/minitest-flash/raw/main/doc/red.mp3) for failed or errored runs

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
