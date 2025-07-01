cmake_minimum_required(VERSION 3.20)

project(wos_pin LANGUAGES C)

include(FetchContent)
set(FETCHCONTENT_BASE_DIR ${PROJECT_SOURCE_DIR}/wos CACHE PATH "" FORCE)

FetchContent_Declare(OneLetter
    GIT_REPOSITORY 
        https://github.com/wideopensource/oneletter.git
    GIT_TAG 
        af003c7085b97a20cface858277e2b60c0c432a4       
)

FetchContent_MakeAvailable(OneLetter)

set(ONELETTER_DIR ${FETCHCONTENT_BASE_DIR}/oneletter-src)
set(WOS_PIN_DIR ${PROJECT_SOURCE_DIR}/src)
set(WOS_PIN_CONFIG_FILE "${PROJECT_SOURCE_DIR}/demo/wos_pin_config.h")

add_subdirectory(demo)
add_subdirectory(src)

enable_testing()

