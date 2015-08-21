#!/bin/zsh
# less initialization script (sh)
if [[ -x /usr/bin/lesspipe.sh ]] ; then
    if [[ -z "$LESSOPEN" ]] ; then
        export LESSOPEN="/usr/bin/lesspipe.sh %s"
    else
        export LESSOPEN="$LESSOPEN | /usr/bin/lesspipe.sh %s"
    fi
fi

echo $LESSOPEN
