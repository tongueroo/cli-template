# CLI Template

[![Build Status](https://travis-ci.org/tongueroo/cli-template.svg?branch=generator)](https://travis-ci.org/tongueroo/cli-template)
[![Code Climate](https://codeclimate.com/github/tongueroo/cli-template.png)](https://codeclimate.com/github/tongueroo/cli-template)

`cli-template` is a generator tool that builds a starter CLI project based on [Thor](http://whatisthor.com/). It is the successor tool to [thor_template](https://github.com/tongueroo/thor_template), which is also a tool that generates CLI projects.  The main difference is cli-template allows for namespace commands.  The usage section demonstrates a namespace command below.

The predecessor tool is covered in this original blog post, [Build Thor CLI Project in Under a Second](https://blog.boltops.com/2017/09/14/build-thor-cli-project-in-under-a-second), also covers usage and also contains a video demo.  A update blog post will eventually be made, for now refer to the old blog post.

## Usage

```sh
cli-template new mycli
cd mycli
exe/mycli hello world
exe/mycli sub:goodbye world
```

The above generated a starter CLI project called mycli with a working hello command.  The generated project also has starter specs for you 😁

```sh
$ rake
Mycli::CLI
  mycli
    should hello world
    should goodbye world

Finished in 1.12 seconds (files took 0.71706 seconds to load)
2 examples, 0 failures
```

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
