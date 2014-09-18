#!/bin/bash
set -e
MYSQL_CONN_C_DIR=$PWD/mysql-connector-c-6.1.5-osx10.7-x86
GCC=$(which gcc-mp-4.8)
GXX=$(which g++-mp-4.8)
PREFIX=/opt/local
PATH=/opt/local/libexec/elftoolchain:$PATH
git submodule update --init --recursive --force
time cmake . \
    -Wno-dev \
    -DCMAKE_CXX_COMPILER=$GXX \
    -DCMAKE_C_COMPILER=$GCC \
    -DCMAKE_ASM_COMPILER=$GCC \
    -DLIBIBERTY_LIB=$PREFIX/lib/gcc48/x86_64/libiberty.a \
    -DCMAKE_PREFIX_PATH=/opt/local \
    -DCMAKE_INCLUDE_PATH="/opt/local/include/gcc48/c++/parallel:$PREFIX/include:/usr/include" \
    -DCMAKE_LIBRARY_PATH="$PREFIX/lib:/usr/lib" \
    -DLIBDWARF_LIBRARIES=/opt/local/lib/elftoolchain/libdwarf.3.dylib \
    -DLIBDWARF_INCLUDE_DIRS=/opt/local/include/elftoolchain \
    -DLIBEVENT_LIB=$PREFIX/lib/libevent.dylib \
    -DLIBEVENT_INCLUDE_DIR=$PREFIX/include \
    -DLIBVPX_INCLUDE_DIRS=$PREFIX/include \
    -DFREETYPE_INCLUDE_DIRS=/opt/local/include/freetype2 \
    -DFREETYPE_LIBRARIES=/opt/local/lib/libfreetype.dylib \
    -DLIBSQLITE3_INCLUDE_DIR=/opt/local/include \
    -DLIBSQLITE3_LIBRARY=/opt/local/lib/libsqlite3.0.dylib \
    -DLibYaml_INCLUDE_DIRS=/opt/local/include \
    -DMYSQL_INCLUDE_DIR=/opt/local/include/mysql55/mysql \
    -DMYSQL_LIB=/opt/local/lib/mysql55/mysql/libmysqlclient.dylib \
    -DBOOST_INCLUDEDIR=/opt/local/include \
    -DBOOST_LIBRARYDIR=/opt/local/lib \
    -DBoost_USE_STATIC_LIBS=ON \
    -DPCRE_INCLUDE_DIR=/opt/local/include \
    -DPCRE_LIBRARY=/opt/local/lib/libpcre.dylib \
    -DREADLINE_INCLUDE_DIR=/opt/local/include \
    -DREADLINE_LIBRARY=/opt/local/lib/libreadline.dylib \
    -DCURL_INCLUDE_DIR=/opt/local/include \
    -DCURL_LIBRARY=/opt/local/lib/libcurl.dylib


    # -DMYSQL_INCLUDE_DIR=$MYSQL_CONN_C_DIR/include \
    # -DMYSQL_LIB=$MYSQL_CONN_C_DIR/lib/libmysqlclient.dylib  \

make -j4
    # sudo ln -s freetype2 freetype
