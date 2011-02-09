#!/bin/sh
#
# To use this filter with less, define LESSOPEN:
# export LESSOPEN="|/usr/bin/lesspipe.sh %s"
#
# The script should return zero if the output was valid and non-zero
# otherwise, so less could detect even a valid empty output
# (for example while uncompressing gzipped empty file).
# For backward-compatibility, this is not required by default. To turn
# this functionality there should be another vertical bar (|) straight
# after the first one in the LESSOPEN environment variable:
# export LESSOPEN="||/usr/bin/lesspipe.sh %s"

lesspipe() {
  case "$1" in
  *.[1-9n]|*.man|*.[1-9n].bz2|*.man.bz2|*.[1-9].gz|*.[1-9]x.gz|*.man.gz|*.[1-9].xz|*.[1-9]x.xz|*.man.xz)
	case "$1" in
		*.gz)	DECOMPRESSOR="gzip -dc" ;;
		*.bz2)	DECOMPRESSOR="bzip2 -dc" ;;
	esac
	if [ ! -z "$DECOMPRESSOR" ] ; then
	    if $DECOMPRESSOR -- "$1" | file - | grep -q troff; then
		    if echo "$1" | grep -q ^/; then	#absolute path
			    man -- "$1" | cat -s
		    else
			    man -- "./$1" | cat -s
		    fi
	    else
		    $DECOMPRESSOR -- "$1"
	    fi
	else
	    exit 1
	fi ;;
  *.tar) tar tvvf "$1" ;;
  *.tgz|*.tar.gz|*.tar.[zZ]) tar tzvvf "$1" ;;
  *.tar.xz) tar Jtvvf "$1" ;;
  *.xz) xz -dc -- "$1" ;;
  *.tar.bz2|*.tbz2) bzip2 -dc -- "$1" | tar tvvf - ;;
  *.[zZ]|*.gz) gzip -dc -- "$1" ;;
  *.bz2) bzip2 -dc -- "$1" ;;
  *.lzma) lzma -c -d -- "$1" ;;
  *.zip|*.jar|*.nbm) zipinfo -- "$1" ;;
  *.rpm) rpm -qpivl --changelog -- "$1" ;;
  *.cpi|*.cpio) cpio -itv < "$1" ;;
  *.gif|*.jpeg|*.jpg|*.pcd|*.png|*.tga|*.tiff|*.tif)
	if [ -x /usr/bin/identify ]; then
		identify "$1"
	elif [ -x /usr/bin/gm ]; then
		gm identify "$1"
	else
		echo "No identify available"
		echo "Install ImageMagick or GraphicsMagick to browse images"
	fi ;;
  *)
	exit 1
  esac
  exit $?
}

if [ ! -e "$1" ] ; then
	exit 1
fi

if [ -d "$1" ] ; then
	/bin/ls -alF -- "$1"
	exit $?
else
	lesspipe "$1" 2> /dev/null
fi
