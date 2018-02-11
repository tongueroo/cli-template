# CLI Template

[![CircleCI](https://circleci.com/gh/tongueroo/cli-template.svg?style=svg)](https://circleci.com/gh/tongueroo/cli-template)
[![Maintainability](https://api.codeclimate.com/v1/badges/c6c4f26aaafccab10baf/maintainability)](https://codeclimate.com/github/tongueroo/cli-template/maintainability)

`cli-template` is a generator tool that builds a starter CLI project based on [Thor](http://whatisthor.com/). It is the successor tool to [thor_template](https://github.com/tongueroo/thor_template), which is also a tool that generates CLI projects.

The predecessor tool is covered in this original blog post, [Build Thor CLI Project in Under a Second](https://blog.boltops.com/2017/09/14/build-thor-cli-project-in-under-a-second). It covers usage and also contains a video demo.  An updated blog post will eventually be made, for now, refer to the original blog post.

The generated CLI project comes with:

* example passing specs
* auto-completion

## Usage

```sh
cli-template new mycli
cd mycli
exe/mycli hello world
exe/mycli sub:goodbye world # namespaced command with colons
```

The above generated a starter CLI project called `mycli` with a working hello command.  The created project also has starter specs for you 😁

```sh
$ rake
Mycli::CLI
  mycli
    should hello world
    should goodbye world

Finished in 1.12 seconds (files took 0.71706 seconds to load)
2 examples, 0 failures
```

## Release

Once you are satisfied with the CLI tool, you can release it as a gem.

    1. edit the mycli.gemspec
    2. edit lib/mycli/version.rb
    3. update the CHANGELOG.md

And run:

```
rake release
```

When installed as a gem, you no longer have to prepend exe in front of the command.  For example, `exe/mycli` becomes the `mycli` command.

## Different starter templates

There are 2 different templates that the tool generates from:

1. basic thor project: A standard CLI tool based on basic usage of Thor.
2. colon namespaced project: The generated CLI project still uses Thor but it does some manipulation in order to allow defining namespaced methods with colons instead of spaces.  Example: `mycli sub:command` vs `mycli sub command`.

To use the different templates:

```
TEMPLATE=colon_namespaces cli-template new mycli
TEMPLATE=default cli-template new mycli
cli-template new mycli # same as TEMPLATE=default
```

## Auto Completion (Experimental)

There is experimental support for TAB completion in the newly generated CLI project.  To enable auto completion, add this to `~/.bashrc` or `~/.profile`:

    eval $(mycli completions:script)

Remember to re-load the shell. Note, the auto completion will only work if the cli command is avaialble in your PATH.  You can do this by installing the gem.  You can also create a wrapper bash script that calls to your development cli command like so:

```
cat > /usr/local/bin/mycli << 'EOL'
#!/bin/bash
exec ~/src/mycli/exe/mycli "$@"
EOL
chmod a+x /usr/local/bin/mycli
```

Issues with auto completion:

1. Slow. This because the generated CLI invokes autoloading when it detects the methods for the completion words. Constructive ideas on speeding this would be appreciated!
2. Does not work with colons currently.  Will have to look into this post [Bash Command-Line Tab Completion Colon Character
](https://stackoverflow.com/questions/25362968/bash-command-line-tab-completion-colon-character).
3. Does not work with the last two characters are `--`.

## Installation

```sh
gem install cli-template
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
