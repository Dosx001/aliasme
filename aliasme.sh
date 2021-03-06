#!/usr/bin/env bash

_list() {

	if [ -s ~/.aliasme/cmd ];then
		while read name
		do
			read value
			read cmdType
            echo "$name ($cmdType): $value"
		done < ~/.aliasme/cmd
	fi
}

_add() {
	#read name
	name=$1
	if [ -z $1 ]; then
		read -ep "Input name to add:" name
	fi

	#read path
	cmd="$2"
	if [ -z "$2" ]; then
		read -ep "Input cmd to add:" cmd
	fi

    case $3 in
        "d")
            cmdType="Dynamic";;
        "f")
            cmdType="Fill";;
        "m")
            cmdType="Multi Fill $4";;
        "")
            cmdType="Default";;
        *)
            cmdType="";;
    esac

    echo $name >> ~/.aliasme/cmd
    echo $cmd >> ~/.aliasme/cmd
    echo $cmdType >> ~/.aliasme/cmd
    echo "add: $name -> $cmd"
    _autocomplete
}

_remove() {
	#read name
	name=$1
	if [ -z $1 ]; then
		read -pr "Input name to remove:" name
	fi

	# read and replace file
    if [ -s ~/.aliasme/cmd ];then
        touch ~/.aliasme/cmdtemp
    	while read line
    	do
    		if [ "$line" = "$name" ]; then
    			read line #skip one more line
    			read cmdType
                echo "remove $name"
    		else
    			echo $line >> ~/.aliasme/cmdtemp
    		fi
    	done < ~/.aliasme/cmd
    	mv ~/.aliasme/cmdtemp ~/.aliasme/cmd
    fi
	_autocomplete
}

_excute() {
    if [ -s ~/.aliasme/cmd ];then
        while read -u9 line; do
            if [ "$1" = "$line" ]; then
                read -u9 line
                read -u9 cmdType
                case $cmdType in
                    "Default")
                        eval $line;;
                    "Dynamic")
                        cmds=()
                        for i in $(seq 2 $#); do
                            eval arg=\$$i
                            cmds+=$arg\ 
                        done
                        eval $line $cmds;;
                    "Fill")
                        cmds=()
                        for i in $(seq 2 $#); do
                            eval arg=\$$i
                            cmds+=$arg\ 
                        done
                        eval ${line//\?/$cmds};;
                    *)
                        fills=($cmdType)
                        for i in $(seq 1 ${fills[2]}); do
                            let num=$i+1
                            eval arg=\$$num
                            line=${line//\?$i/$arg}
                        done
                        eval $line;;
                esac
    			return 0
            fi
        done 9< ~/.aliasme/cmd
    fi
	return 1
}

_bashauto()
{
	local cur opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"

	opts=""
    if [ -s ~/.aliasme/cmd ];then
    	while read line
    	do
    		opts+=" $line"
    		read line
    		read line
    	done < ~/.aliasme/cmd
    fi
	COMPREPLY=( $(compgen -W "${opts}" ${cur}) )
	return 0
}

_autocomplete()
{
	if [ $ZSH_VERSION ]; then
		# zsh
		opts=""
        if [ -s ~/.aliasme/cmd ];then
    		while read line
    		do
    			opts+="$line "
    			read line
    		done < ~/.aliasme/cmd
        fi
		compctl -k "($opts)" al
	else
		# bash
		complete -F _bashauto al
	fi
}

_autocomplete

al(){
	if [ ! -z $1 ]; then
        case $1 in
            "ls")
                _list;;
            "add")
                _add $2 "$3" $4 $5;;
            "rm")
                _remove $2;;
            "-h")
                echo "Usage:"
                echo "al add [name] [command] [type] # add alias command with name"
                echo "al rm [name]                   # remove alias by name"
                echo "al ls                          # alias list"
                echo "al [name]                      # execute alias associate with [name]"
                echo "al -v                          # version information"
                echo "al -h                          # help";;
            "-v")
                echo "aliasme 4.0.0"
                echo "visit https://github.com/Dosx001/aliasme for more information";;
            *)
                if ! _excute $@; then
                    echo "not found"
                fi
        esac
	fi
}
