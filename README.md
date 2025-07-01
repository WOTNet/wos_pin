This repo contains an attempt to create a extremely lightweight compile-time MCU pin configuration framework using nothing but standard C macros. 

This project was is inspired by Zephyr's pretty incredible compile-time DTS system.

From the included example pin configuration, GPIOs, a UART and an I2C bus are configured using a DSL based on [X-macros](https://en.wikipedia.org/wiki/X_macro) as follows:

```
#define WOS_PIN_PAD_LIST_STM8S003(X)                                           \
    X(PD4, = 1)                                                                \
    X(PD5, = 2)                                                                \
    X(PD6, = 3)                                                                \
    X(PA1, = 5)                                                                \
    X(PA2, = 6)                                                                \
    X(PA3, = 10)                                                               \
    X(PB5, = 11)                                                               \
    X(PB4, = 12)                                                               \
    X(PC3, = 13)                                                               \
    X(PC4, = 14)                                                               \
    X(PC5, = 15)                                                               \
    X(PC6, = 16)                                                               \
    X(PC7, = 17)                                                               \
    X(PD1, = 18)                                                               \
    X(PD2, = 19)                                                               \
    X(PD3, = 20)

#define WOS_PIN_PAD_LIST WOS_PIN_PAD_LIST_STM8S003

#define WOS_PIN_ASSIGNMENT_LIST(X)                                             \
    X(SDA, , PB5)                                                              \
    X(SCL, , PB4)                                                              \
    X(LIDAR_RX, , PD6)                                                         \
    X(LIDAR_TX, , PD5)                                                         \
    X(LIDAR_INT, , PA1)                                                        \
    X(BUTTON1, , PA2)                                                          \
    X(STROBE, , PC4)                                                           \
    X(PWM1, , PD4)                                                             \
    X(PWM2, , PD3)                                                             \
    X(PWM3, , PA3)

#define WOS_PIN_GP_INPUT_LIST(X)                                               \
    X(LIDAR_INT, , UP, RISING)                                                 \
    X(BUTTON1, , UP, FALLING)                                                  \
    X(STROBE, , UP, EDGE)

#define WOS_PIN_GP_OUTPUT_LIST(X)                                              \
    X(PWM1, , OPEN_DRAIN, MEDIUM)                                              \
    X(PWM2, , OPEN_DRAIN, MEDIUM)                                              \
    X(PWM3, , OPEN_DRAIN, MEDIUM)

// assume 8N1
#define WOS_PIN_UART_LIST(X) X(UART_LIDAR, = 0, 9600, LIDAR_RX, LIDAR_TX)

#define WOS_PIN_I2C_BUS_LIST(X) X(I2C_IMU, = 1, 400K, SDA, SCL)
```

The toy BSP in the demo app implements fake configuration functions that print out what configuration they were each asked to perform. Here is the output corresponding to the above configurationn:

```
GP INPUT PA1 @ 5 (LIDAR_INT), pull: UP, interrupt type: RISING
GP INPUT PA2 @ 6 (BUTTON1), pull: UP, interrupt type: FALLING
GP INPUT PC4 @ 14 (STROBE), pull: UP, interrupt type: EDGE
GP OUTPUT PD4 @ 1 (PWM1), output configuration: OPEN_DRAIN, drive strength: MEDIUM
GP OUTPUT PD3 @ 20 (PWM2), output configuration: OPEN_DRAIN, drive strength: MEDIUM
GP OUTPUT PA3 @ 10 (PWM3), output configuration: OPEN_DRAIN, drive strength: MEDIUM
UART 0 (UART_LIDAR), baud: 9600, rx pin: 3, tx pin: 2
I2C bus 1 (I2C_IMU), speed: 400K, sda pin: 11, scl pin: 12
```

A real BSP implementation would be simple to write for any given platform - in this case `WOS_PIN_PAD_LIST` was set up for [STM8](https://www.st.com/resource/en/datasheet/stm8s003f3.pdf). 

The [expanded X-macros](https://github.com/WOTNet/wos_pin/blob/main/gen/wos_pin_enums.c.i) are in the `gen` folder, it is around 4000 lines of fairly unpleaseant-looking code. It uses `X.h` and `X_enum.h` from [my macro library](https://github.com/wideopensource/oneletter).
