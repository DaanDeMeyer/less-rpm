# less initialization script (sh)
if [ -x /usr/bin/lesspipe.sh ] && [ -z "$LESSOPEN" ]; then
    export LESSOPEN="|/usr/bin/lesspipe.sh %s"
fi
