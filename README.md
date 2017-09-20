[![Build Thor CLI Project in Under a Second](https://img.youtube.com/vi/GcVhdoneZYk/0.jpg)](https://www.youtube.com/watch?v=GcVhdoneZYk)

# ThorTemplate

[![Build Status](https://travis-ci.org/tongueroo/thor_template.svg?branch=generator)](https://travis-ci.org/tongueroo/thor_template)
[![Code Climate](https://codeclimate.com/github/tongueroo/thor_template.png)](https://codeclimate.com/github/tongueroo/thor_template)

This is a generator tool that builds a starter CLI project based on [Thor](). This blog post covers it: [Build Thor CLI Project in Under a Second](https://blog.boltops.com/2017/09/14/build-thor-cli-project-in-under-a-second)

## Installation

```sh
gem install thor_template
```

## Usage

```sh
thor_template new foo
cd foo
bin/foo hello world
```

The above generated a starter cli project called foo with a working hello command.  The generated project also has starter specs for you 😁

```sh
$ rake
rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb
Foo::CLI
  foo
    should hello world

Finished in 0.09672 seconds (files took 0.20945 seconds to load)
1 example, 0 failures
$
```
