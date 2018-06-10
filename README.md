# naif_spice
SPICE Toolkit from NAIF. More computer engineering friendly

## Basic project structure:

                      package
                         |
                         |
       +------+------+------+------+------+
       |      |      |      |      |      | 
     data    doc    etc    exe    lib    src
                                          |
                                          |
                         +----------+----------+------- ... ------+
                         |          |          |                  |
                     product_1  product_2  product_3    ...   product_n

## Basic compilation strategy:

1. Compile all of the .c files in the current product directory

2. If there are no .pgm files in the current directory this
   is assumed to be a library source directory.  The name
   of the library is the same as the name of the product 
   (directory name). The library is placed in the "lib" directory
   in the tree above.

3. If any *.pgm files exist in the current directory, compile 
   them and the *.c files. Compile the main program(s) and link
   its object with the previously compiled *.c files, and libraries
   ../../lib/cspice.a and ../../lib/csupport.a. The output 
   executables have an empty extension.  The executables are
   placed in the "exe" directory in the tree above.
         
The environment variable TKCOMPILEOPTIONS containing compile options 
is optionally set. If it is set prior to executing this script,
those options are used. It it is not set, it is set within this
script as a local variable.

All these actions are now handled by the Makefile files coded.
2 action targets are allowed using those Makefiles:
+ all (default action): Compiles all within de current directory
+ clean: Deletes all precompiled objects, libraries and binaries

### Current compilation procedure

Execute "make" on the project root directory and you are done (as
almost any Makefile based project).

It you need to delete those files result of a previous project
generation, just execute "make clean" on the directory you want
to clean (includes sub-directories).

## TODO (Upcoming features and fixes)

+ Support for DESTDIR on Makefiles
+ Target support for system installation (make install)
+ Switch to Autotools building process to handle different architectures
+ Integrate support for all development frameworks
++ C (current status on 64bit, will include also 32bit support)
++ Fortran
++ IDL
++ Java
++ Python
++ We'll see.

## References:

+ [SPICE Toolkit's Homepage](https://naif.jpl.nasa.gov/naif/toolkit.html "SPICE Toolkit's Homepage at NAIF")
+ [SPICE Documentation](https://naif.jpl.nasa.gov/naif/documentation.html "SPICE Documentation at NAIF")
