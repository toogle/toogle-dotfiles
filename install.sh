#!/bin/bash

install() {
	echo -n "Install $1 [Y/n]? "
	stty cbreak
	local char=$(dd if=/dev/tty bs=1 count=1 2>/dev/null)
	stty -cbreak

	if [[ $char != '' ]] ; then
		echo
	fi

	shopt -q -s dotglob

	if [[ $char == 'Y' || $char == 'y' || $char = '' ]] ; then
		for file in $1/* ; do
			ln -srf $file $HOME
			basename $file
		done
	fi
}

shopt -q -u dotglob

for dir in */ ; do
	install $(basename $dir)
done
