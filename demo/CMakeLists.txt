add_executable(wos_pin_demo 
    wos_pin_demo.c
)

target_include_directories(wos_pin_demo 
    PRIVATE 
        ${WOS_PIN_DIR}
        ${ONELETTER_DIR}
)

target_link_libraries(wos_pin_demo wos_pin)

