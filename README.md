# aliasme
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/dc29953069bf43438f4abac2629e4b5a)](https://app.codacy.com/app/Jintin/aliasme?utm_source=github.com&utm_medium=referral&utm_content=Jintin/aliasme&utm_campaign=badger)
[![Build Status](https://travis-ci.org/Jintin/aliasme.svg?branch=master)](https://travis-ci.org/Jintin/aliasme)
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/alebcay/awesome-shell)

A shell script to organize your alias in command line.

## Installation

- download script
```bash
  mkdir ~/.aliasme
  curl https://raw.githubusercontent.com/Jintin/aliasme/master/aliasme.sh > ~/.aliasme/aliasme.sh
```
- add alias to your startup script (ex: ~/.bash_profile, ~/.bashrc)
```bash
echo "source ~/.aliasme/aliasme.sh" >> ~/.bash_profile
```

## Usage

```bash
$ al add [name] [value]        # add alias with name and value
$ al rm [name]                 # remove alias by name
$ al ls                        # alias list
$ al [name]                    # execute alias associate with [name]
$ al -v                        # version information
$ al -h                        # help
```

## Contributing
Bug reports and pull requests are welcome on GitHub at [https://github.com/Jintin/aliasme](https://github.com/Jintin/aliasme).

## License
The module is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
