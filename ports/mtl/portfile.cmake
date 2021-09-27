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

#include(vcpkg_common_functions)
#set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/mtl-0.0.1)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO littlemole/mtl
    REF 798a615db0742b9d607babc1c28ccbfba23f56ec
    SHA512 c60c9244c369f197b27491753e37c4143af2b9945aa2744fc9c748c283dce560507a8807c277345676fe26769e08a61e5ad1bfb571020aa55649ec97e187cffa
    HEAD_REF main
)

vcpkg_install_msbuild(
    SOURCE_PATH ${SOURCE_PATH}
    PROJECT_SUBPATH mtlgen/mtlgen.vcxproj
    INCLUDES_SUBPATH MTL/include
    LICENSE_SUBPATH LICENSE
    RELEASE_CONFIGURATION Release
    DEBUG_CONFIGURATION Debug
	ALLOW_ROOT_INCLUDES
#    TARGET Build>
#    TARGET_PLATFORM_VERSION <10.0.15063.0>]
#    [PLATFORM <${TRIPLET_SYSTEM_ARCH}>]
#    [PLATFORM_TOOLSET <${VCPKG_PLATFORM_TOOLSET}>]
#    [OPTIONS </p:ZLIB_INCLUDE_PATH=X>...]
#    [OPTIONS_RELEASE </p:ZLIB_LIB=X>...]
#    [OPTIONS_DEBUG </p:ZLIB_LIB=X>...]
#    [USE_VCPKG_INTEGRATION]
#    [ALLOW_ROOT_INCLUDES | REMOVE_ROOT_INCLUDES]
)

file(COPY ${SOURCE_PATH}/mtlgen/msbuild
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/mtlgen
)

file(COPY ${SOURCE_PATH}/MTL/include/mtl
    DESTINATION ${CURRENT_PACKAGES_DIR}/include/
)


#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
