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
    REPO sheredom/utest.h
    REF 97236c14007916ebb4522d7e7290c242cc372d41
    SHA512 5f49ed89afd7946c772af0b0e66cbf202a565ebe13d2fee0eaec84bc6c1bda51b0fca3e30794151ace95082a128c1605f7387a677395e493b2bba1e13c5ab653
    HEAD_REF main
#    [PATCHES <patch1.patch> <patch2.patch>...]
)


file(INSTALL ${SOURCE_PATH}/utest.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/ )

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/utest RENAME copyright)


#file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
