#!/bin/bash
set -e
MYSQL_CONN_C_DIR=$PWD/mysql-connector-c-6.1.5-osx10.7-x86
GCC=$(which gcc-mp-4.8)
GXX=$(which g++-mp-4.8)
prefix=$prefix
PATH=$prefix/libexec/elftoolchain:$PATH
git submodule update --init --recursive --force
time cmake . \
    -Wno-dev \
    -DCMAKE_CXX_COMPILER=$GXX \
    -DCMAKE_C_COMPILER=$GCC \
    -DCMAKE_ASM_COMPILER=$GCC \
    -DLIBIBERTY_LIB=$prefix/lib/gcc48/x86_64/libiberty.a \
    -DCMAKE_PREFIX_PATH=$prefix \
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
    -DLibYaml_INCLUDE_DIRS=$prefix/include \
    -DMYSQL_INCLUDE_DIR=$prefix/include/mysql55/mysql \
    -DMYSQL_LIB=$prefix/lib/mysql55/mysql/libmysqlclient.dylib \
    -DBOOST_INCLUDEDIR=$prefix/include \
    -DBOOST_LIBRARYDIR=$prefix/lib \
    -DBoost_USE_STATIC_LIBS=ON \
    -DPCRE_INCLUDE_DIR=$prefix/include \
    -DPCRE_LIBRARY=$prefix/lib/libpcre.dylib \
    -DREADLINE_INCLUDE_DIR=$prefix/include \
    -DREADLINE_LIBRARY=$prefix/lib/libreadline.dylib \
    -DCURL_INCLUDE_DIR=$prefix/include \
    -DCURL_LIBRARY=$prefix/lib/libcurl.dylib


    # -DMYSQL_INCLUDE_DIR=$MYSQL_CONN_C_DIR/include \
    # -DMYSQL_LIB=$MYSQL_CONN_C_DIR/lib/libmysqlclient.dylib  \

make -j4
    # sudo ln -s freetype2 freetype