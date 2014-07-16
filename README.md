commit with log checks
======================

little function in bash script to use with git, for avoiding to commit some typical tricky devs logs, as alert, console.log or var_dump.
It merge the function `git commit -am "comments"` with the `grep -lr` command into new one called `twcommit`.
If there is, it return a warning and don't commit. If you want to commit despite the warnings, just use the classical command git commit!

One argument is mandatory, coming from git commit command, is the comment following it.

You just have to paste this in your `.bash_aliases` shell file.

```
	function twcommit
	{
		grep -lr "console\.log" .
		if [ $? = 1 ]; then
			grep -lr "alert(" .
			if [ $? = 1 ]; then
				git commit -am "$1"
			else
				echo "Still some alert() in your code";
			fi	
		else	
			echo "still some console.log in your code";
		fi
	}
```