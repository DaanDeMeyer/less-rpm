# Makefile for source rpm: less
# $Id$
NAME := less
SPECFILE = $(firstword $(wildcard *.spec))

include ../common/Makefile.common
