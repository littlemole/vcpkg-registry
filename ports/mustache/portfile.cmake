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
    REPO kainjow/Mustache
    REF 04277d5552c6e46bee41a946b7d175a660ea1b3d
    SHA512 5251393f5d31bee04fa57e56fff9c232be35e7b930ca68d9bdd9605a3fda81edb43dc7c7a996d09b854cb50fbcb5b93820ac994331118c53575e75d14ba1f88b
    HEAD_REF main
#    [PATCHES <patch1.patch> <patch2.patch>...]
)


file(INSTALL ${SOURCE_PATH}/mustache.hpp DESTINATION ${CURRENT_PACKAGES_DIR}/include/)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/Mustache RENAME copyright)


 file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
