# Change Log

All notable changes to this project will be documented in this file.
This project *tries* to adhere to [Semantic Versioning](http://semver.org/), even before v1.0.

## [3.5.0]
- add .circleci/config.yml: circle 2.0 upgrade
- use rainbow gem for terminal color

## [3.4.0]
- add class Error in generated class
- add cli_markdown and rake docs task
- add possible website url reference to cli help
- change help also available at
- move common commands to base Command class
- move version, completion commands back to the CLI class so subcommands dont inherit them
- override command_help to include description in long_description
- remove unused completion.rb, fix command_help override
- use 4 spaces for cli help

## [3.3.0]
- fix completer for thor group and use public_instance_methods(false)
- fix shared new options for thor group and cli

## [3.2.0]
- Merge pull request #2 from tongueroo/basic: the deafult template is a basic Thor CLI instead of the colon_namespaces one.
- cache eager_load call and handle Thor::InvocationError

## [3.1.0]
- Merge pull request #1 from tongueroo/completions: support for TAB auto-completion
- add completions command to starter project
- add completions:script command

## [3.0.0]
- tool is now called cli-template
- namespaced commands support
- using Thor::Group as the generator

## [2.2.1]
- add -v as a version flag too

## [2.2.0]
- simple help formatting
- add version command

## [2.1.1]

- starter project use version 0.1.0

## [2.1.0]

- improve help class
- comment out SimpleCov
- reanme bin folder to exe

## [2.0.1]

- fix gem name that gets build for the starter project

## [2.0.0]

- Fix project names that are named with dashes and camel case.
- Add legit specs that test each case.

## [1.0.1]

- require "fileutils" fix

## [1.0.0]

- allow --help or -h at the end of the command
- major version bump. been in used and tested for a while now

## [0.0.7]

- Update starter project to use newer ruby syntax
