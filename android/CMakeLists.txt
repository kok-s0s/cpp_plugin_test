cmake_minimum_required(VERSION 3.4.1)

add_library(cxxToFFI
    # Sets the library as a shared library.
    SHARED
    # Provides a relative path to your source file(s).
    cpp/CxxToFFI.cpp cpp/Cxx.cpp cpp/Person.cpp cpp/SendMessage.cpp
)