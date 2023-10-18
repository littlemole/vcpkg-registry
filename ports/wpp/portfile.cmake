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
    REPO littlemole/wpp
    REF ddba5caac7ba7971f353ddfc7d17500178ff2af6
    SHA512 f2f15e1529b582d84ad41d31e89f1befa7d3b0df5238c5b9848bce555ef7b737f39ac7e2a4054932fcfffa9f703c58adc7dc98c3ae234b8e7e646e89399b5a48
    HEAD_REF main
   # [PATCHES <patch1.patch> <patch2.patch>...]
)

#vcpkg_from_git(
#    OUT_SOURCE_PATH SOURCE_PATH
#    URL ssh://example.org/srv/git/wpp
#    REF d8d928f49a0653f514bd5a97b55ee1cfabb0b98e
#    HEAD_REF win32
#)


vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
      libevent WITH_LIBEVENT
      test WITH_TEST
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    OPTIONS  ${FEATURE_OPTIONS} # -DWITH_LIBEVENT=Off -DWITH_TEST=Off
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_install_cmake()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/wpp RENAME copyright)

# cleanup 
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
