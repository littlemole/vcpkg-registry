# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#

#vcpkg_from_github(
#    OUT_SOURCE_PATH SOURCE_PATH
#    REPO littlemole/metacpp
#    REF 543042a571126f599c1ab2c02a64d02b8a94cd88
#    SHA512 d9b78c74f7f67ca5d72bdc673f101eceb25f52fe17ff89a7b5c410f40802274a0ed80b103c9e5d6e8c95b36285d19fc36fe5bf0e05c858b53542173cc77632df
#    HEAD_REF main
#    [PATCHES <patch1.patch> <patch2.patch>...]
#)

vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL ssh://marilyn.oha7.org/srv/git/wpp
    REF bc6526b3fc56e6dd806b922a3073650c8063c2a7
    HEAD_REF win32
)


vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    OPTIONS -DWITH_LIBEVENT=Off -DWITH_TEST=Off
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/wpp RENAME copyright)

# cleanup 
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
