#include "wos_pin.h"
#include "wos_pin_config.h"
#include "wos_pin_enums.h"

#include <stdio.h>

WOS_PIN_STATUS
wos_pin_bsp_init_gp_input(enum wos_pin_pad_enum pad,
                          enum wos_pin_pull_enum pull,
                          enum wos_pin_interrupt_type_enum interrupt_type)
{
    printf("GP INPUT %s @ %d (%s), pull: %s, interrupt type: %s\r\n",
           wos_pin_pad_to_string(pad), pad,
           wos_pin_assignment_to_string(wos_pin_pad_get_assignment(pad)),
           wos_pin_pull_to_string(pull),
           wos_pin_interrupt_type_to_string(interrupt_type));

    return WOS_PIN_OK;
}

WOS_PIN_STATUS wos_pin_bsp_init_gp_output(
    enum wos_pin_pad_enum pad,
    enum wos_pin_output_configuration_enum output_configuration,
    enum wos_pin_drive_strength_enum drive_strength)
{
    printf("GP OUTPUT %s @ %d (%s), output configuration: %s, drive strength: "
           "%s\r\n",
           wos_pin_pad_to_string(pad), pad,
           wos_pin_assignment_to_string(wos_pin_pad_get_assignment(pad)),
           wos_pin_output_configuration_to_string(output_configuration),
           wos_pin_drive_strength_to_string(drive_strength));

    return WOS_PIN_OK;
}

WOS_PIN_STATUS wos_pin_bsp_init_uart(enum wos_pin_uart_enum uart,
                                     enum wos_pin_baud_enum baud,
                                     enum wos_pin_pad_enum rx,
                                     enum wos_pin_pad_enum tx)
{
    printf("UART %d (%s), baud: %s, rx pin: %d, tx pin: %d\r\n", uart,
           wos_pin_uart_to_string(uart), wos_pin_baud_to_string(baud), rx, tx);

    return WOS_PIN_OK;
}

WOS_PIN_STATUS wos_pin_bsp_init_i2c_bus(enum wos_pin_i2c_bus_enum i2c_bus,
                                        enum wos_pin_i2c_speed_enum speed,
                                        enum wos_pin_pad_enum sda,
                                        enum wos_pin_pad_enum scl)
{
    printf("I2C bus %d (%s), speed: %s, sda pin: %d, scl pin: %d\r\n", i2c_bus,
           wos_pin_i2c_bus_to_string(i2c_bus),
           wos_pin_i2c_speed_to_string(speed), sda, scl);

    return WOS_PIN_OK;
}

int main(void)
{
    return wos_pin_init();
}