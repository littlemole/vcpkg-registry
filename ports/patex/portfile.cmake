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

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO littlemole/patex
    REF 9d5ade74760bd2aaacac8de00d7b5cb2991feecf
    SHA512 99cfedb4bf50152d9187b52f5155ff3b21e13588cb40dbbb3dc8e4b05b28ccace015ea50f807f5194f483bfc3b3c0438c5de363be695bf73520d753c4dcd8b0b
    HEAD_REF main
#    [PATCHES <patch1.patch> <patch2.patch>...]
#    [GITHUB_HOST <https://github.com>]
#    [AUTHORIZATION_TOKEN <${SECRET_FROM_FILE}>]
#    [FILE_DISAMBIGUATOR <N>]
)

#include(vcpkg_common_functions)
#set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/patex-0.0.3)
#vcpkg_download_distfile(ARCHIVE
#    URLS "https://github.com/littlemole/patex/archive/0.0.3.tar.gz"
#    FILENAME "patex-0.0.3.tgz"
#    SHA512 99cfedb4bf50152d9187b52f5155ff3b21e13588cb40dbbb3dc8e4b05b28ccace015ea50f807f5194f483bfc3b3c0438c5de363be695bf73520d753c4dcd8b0b
#)
#vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/patex RENAME copyright)


file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
