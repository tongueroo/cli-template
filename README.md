# ThorTemplate

[![Build Status](https://travis-ci.org/tongueroo/thor_template.svg?branch=generator)](https://travis-ci.org/tongueroo/thor_template)
[![Code Climate](https://codeclimate.com/github/tongueroo/thor_template.png)](https://codeclimate.com/github/tongueroo/thor_template)

Generator that builds a starter cli project which is based on thor.

## Installation

<pre>
$ gem install thor_template
</pre>

## Usage

<pre>
$ thor_template new foo
$ cd foo
$ bin/foo hello world
</pre>

This generates a starter cli project called foo with a working hello command.

## Dashes Problem

Names with dashes don't work quite right with this tool.  For example:

```
thor_template new my-project
```

This results in a some the files and text not being renamed properly.  

I usually work around this by creating a project with the underscore name first:

```
thor_template new my_project
```

Then then I rename 3 spots:

* my_project.gemspec - Change the name from my_project to my-project.  So the gem name has a dash.
* bin/my_project - Change the name from bin/my_project to bin/my-project.  So the binary has a dash.  The require in the file also. 
* lib/my_project.rb - Change the name from lib/my_project.rb to lib/my-project.rb. So if the project is required it is `require my-project`.
* spec/spec_helper.rb - Change the require lib/my_project.rb to lib/my-project.rb. And spec/lib/cli_spec.  So the test passes.
