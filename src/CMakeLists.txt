add_library(wos_pin 
    wos_pin.c
    wos_pin_enums.c
)

target_include_directories(wos_pin 
    PRIVATE 
        ${ONELETTER_DIR}
)

target_compile_options(wos_pin
    PRIVATE
        -save-temps=obj 
        -DWOS_PIN_CONFIG_FILE="${WOS_PIN_CONFIG_FILE}"
)