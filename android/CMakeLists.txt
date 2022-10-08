cmake_minimum_required(VERSION 3.4.1)

add_library(hello
    # Sets the library as a shared library.
    SHARED
    # Provides a relative path to your source file(s).
    cpp/hello.cpp
)