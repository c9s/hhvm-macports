#!/bin/bash
set -e
prefix=/opt/local
time cmake . \
    -Wno-dev \
    -DCMAKE_CXX_COMPILER=$(which g++-mp-4.8) \
    -DCMAKE_C_COMPILER=$(which gcc-mp-4.8) \
    -DCMAKE_ASM_COMPILER=$(which gcc-mp-4.8) \
    -DLIBIBERTY_LIB=$prefix/lib/gcc48/x86_64/libiberty.a \
    -DCMAKE_PREFIX_PATH=$prefix \
    -DCMAKE_INSTALL_PREFIX=$prefix \
    -DCMAKE_INCLUDE_PATH="$prefix/include/gcc48/c++/parallel:$prefix/include:/usr/include" \
    -DCMAKE_LIBRARY_PATH="$prefix/lib:/usr/lib" \
    -DLIBDWARF_LIBRARIES=$prefix/lib/elftoolchain/libdwarf.3.dylib \
    -DLIBDWARF_INCLUDE_DIRS=$prefix/include/elftoolchain \
    -DLIBEVENT_LIB=$prefix/lib/libevent.dylib \
    -DLIBEVENT_INCLUDE_DIR=$prefix/include \
    -DLIBVPX_INCLUDE_DIRS=$prefix/include \
    -DFREETYPE_INCLUDE_DIRS=$prefix/include/freetype2 \
    -DFREETYPE_LIBRARIES=$prefix/lib/libfreetype.dylib \
    -DLIBSQLITE3_INCLUDE_DIR=$prefix/include \
    -DLIBSQLITE3_LIBRARY=$prefix/lib/libsqlite3.0.dylib \
    -DJEMALLOC_INCLUDE_DIR=$prefix/include \
    -DJEMALLOC_LIB=$prefix/lib/libjemalloc.dylib \
    -DLibYaml_INCLUDE_DIRS=$prefix/include \
    -DMYSQL_INCLUDE_DIR=$prefix/include/mysql55/mysql \
    -DMYSQL_LIB=$prefix/lib/mysql55/mysql/libmysqlclient.dylib \
    -DBoost_USE_STATIC_LIBS=ON \
    -DBoost_DEBUG=ON \
    -DBoost_LIBRARY_DIR=${prefix}/boost-gcc/lib \
    -DBoost_INCLUDE_DIR=${prefix}/boost-gcc/include \
    -DBOOST_ROOT=${prefix}/boost-gcc \
    -DBOOST_INCLUDEDIR=${prefix}/boost-gcc/include \
    -DBOOST_LIBRARYDIR=${prefix}/boost-gcc/lib \
    -DPCRE_INCLUDE_DIR=$prefix/include \
    -DPCRE_LIBRARY=$prefix/lib/libpcre.dylib  
make -j4
