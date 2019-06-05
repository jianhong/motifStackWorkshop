# Makefile
#
# Unix Makefile for PHYLIP 3.696

PACKAGE=phylip
VERSION=3.696

# We use GNU's version of the make utility. It may be called "gmake" on
# your system.
#
# If you're using a RedHat Linux system with default locations for 
# gcc libraries, you probably don't need to change anything. You might
# might change the first noncomment statement below to redefine $(EXEDIR)
# if you'd like your executables installed in a different location than
# our default.
#
# Users with systems that differ substantially from ours may need to set
# the following variables: $(CC) $(CFLAGS) $(DFLAGS) $(LIBS) $(DLIBS)
#
# When uncompressed and extracted, the tar archive phylip-3.6x.tar.gz 
# produces the following directory structure:
#
#   phylip-3.6x/src -- the source code, including this Makefile
#   phylip-3.6x/exe -- executables, changed by changing $(EXEDIR) value
#   phylip-3.6x/doc -- html documentation
#
#  To use the PHYLIP v3.6 Makefile, type from the phylip-3.6x/src directory:
#
#      make install         to compile the whole package and install
#                           the executables in $(EXEDIR), and then
#                           remove the object files to save space
#
#      make all             to compile the whole package but not install it
#                           or remove the object files. 
#
#      make put             to move the executables into $(EXEDIR)
#
#      make clean           to remove all object files and executables from the
#                           current directory
#
#      make dnaml           to compile and link one program, (in this example,
#                           DnaML) and leave the executable and object files
#                           in the current directory (where the source code is).
#                           You will have to move the executable into the
#                           executables directory (e.g. "mv dnaml ../exe")
#                           Note that the program name should be lower case.
# 
# ----------------------------------------------------------------------------
#  (Starting here is the section where you may want to change things)
# ----------------------------------------------------------------------------
#
#
# ----------------------------------------------------------------------------
#
# The following statements set these variables:
#
#    CC     -- the name (and, optionally, location) of your C compiler
#    CFLAGS -- compiler directives needed to compile most programs
#    DFLAGS -- compiler directives needed to compile draw programs
#    LIBS   -- non-default system libraries needed to compile most programs
#    DLIBS  -- non-default system libraries needed to compile draw programs
#
# We've provided a set of possible values for each variable.
#
# The value used is the one without a "#" at the beginning of the line.
#
# To try an alternate value, make sure the one you want has no "#"
# as its first character and that all other possibilities have "#" for
# their first character.
#
# Advanced users may need to further edit one of the alternatives in
# order to correctly compile on their system.
#
# ----------------------------------------------------------------------------
#
# The next two assignments are the invocations of the compiler
#
# This one specifies the "cc" C compiler
#CC        = cc
#
#  To use GCC instead:
CC        = gcc
#
# ----------------------------------------------------------------------------
#
# This is the CFLAGS statement. It specifies compiler behavior.
#
# Here are some possible CFLAGS statements:
#
#
#A minimal one
CFLAGS =
#
# A basic one for debugging
#CFLAGS  = -g 
#
# An optimized one for gcc
#CFLAGS  = -O3 -DUNX -fomit-frame-pointer
#
# For some serious debugging using Gnu gcc
#
#CFLAGS=-g -DUNX -Wall -Wmain -Wmissing-prototypes -Wreturn-type -Wstrict-prototypes  -Wunused -Werror -Wredundant-decls -Waggregate-return -Wcast-align -Wcomment
#
# For doing code coverage with gcov
#
#CFLAGS	=	-ggdb -DUNX -fprofile-arcs -ftest-coverage
#CFLAGS	=	-pg -DUNX
#
# For Digital Alpha systems with Compaq Tru64 Unix
# (however, be aware that this may cause floating-point problems in programs
#  like Dnaml owing to not using IEEE floating point standards).
#CFLAGS = -fast -DUNX
#
# ----------------------------------------------------------------------------
#
# This is the DFLAGS statement. It specifies compiler behavior for the
# programs drawgram and drawtree. It adds additional information to
# the $(CFLAGS) value if needed.
#
DFLAGS = $(CFLAGS)
#
# ----------------------------------------------------------------------------
#
# Most of the programs need only the math libraries, specified like this;
#
LIBS    = -lm
#
# The drawing programs may also need access to the graphics libraries. This is
# specified with the DLIBS variable.
DLIBS  = $(LIBS)
#
# ----------------------------------------------------------------------------
#  (After this point there should not be any reason to change anything)
# ----------------------------------------------------------------------------
#
#
# the list of programs
# draw programs are listed last since they are the most likely to cause
# compilation or linking problems

PROGS   =	neighbor
#
# general commands
#

#  The first target it executed if you just type "make".  It tells you how to
#  use the Makefile.
#
help:
	@echo ""
	@echo " To use the PHYLIP v3.6 Makefile, type"
	@echo "     make all           to compile the whole package but not install it"
	@echo "                          or remove the object files"
	@echo "     make clean         to remove all object files and executables from the"
	@echo "                          current directory"
	@echo " "

introduce:
	@echo "Building PHYLIP version $(VERSION)"

all:        introduce $(PROGS)
	@echo "Finished compiling."
	@echo ""

clean:
	@echo "Removing object files to save space"
	@rm -f *.o
	@echo "Finished removing object files.  Now will remove"
	@echo "executable files from the current directory, but not from the"
	@echo "executables directory.  (If some are not here, the makefile"
	@echo "will terminate with an error message but this is not a problem)"
	@echo ""
	@echo "Removing executables from this directory"
	@rm -f $(PROGS)
	@echo "Finished cleanup."
	@echo ""

#
# compile object files shared between programs
# (make's implicit rule for %.o will take care of these)
#

phylip.o:     phylip.h
seq.o:        phylip.h seq.h
disc.o:       phylip.h disc.h
discrete.o:   phylip.h discrete.h
dollo.o:      phylip.h dollo.h
wagner.o:     phylip.h wagner.h
dist.o:       phylip.h dist.h
cont.o:       phylip.h cont.h
mlclock.o:    phylip.h mlclock.h
moves.o:      phylip.h moves.h
printree.o:   phylip.h printree.h

#
# compile the individual programs
#

neighbor.o:        neighbor.c dist.h phylip.h

neighbor:        neighbor.o dist.o phylip.o
	$(CC) $(CFLAGS) neighbor.o dist.o phylip.o $(LIBS) -o neighbor

# Makefile
