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

set(VCPKG_POLICY_SKIP_ARCHITECTURE_CHECK enabled)

vcpkg_download_distfile(
    ARCHIVE
	URLS https://www.nuget.org/api/v2/package/Microsoft.Windows.WinMD/1.0.210629.2
    FILENAME winmdparser.zip
    SHA512 1f46183eb1b24cc28eb7bc29e5563d6d5e212737bf41e43c2d422bc9367dd77fb531253b74207075158c3ba57e5f153ab3e458a48276e86ba790a44895cb90d0
)

vcpkg_extract_source_archive( 
	SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    NO_REMOVE_ONE_LEVEL
#   PATCHES <patch>...
#   SOURCE_BASE <base>
#   BASE_DIRECTORY <relative-path> | WORKING_DIRECTORY <absolute-path>
)

set(INC_PATH "${SOURCE_PATH}")

Message("###########################")
Message(${LIB_PATH})
Message(${INC_PATH})
Message("###########################")


# copy headers
file(INSTALL ${INC_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/include/ RENAME winmdparser )

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/winmdparser RENAME copyright)
