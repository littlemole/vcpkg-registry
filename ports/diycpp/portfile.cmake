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
    REPO littlemole/diy
    REF 5e4ceb9dc0c3ecadc9cdcce46e65a0d1adaef3cb
    SHA512 35711fe953c6b8e614b83c90e5edb44ad11bbdf92cf4a6728bb1eba67f4c8c85b60b43bc82e87ad55f05cc68d9bd047b56da9b364f53855335eb4750453dd22a
    HEAD_REF main
#    [PATCHES <patch1.patch> <patch2.patch>...]
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/diycpp RENAME copyright)


 file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
