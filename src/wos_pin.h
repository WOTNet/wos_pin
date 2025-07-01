#pragma once

enum wos_pin_status_enum;
typedef enum wos_pin_status_enum WOS_PIN_STATUS;

enum wos_pin_assignment_enum;
enum wos_pin_i2c_bus_enum;
enum wos_pin_i2c_speed_enum;
enum wos_pin_pad_enum;
enum wos_pin_pull_enum;
enum wos_pin_interrupt_type_enum;
enum wos_pin_output_configuration_enum;
enum wos_pin_drive_strength_enum;
enum wos_pin_uart_enum;
enum wos_pin_baud_enum;

int wos_pin_init(void);

WOS_PIN_STATUS wos_pin_bsp_init_gp_input(enum wos_pin_pad_enum,
                                         enum wos_pin_pull_enum,
                                         enum wos_pin_interrupt_type_enum);

WOS_PIN_STATUS
    wos_pin_bsp_init_gp_output(enum wos_pin_pad_enum,
                               enum wos_pin_output_configuration_enum,
                               enum wos_pin_drive_strength_enum);

WOS_PIN_STATUS wos_pin_bsp_init_uart(enum wos_pin_uart_enum,
                                     enum wos_pin_baud_enum,
                                     enum wos_pin_pad_enum rx,
                                     enum wos_pin_pad_enum tx);

WOS_PIN_STATUS wos_pin_bsp_init_i2c_bus(enum wos_pin_i2c_bus_enum,
                                        enum wos_pin_i2c_speed_enum,
                                        enum wos_pin_pad_enum sda,
                                        enum wos_pin_pad_enum scl);
