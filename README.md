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

## References:

[SPICE Toolkit's Homepage](https://naif.jpl.nasa.gov/naif/toolkit.html "SPICE Toolkit's Homepage at NAIF")
[SPICE Documentation](https://naif.jpl.nasa.gov/naif/documentation.html "SPICE Documentation at NAIF")
