# less initialization script (csh)
if ( -x /usr/bin/lesspipe.sh ) then
    if ( $?LESSOPEN && { eval 'test ! -z $LESSOPEN' }) then
        setenv LESSOPEN "$LESSOPEN | /usr/bin/lesspipe.sh %s"
    else  
        setenv LESSOPEN "/usr/bin/lesspipe.sh %s"
    endif
endif
