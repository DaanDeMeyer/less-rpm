# less initialization script (sh)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"

if [ x`echo $LANG | cut -b 7- | tr -s "[:lower:]" "[:upper:]"` = x"EUCJP" ]; then
        export JLESSCHARSET=japanese-euc
elif [ x`echo $LANG | cut -b 7- | tr -s "[:lower:]" "[:upper:]"` = x"EUCKR" ]; then
        export JLESSCHARSET=korean
fi
