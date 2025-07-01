#include "wos_pin.h"

#include WOS_PIN_CONFIG_FILE
#include "wos_pin_enums.h"

int wos_pin_init(void)
{
    WOS_PIN_STATUS rv = WOS_PIN_OK;

    rv += wos_pin_init_gp_input();
    rv += wos_pin_init_gp_output();
    rv += wos_pin_init_uart();
    rv += wos_pin_init_i2c_bus();

    return rv;
}