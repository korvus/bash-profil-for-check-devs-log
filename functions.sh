#!/bin/bash

function twcommit
{
	grep -lr "console\.log" .
	if [ $? = 1 ]; then
		grep -lr "alert(" .
		if [ $? = 1 ]; then
			git commit -am "$1"
		else
			echo "il y a des alert qui trainent";
		fi	
	else	
		echo "il y a des consoles log qui trainent";
	fi
}
