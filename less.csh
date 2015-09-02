#!/bin/csh
# less initialization script (csh)
if ( -x /usr/bin/lesspipe.sh ) then
    if ( $?LESSOPEN && { eval 'test ! -z "$LESSOPEN"' } ) then
        :
    else  
        setenv LESSOPEN "|/usr/bin/lesspipe.sh %s"
    endif
endif
