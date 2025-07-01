#pragma once

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
