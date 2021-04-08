# aliasme
A shell script to organize and execute static and dynamic bash alias in the command line.

## Installation

- download script
```bash
  mkdir ~/.aliasme
  curl https://raw.githubusercontent.com/Dosx001/aliasme/main/aliasme.sh > ~/.aliasme/aliasme.sh
```
- add alias to your startup script (ex: ~/.bash_profile, ~/.bashrc)
```bash
echo "source ~/.aliasme/aliasme.sh" >> ~/.bash_profile
```

## Usage

### Opitions
```bash
$ al add [name] [command] [type] # add alias command with name
$ al rm [name]                   # remove alias by name
$ al ls                          # list all alias
$ al [name]                      # execute alias associate with [name]
$ al -v                          # version information
$ al -h                          # help
```

### Default Commands
```bash
$ al add push "git push"
$ al push
$ al add push "git push -f"
$ al pushf
$ al ls
push (Default): git push
pushf (Default): git push -f
```

### Dynamic Commands
```bash
$ al add dyanmic "echo" d
$ al dynamic 1
1

$ al dynamic 1 2
1 2

$ al dynamic "a" "b" "c" "d"
a b c d
```
### Fill Commands
```bash
$ al add wordCount "cat ? | wc -w" f
$ al wordCount file
10

$ al wordCount file2
15

$ al wordCount file3
5

$ al wordCount file file2
25

$ al wordCount file1 file2 file3
30
```
```bash
$ al add convert "mv ?.md ?.txt" f
$ ls
README.md

$ al convert README
$ ls
README.txt
```

### Multi Fill Commands
```bash
$ al add echoer "echo ?2 ?3 ?1" m 3
$ al echoer 1 2 3
2 3 1

$ al echoer "1st" "2nd" "3rd"
2nd 3rd 1st

$ al add Echo "echo ?1 ?3 ?4 ?2 ?1 ?3" m 4
$ al Echo "1st" "2nd" "3rd" "4th"
1st 3rd 4th 2nd 1st 3rd
```

```bash
$ al add copy "cp ?1.txt ?2.txt" m 2
$ ls
file.txt

$ al copy file new
$ ls
file.txt new.txt
```

## Contributing
Bug reports and pull requests are welcome on GitHub at [https://github.com/Dosx001/aliasme](https://github.com/Dosx001/aliasme).

## License
The module is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
