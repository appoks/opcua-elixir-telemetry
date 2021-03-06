#check environment variable
if(NOT ENV{MBEDTLS_FOLDER_INCLUDE} STREQUAL "") 
    set(MBEDTLS_FOLDER_INCLUDE "$ENV{MBEDTLS_FOLDER_INCLUDE}")
endif()
if(NOT ENV{MBEDTLS_FOLDER_LIBRARY} STREQUAL "")
    message(STATUS "ENTRE")
    set(MBEDTLS_FOLDER_LIBRARY "$ENV{MBEDTLS_FOLDER_LIBRARY}")
endif()

find_path(MBEDTLS_INCLUDE_DIRS mbedtls/ssl.h HINTS ${MBEDTLS_FOLDER_INCLUDE})

if(UA_BUILD_OSS_FUZZ)
    # oss-fuzz requires static linking of libraries
    set(MBEDTLS_LIBRARY /usr/lib/x86_64-linux-gnu/libmbedtls.a)
    set(MBEDX509_LIBRARY /usr/lib/x86_64-linux-gnu/libmbedx509.a)
    set(MBEDCRYPTO_LIBRARY /usr/lib/x86_64-linux-gnu/libmbedcrypto.a)
else()
    find_library(MBEDTLS_LIBRARY mbedtls HINTS ${MBEDTLS_FOLDER_LIBRARY})
    find_library(MBEDX509_LIBRARY mbedx509 HINTS ${MBEDTLS_FOLDER_LIBRARY})
    find_library(MBEDCRYPTO_LIBRARY mbedcrypto HINTS ${MBEDTLS_FOLDER_LIBRARY})
endif()

add_library(mbedtls UNKNOWN IMPORTED)
set_property(TARGET mbedtls PROPERTY IMPORTED_LOCATION "${MBEDTLS_LIBRARY}")
add_library(mbedx509 UNKNOWN IMPORTED)
set_property(TARGET mbedx509 PROPERTY IMPORTED_LOCATION "${MBEDX509_LIBRARY}")
add_library(mbedcrypto UNKNOWN IMPORTED)
set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION "${MBEDCRYPTO_LIBRARY}")

set(MBEDTLS_LIBRARIES mbedtls mbedx509 mbedcrypto)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MBEDTLS DEFAULT_MSG
        MBEDTLS_INCLUDE_DIRS MBEDTLS_LIBRARY MBEDX509_LIBRARY MBEDCRYPTO_LIBRARY)

mark_as_advanced(MBEDTLS_INCLUDE_DIRS MBEDTLS_LIBRARY MBEDX509_LIBRARY MBEDCRYPTO_LIBRARY)
