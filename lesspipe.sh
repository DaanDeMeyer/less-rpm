#!/bin/sh
#
# To use this filter with less, define LESSOPEN:
# export LESSOPEN="|/usr/bin/lesspipe.sh %s"

lesspipe() {
  case "$1" in
  *.1.gz|*.2.gz|*.3.gz|*.4.gz|*.5.gz|*.7.gz|*.8.gz|*.9.gz|*.n.gz|*.man.gz)
    if gunzip -c "$1" |file - |grep troff &>/dev/null; then
      gunzip -c "$1" |groff -s -p -t -e -Tlatin1 -mandoc -
    fi ;;
  *.1.bz2|*.2.bz2|*.3.bz2|*.4.bz2|*.5.bz2|*.7.bz2|*.8.bz2|*.9.bz2|*.n.bz2|*.man.bz2)
    if bunzip2 -c "$1" |file - |grep troff &>/dev/null; then
      bunzip2 -c "$1" |groff -s -p -t -e -Tlatin1 -mandoc -
    fi ;;
  *.tar) tar tvvf "$1" 2>/dev/null ;; # View contents of .tar and .tgz files
  *.tgz) tar tzvvf "$1" 2>/dev/null ;;
  *.tar.gz) tar tzvvf "$1" 2>/dev/null ;;
  *.tar.bz2) bzip2 -dc "$1" | tar tvvf - 2>/dev/null ;;
  *.tar.Z) tar tzvvf "$1" 2>/dev/null ;;
  *.tar.z) tar tzvvf "$1" 2>/dev/null ;;
  *.Z) gzip -dc "$1"  2>/dev/null ;; # View compressed files correctly
  *.z) gzip -dc "$1"  2>/dev/null ;;
  *.gz) gzip -dc "$1"  2>/dev/null ;;
  *.bz2) bzip2 -dc "$1"  2>/dev/null ;;
  *.zip) unzip -l "$1" 2>/dev/null ;;
  *.rpm) rpm -qpivl "$1" 2>/dev/null ;; # view contents of .rpm files
  *.1|*.2|*.3|*.4|*.5|*.6|*.7|*.8|*.9|*.n|*.man) FILE=`file -L "$1"` ; # groff src
    FILE=`echo "$FILE" | cut -d ' ' -f 2`
    if [ "$FILE" = "troff" ]; then
      groff -s -p -t -e -Tascii -mandoc "$1"
    fi ;;
  esac
}

lesspipe "$1"

