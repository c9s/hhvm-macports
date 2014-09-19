#!/bin/bash
set -e
MYSQL_CONN_C_DIR=$PWD/mysql-connector-c-6.1.5-osx10.7-x86
prefix=/opt/local
PATH=$prefix/libexec/elftoolchain:$PATH
PATH=$prefix/libexec/ocaml3:$PATH
git submodule update --init --recursive --force

# workable revision: 01228273b8cf709aacbd3df1c51b1e690ecebac8
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
    -DBOOST_INCLUDEDIR=$prefix/include \
    -DBOOST_LIBRARYDIR=$prefix/lib \
    -DBoost_USE_STATIC_LIBS=ON \
    -DPCRE_INCLUDE_DIR=$prefix/include \
    -DPCRE_LIBRARY=$prefix/lib/libpcre.dylib  
make -j4

    # -DCURL_INCLUDE_DIR=$prefix/include \
    # -DCURL_LIBRARY=$prefix/lib/libcurl.dylib
    # -DREADLINE_INCLUDE_DIR=$prefix/include \
    # -DREADLINE_LIBRARY=$prefix/lib/libreadline.dylib \


    # -DMYSQL_INCLUDE_DIR=$MYSQL_CONN_C_DIR/include \
    # -DMYSQL_LIB=$MYSQL_CONN_C_DIR/lib/libmysqlclient.dylib  \

make -j4
    # sudo ln -s freetype2 freetype
