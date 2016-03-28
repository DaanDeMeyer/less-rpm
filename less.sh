# less initialization script (sh)
if [ -z "$LESSOPEN" ] && [ -x /usr/bin/lesspipe.sh ]; then
    export LESSOPEN="|/usr/bin/lesspipe.sh %s"
fi
