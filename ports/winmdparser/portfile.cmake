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
	URLS https://globalcdn.nuget.org/packages/microsoft.windows.winmd.1.0.210629.2.nupkg
    FILENAME winmdparser.zip
    SHA512 3221a94d9d4c66b7f2ec56e59f84fde3d27d7a6962064f2f56a169a2b09aefd018219525e2099500d4c2c8051c8c2977
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

