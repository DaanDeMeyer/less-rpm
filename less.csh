# less initialization script (csh)
if ( -x /usr/bin/lesspipe.sh ) then
  setenv LESSOPEN "|/usr/bin/lesspipe.sh %s"
endif

if ( $?LANG ) then
  if ( `echo $LANG | cut -b 7- | tr -s "[:lower:]" "[:upper:]"` == "EUCJP" ) then
    setenv JLESSCHARSET japanese-euc
  else if ( `echo $LANG | cut -b 7- | tr -s "[:lower:]" "[:upper:]"` == "EUCKR" ) then
    setenv JLESSCHARSET korean
  endif
endif
