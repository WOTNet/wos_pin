#pragma once

#include "X.h"

#define X_ENUM_NAME wos_pin_status
#define X_ITEM_PREFIX WOS_PIN_STATUS
#define X_ITEMS(X)                                                             \
    X(OK, )                                                                    \
    X(ERROR, = -1)
#include "X_enum.h"

#define WOS_PIN_OK WOS_PIN_STATUS_OK
#define WOS_PIN_ERROR WOS_PIN_STATUS_ERROR
typedef enum wos_pin_status_enum WOS_PIN_STATUS;

#define X_ENUM_NAME wos_pin_pad
#define X_ITEM_PREFIX WOS_PIN_PAD
#define X_ITEMS(X) WOS_PIN_PAD_LIST(X)
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_assignment
#define X_ITEM_PREFIX WOS_PIN_ASSIGNMENT
#define X_ITEMS(X) WOS_PIN_ASSIGNMENT_LIST(X)
#define X_PRESERVE
#include "X_enum.h"

enum wos_pin_pad_enum wos_pin_assignment_get_pad(X_ENUM_TYPE pin)
#ifdef X_ENUM_IMPL
{
    switch (pin)
    {
#define X(PinName, PinNumber, PadName, ...)                                    \
    case X_ITEM_NAME(PinName):                                                 \
        return WOS_PIN_PAD_##PadName;
        X_ITEMS(X)
#undef X
    default:
        return WOS_PIN_PAD_INVALID;
    }
}
#else
    ;
#endif

X_ENUM_TYPE wos_pin_pad_get_assignment(enum wos_pin_pad_enum pad)
#ifdef X_ENUM_IMPL
{
    switch (pad)
    {
#define X(PinName, PinNumber, PadName, ...)                                    \
    case WOS_PIN_PAD_##PadName:                                                \
        return X_ITEM_NAME(PinName);
        X_ITEMS(X)
#undef X
    default:
        return X_INVALID_ITEM;
    }
}
#else
    ;
#endif
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_pull
#define X_ITEM_PREFIX WOS_PIN_PULL
#define X_ITEMS(X)                                                             \
    X(NONE, )                                                                  \
    X(UP, )                                                                    \
    X(DOWN, )
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_interrupt_type
#define X_ITEM_PREFIX WOS_PIN_INTERRUPT_TYPE
#define X_ITEMS(X)                                                             \
    X(NONE, )                                                                  \
    X(RISING, )                                                                \
    X(FALLING, )                                                               \
    X(EDGE, )                                                                  \
    X(LOW, )                                                                   \
    X(HIGH, )
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_gp_input
#define X_ITEM_PREFIX WOS_PIN_GP_INPUT
#define X_ITEMS(X) WOS_PIN_GP_INPUT_LIST(X)
#define X_PRESERVE
#include "X_enum.h"

WOS_PIN_STATUS wos_pin_init_gp_input(void)
#ifdef X_ENUM_IMPL
{
    int rv = WOS_PIN_OK;

#define X(PinName, PinNUmber, Pull, Int, ...)                                  \
    rv += wos_pin_bsp_init_gp_input(                                           \
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_##PinName),              \
        WOS_PIN_PULL_##Pull, WOS_PIN_INTERRUPT_TYPE_##Int);
    X_ITEMS(X)
#undef X

    return rv;
}
#else
    ;
#endif
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_output_configuration
#define X_ITEM_PREFIX WOS_PIN_OUTPUT_CONFIGURATION
#define X_ITEMS(X)                                                             \
    X(OPEN_DRAIN, )                                                            \
    X(PUSH_PULL, )
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_drive_strength
#define X_ITEM_PREFIX WOS_PIN_DRIVE_STRENGTH
#define X_ITEMS(X)                                                             \
    X(LOW, )                                                                   \
    X(MEDIUM, )                                                                \
    X(HIGH, )                                                                  \
    X(VERY_HIGH, )
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_gp_output
#define X_ITEM_PREFIX WOS_PIN_GP_OUTPUT
#define X_ITEMS(X) WOS_PIN_GP_OUTPUT_LIST(X)
#define X_PRESERVE
#include "X_enum.h"

WOS_PIN_STATUS wos_pin_init_gp_output(void)
#ifdef X_ENUM_IMPL
{
    int rv = WOS_PIN_OK;

#define X(PinName, PinNUmber, OutputConfiguration, DriveStrength, ...)         \
    rv += wos_pin_bsp_init_gp_output(                                          \
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_##PinName),              \
        WOS_PIN_OUTPUT_CONFIGURATION_##OutputConfiguration,                    \
        WOS_PIN_DRIVE_STRENGTH_##DriveStrength);
    X_ITEMS(X)
#undef X

    return rv;
}
#else
    ;
#endif
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_baud
#define X_ITEM_PREFIX WOS_PIN_BAUD
#define X_ITEMS(X)                                                             \
    X(2400, )                                                                  \
    X(4800, )                                                                  \
    X(9600, )                                                                  \
    X(38400, )                                                                 \
    X(56700, )                                                                 \
    X(115200, )
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_uart
#define X_ITEM_PREFIX WOS_PIN_UART
#define X_ITEMS(X) WOS_PIN_UART_LIST(X)
#define X_PRESERVE
#include "X_enum.h"

WOS_PIN_STATUS wos_pin_init_uart(void)
#ifdef X_ENUM_IMPL
{
    int rv = WOS_PIN_OK;

#define X(Name, UartNumber, Baud, PinRX, PinTX, ...)                           \
    rv += wos_pin_bsp_init_uart(                                               \
        X_ITEM_NAME(Name), WOS_PIN_BAUD_##Baud,                                \
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_##PinRX),                \
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_##PinTX));
    X_ITEMS(X)
#undef X

    return rv;
}
#else
    ;
#endif
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_i2c_speed
#define X_ITEM_PREFIX WOS_PIN_I2C_SPEED
#define X_ITEMS(X)                                                             \
    X(100K, )                                                                  \
    X(400K, )
#include "X_enum.h"

#define X_ENUM_NAME wos_pin_i2c_bus
#define X_ITEM_PREFIX WOS_PIN_I2C_BUS
#define X_ITEMS(X) WOS_PIN_I2C_BUS_LIST(X)
#define X_PRESERVE
#include "X_enum.h"

WOS_PIN_STATUS wos_pin_init_i2c_bus(void)
#ifdef X_ENUM_IMPL
{
    int rv = WOS_PIN_OK;

#define X(Name, BusNumber, Speed, PinSDA, PinSCL, ...)                         \
    rv += wos_pin_bsp_init_i2c_bus(                                            \
        X_ITEM_NAME(Name), WOS_PIN_I2C_SPEED_##Speed,                          \
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_##PinSDA),               \
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_##PinSCL));
    X_ITEMS(X)
#undef X

    return rv;
}
#else
    ;
#endif
#include "X_enum.h"
