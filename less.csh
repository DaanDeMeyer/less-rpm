# less initialization script (csh)
if ( -x /usr/bin/lesspipe.sh ) then
  setenv LESSOPEN "|/usr/bin/lesspipe.sh %s"
endif

if ( $?LANG ) then
  if ( `echo $LANG | cut -b 1-2` == "ja" ) then
    setenv JLESSCHARSET japanese
  endif
endif
