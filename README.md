Portfiles for HHVM
==================

ports including:

- cmake 3.0.2
- patched jemalloc
- hhvm 3.2 with patches
- boost with configure.compiler=macports-gcc-4.8

Register the port source:

    (echo "file:/$PWD [nosync]" && cat /opt/local/etc/macports/sources.conf) > sources.conf
    mv sources.conf /opt/local/etc/macports/sources.conf
    port sync

Register prebuilt archive site

    $ vim /opt/local/etc/macports/archive_sites.conf

    name corneltek
    urls http://packages.corneltek.com

Install HHVM

    port install hhvm-3.2
    port install hhvm-3.2 +hack
