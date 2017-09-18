[![Build Thor CLI Project in Under a Second](https://img.youtube.com/vi/KFbu04eQ-b0/0.jpg)](https://www.youtube.com/watch?v=GcVhdoneZYk)

# ThorTemplate

[![Build Status](https://travis-ci.org/tongueroo/thor_template.svg?branch=generator)](https://travis-ci.org/tongueroo/thor_template)
[![Code Climate](https://codeclimate.com/github/tongueroo/thor_template.png)](https://codeclimate.com/github/tongueroo/thor_template)

This is a generator tool that builds a starter cli project based on thor.

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

## Dashes Problem

Names with dashes don't work quite right with this tool.  For example:

```
thor_template new my-project
```

This results in some the files and text not being renamed correctly.  I usually work around this by creating a project with the underscored name first:

```
thor_template new my_project
```

Then I rename things 3 spots:

* my_project.gemspec - Change the name from my_project to my-project.  So the gem name has a dash.
* bin/my_project - Change the name from bin/my_project to bin/my-project.  So the binary has a dash.  The require in the file also needs to be fixed.
* lib/my_project.rb - Change the name from lib/my_project.rb to lib/my-project.rb. So if the project is required it is `require my-project`.
* spec/spec_helper.rb - Change the require lib/my_project.rb to lib/my-project.rb. And spec/lib/cli_spec.  So the test passes.

Hope to fix this one day! Also, pull request are appreciated!
