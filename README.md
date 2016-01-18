# aliasme
[![Build Status](https://travis-ci.org/Jintin/aliasme.svg?branch=master)](https://travis-ci.org/Jintin/aliasme)

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
al add [name] [value]        # add alias with name and value
al rm [name]                 # remove alias by name
al ls                        # alias list
al [name]                    # execute alias associate with [name]
al -v                        # version information
al -h                        # help
```

## Contributing
Bug reports and pull requests are welcome on GitHub at [https://github.com/Jintin/aliasme](https://github.com/Jintin/aliasme).

## License
The module is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
