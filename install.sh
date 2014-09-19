#!/bin/bash
portindex
port install boost configure.compiler=macports-gcc-4.8
port install binutils oniguruma5 autoconf automake cmake libvpx \
        coreutils \
        libelf tbb libevent \
        libxslt gcc48 mysql55-connector-cpp \
        elftoolchain google-glog libzip \
        protobuf-c protobuf-cpp ncurses pcre binutils

# lz4 package from MacPorts break the compilation

git clone --recursive git://github.com/facebook/hhvm.git
cd hhvm

wget http://www.canonware.com/download/jemalloc/jemalloc-3.6.0.tar.bz2
tar xvf jemalloc-3.6.0.tar.bz2
cd jemalloc-3.6.0

cat <<END | patch -p0 src/jemalloc.c
diff --git a/src/jemalloc.c b/src/jemalloc.c
index bc350ed..8959959 100644
--- a/src/jemalloc.c
+++ b/src/jemalloc.c
@@ -1312,7 +1312,6 @@ je_valloc(size_t size)
 #define        is_malloc_(a) malloc_is_ ## a
 #define        is_malloc(a) is_malloc_(a)
 
-#if ((is_malloc(je_malloc) == 1) && defined(__GLIBC__) && !defined(__UCLIBC__))
 /*
  * glibc provides the RTLD_DEEPBIND flag for dlopen which can make it possible
  * to inconsistently reference libc's malloc(3)-compatible functions
@@ -1325,6 +1324,7 @@ je_valloc(size_t size)
 JEMALLOC_EXPORT void (* __free_hook)(void *ptr) = je_free;
 JEMALLOC_EXPORT void *(* __malloc_hook)(size_t size) = je_malloc;
 JEMALLOC_EXPORT void *(* __realloc_hook)(void *ptr, size_t size) = je_realloc;
+#ifdef JEMALLOC_OVERRIDE_MEMALIGN
 JEMALLOC_EXPORT void *(* __memalign_hook)(size_t alignment, size_t size) =
     je_memalign;
 #endif
END
mv bin/pprof bin/jemalloc-prof
./configure --disable-debug --prefix=/opt/local --with-jemalloc-prefix=
make
cd ..

wget -c http://cdn.mysql.com/Downloads/Connector-C/mysql-connector-c-6.1.5-osx10.7-x86.tar.gz
tar xvf mysql-connector-c-6.1.5-osx10.7-x86.tar.gz

git submodule update --init --recursive --force
source build.sh
