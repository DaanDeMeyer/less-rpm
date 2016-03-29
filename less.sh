# less initialization script (sh)

# All less.*sh files should have the same semantics!

if [ -z "$LESSOPEN" ] && [ -x /usr/bin/lesspipe.sh ]; then
    export LESSOPEN="|/usr/bin/lesspipe.sh %s"
fi
