bin_PROGRAMS = \
scdd \
lcdd \
redcheck \
fourier \
projection \
adjacency \
allfaces \
testcdd1 \
testshoot \
testcdd2 \
testlp1 \
testlp2 \
testlp3
#cddmathlink

scdd_SOURCES                   = simplecdd.c
lcdd_SOURCES                   = lcdd.c
redcheck_SOURCES               = redcheck.c
fourier_SOURCES                = fourier.c
projection_SOURCES             = projection.c
adjacency_SOURCES              = adjacency.c
allfaces_SOURCES               = allfaces.c
testcdd1_SOURCES               = testcdd1.c
testshoot_SOURCES              = testshoot.c
testcdd2_SOURCES               = testcdd2.c
testlp1_SOURCES                = testlp1.c
testlp2_SOURCES                = testlp2.c
testlp3_SOURCES                = testlp3.c
# cddmathlink_SOURCES                = cddmathlink.c cddmlio.h cddmlio.c

LDADD        = ../lib-src/libcdd.la
AM_CPPFLAGS  = -I../lib-src -UGMPRATIONAL
# AM_CPPFLAGS is added before CPPFLAGS so
# if -DGMPRATIONAL is in CPPFLAGS it is not removed.
# However, AM_CFLAGS is added after CFLAGS so it has an effect
AM_CFLAGS   = -UGMPRATIONAL
