# 0 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.c"
# 1 "/home/duo/wos/repos/wos_pin/demo/wos_pin_config.h" 1

# 2 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.c" 2

# 1 "/home/duo/wos/repos/wos_pin/src/wos_pin.h" 1

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
# 4 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.c" 2

# 1 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 1

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X.h" 1

# 21 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X.h"
int X_strcmp(char const *s1, char const *s2);
int X_strcmpi(char const *s1, char const *s2);

static int X_clean(int c)
{
    if ('_' == c)
    {
        return '-';
    }

    return c;
}

static int X_to_upper(int c)
{
    if ('A' <= c && 'Z' >= c)
    {
        return c - 'A' + 'a';
    }

    return c;
}

int X_strcmp(char const *s1, char const *s2)
{
    do
    {
        int const c1 = X_clean(*s1++);
        int const c2 = X_clean(*s2++);

        if (c1 != c2)
        {
            return 1;
        }
    } while (*s1 && *s2);

    return 0;
}

int X_strcmpi(char const *s1, char const *s2)
{
    do
    {
        int const c1 = X_to_upper(X_clean(*s1++));
        int const c2 = X_to_upper(X_clean(*s2++));

        if (c1 != c2)
        {
            return 1;
        }
    } while (*s1 && *s2);

    return 0;
}
# 4 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_status_meta_enum
{

    WOS_PIN_STATUS_INDEX_OK,
    WOS_PIN_STATUS_INDEX_ERROR,

    WOS_PIN_STATUS_NUMBER_OF_ITEMS,
    WOS_PIN_STATUS_INDEX_INVALID = WOS_PIN_STATUS_NUMBER_OF_ITEMS,

    WOS_PIN_STATUS_INVALID = 0,

    _WOS_PIN_STATUS_OK,
    _WOS_PIN_STATUS_ERROR = -1,

    _WOS_PIN_STATUS_NEXT,
    _WOS_PIN_STATUS_MAX = _WOS_PIN_STATUS_NEXT - 1,

    WOS_PIN_STATUS_FLAG_OK = 1 << WOS_PIN_STATUS_INDEX_OK,
    WOS_PIN_STATUS_FLAG_ERROR = 1 << WOS_PIN_STATUS_INDEX_ERROR,
};

enum wos_pin_status_enum
{

    WOS_PIN_STATUS_OK = _WOS_PIN_STATUS_OK,
    WOS_PIN_STATUS_ERROR = _WOS_PIN_STATUS_ERROR,
};

int wos_pin_status_is_valid(enum wos_pin_status_enum value);
char const *wos_pin_status_to_string(enum wos_pin_status_enum item);
enum wos_pin_status_enum wos_pin_status_parse(char const *v);
enum wos_pin_status_enum wos_pin_status_parsei(char const *v);
int wos_pin_status_count();
enum wos_pin_status_enum wos_pin_status_at(int index);
int wos_pin_status_index_of(enum wos_pin_status_enum item);
enum wos_pin_status_enum wos_pin_status_clamp(int value);

unsigned int wos_pin_status_flag_of(enum wos_pin_status_enum item);
unsigned int wos_pin_status_test_flag(unsigned int data,
                                      enum wos_pin_status_enum item);
unsigned int wos_pin_status_set_flag(unsigned int data,
                                     enum wos_pin_status_enum item);
unsigned int wos_pin_status_clear_flag(unsigned int data,
                                       enum wos_pin_status_enum item);

void wos_pin_status_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_status_is_valid(enum wos_pin_status_enum value)
{
    switch (value)
    {

    case WOS_PIN_STATUS_OK:
        return 1;
    case WOS_PIN_STATUS_ERROR:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_status_enum wos_pin_status_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_STATUS_OK:
        return WOS_PIN_STATUS_OK;
    case WOS_PIN_STATUS_ERROR:
        return WOS_PIN_STATUS_ERROR;
    }

    return value > _WOS_PIN_STATUS_MAX ? _WOS_PIN_STATUS_MAX
                                       : wos_pin_status_at(0);
}

unsigned int wos_pin_status_flag_of(enum wos_pin_status_enum item)
{
    switch (item)
    {

    case WOS_PIN_STATUS_OK:
        return WOS_PIN_STATUS_FLAG_OK;
    case WOS_PIN_STATUS_ERROR:
        return WOS_PIN_STATUS_FLAG_ERROR;

    default:
        return 0;
    }
}

unsigned int wos_pin_status_test_flag(unsigned int data,
                                      enum wos_pin_status_enum item)
{
    switch (item)
    {

    case WOS_PIN_STATUS_OK:
        return (data & WOS_PIN_STATUS_FLAG_OK) ? 1 : 0;
    case WOS_PIN_STATUS_ERROR:
        return (data & WOS_PIN_STATUS_FLAG_ERROR) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_status_set_flag(unsigned int data,
                                     enum wos_pin_status_enum item)
{
    switch (item)
    {

    case WOS_PIN_STATUS_OK:
        return data | WOS_PIN_STATUS_FLAG_OK;
    case WOS_PIN_STATUS_ERROR:
        return data | WOS_PIN_STATUS_FLAG_ERROR;

    default:
        return data;
    }
}

unsigned int wos_pin_status_clear_flag(unsigned int data,
                                       enum wos_pin_status_enum item)
{
    switch (item)
    {

    case WOS_PIN_STATUS_OK:
        return data & ~(WOS_PIN_STATUS_FLAG_OK);
    case WOS_PIN_STATUS_ERROR:
        return data & ~(WOS_PIN_STATUS_FLAG_ERROR);

    default:
        return data;
    }
}

char const *wos_pin_status_to_string(enum wos_pin_status_enum item)
{
    switch (item)
    {

    case WOS_PIN_STATUS_OK:
        return "OK";
    case WOS_PIN_STATUS_ERROR:
        return "ERROR";

    default:
        return "WOS_PIN_STATUS_INVALID";
    }
}

enum wos_pin_status_enum wos_pin_status_parse(char const *v)
{

    if (!X_strcmp("OK", v))
    {
        return WOS_PIN_STATUS_OK;
    }
    if (!X_strcmp("ERROR", v))
    {
        return WOS_PIN_STATUS_ERROR;
    }

    return WOS_PIN_STATUS_INVALID;
}

enum wos_pin_status_enum wos_pin_status_parsei(char const *v)
{

    if (!X_strcmpi("OK", v))
    {
        return WOS_PIN_STATUS_OK;
    }
    if (!X_strcmpi("ERROR", v))
    {
        return WOS_PIN_STATUS_ERROR;
    }

    return WOS_PIN_STATUS_INVALID;
}

int wos_pin_status_count()
{
    return WOS_PIN_STATUS_NUMBER_OF_ITEMS;
}

enum wos_pin_status_enum wos_pin_status_at(int index)
{
    switch (index)
    {

    case WOS_PIN_STATUS_INDEX_OK:
        return WOS_PIN_STATUS_OK;
    case WOS_PIN_STATUS_INDEX_ERROR:
        return WOS_PIN_STATUS_ERROR;

    default:
        return WOS_PIN_STATUS_INVALID;
    }
}

int wos_pin_status_index_of(enum wos_pin_status_enum item)
{
    switch (item)
    {

    case WOS_PIN_STATUS_OK:
        return WOS_PIN_STATUS_INDEX_OK;
    case WOS_PIN_STATUS_ERROR:
        return WOS_PIN_STATUS_INDEX_ERROR;

    default:
        return WOS_PIN_STATUS_INDEX_INVALID;
    }
}
# 11 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

typedef enum wos_pin_status_enum WOS_PIN_STATUS;

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_pad_meta_enum
{

    WOS_PIN_PAD_INDEX_PD4,
    WOS_PIN_PAD_INDEX_PD5,
    WOS_PIN_PAD_INDEX_PD6,
    WOS_PIN_PAD_INDEX_PA1,
    WOS_PIN_PAD_INDEX_PA2,
    WOS_PIN_PAD_INDEX_PA3,
    WOS_PIN_PAD_INDEX_PB5,
    WOS_PIN_PAD_INDEX_PB4,
    WOS_PIN_PAD_INDEX_PC3,
    WOS_PIN_PAD_INDEX_PC4,
    WOS_PIN_PAD_INDEX_PC5,
    WOS_PIN_PAD_INDEX_PC6,
    WOS_PIN_PAD_INDEX_PC7,
    WOS_PIN_PAD_INDEX_PD1,
    WOS_PIN_PAD_INDEX_PD2,
    WOS_PIN_PAD_INDEX_PD3,

    WOS_PIN_PAD_NUMBER_OF_ITEMS,
    WOS_PIN_PAD_INDEX_INVALID = WOS_PIN_PAD_NUMBER_OF_ITEMS,

    WOS_PIN_PAD_INVALID = 0,

    _WOS_PIN_PAD_PD4 = 1,
    _WOS_PIN_PAD_PD5 = 2,
    _WOS_PIN_PAD_PD6 = 3,
    _WOS_PIN_PAD_PA1 = 5,
    _WOS_PIN_PAD_PA2 = 6,
    _WOS_PIN_PAD_PA3 = 10,
    _WOS_PIN_PAD_PB5 = 11,
    _WOS_PIN_PAD_PB4 = 12,
    _WOS_PIN_PAD_PC3 = 13,
    _WOS_PIN_PAD_PC4 = 14,
    _WOS_PIN_PAD_PC5 = 15,
    _WOS_PIN_PAD_PC6 = 16,
    _WOS_PIN_PAD_PC7 = 17,
    _WOS_PIN_PAD_PD1 = 18,
    _WOS_PIN_PAD_PD2 = 19,
    _WOS_PIN_PAD_PD3 = 20,

    _WOS_PIN_PAD_NEXT,
    _WOS_PIN_PAD_MAX = _WOS_PIN_PAD_NEXT - 1,

    WOS_PIN_PAD_FLAG_PD4 = 1 << WOS_PIN_PAD_INDEX_PD4,
    WOS_PIN_PAD_FLAG_PD5 = 1 << WOS_PIN_PAD_INDEX_PD5,
    WOS_PIN_PAD_FLAG_PD6 = 1 << WOS_PIN_PAD_INDEX_PD6,
    WOS_PIN_PAD_FLAG_PA1 = 1 << WOS_PIN_PAD_INDEX_PA1,
    WOS_PIN_PAD_FLAG_PA2 = 1 << WOS_PIN_PAD_INDEX_PA2,
    WOS_PIN_PAD_FLAG_PA3 = 1 << WOS_PIN_PAD_INDEX_PA3,
    WOS_PIN_PAD_FLAG_PB5 = 1 << WOS_PIN_PAD_INDEX_PB5,
    WOS_PIN_PAD_FLAG_PB4 = 1 << WOS_PIN_PAD_INDEX_PB4,
    WOS_PIN_PAD_FLAG_PC3 = 1 << WOS_PIN_PAD_INDEX_PC3,
    WOS_PIN_PAD_FLAG_PC4 = 1 << WOS_PIN_PAD_INDEX_PC4,
    WOS_PIN_PAD_FLAG_PC5 = 1 << WOS_PIN_PAD_INDEX_PC5,
    WOS_PIN_PAD_FLAG_PC6 = 1 << WOS_PIN_PAD_INDEX_PC6,
    WOS_PIN_PAD_FLAG_PC7 = 1 << WOS_PIN_PAD_INDEX_PC7,
    WOS_PIN_PAD_FLAG_PD1 = 1 << WOS_PIN_PAD_INDEX_PD1,
    WOS_PIN_PAD_FLAG_PD2 = 1 << WOS_PIN_PAD_INDEX_PD2,
    WOS_PIN_PAD_FLAG_PD3 = 1 << WOS_PIN_PAD_INDEX_PD3,
};

enum wos_pin_pad_enum
{

    WOS_PIN_PAD_PD4 = _WOS_PIN_PAD_PD4,
    WOS_PIN_PAD_PD5 = _WOS_PIN_PAD_PD5,
    WOS_PIN_PAD_PD6 = _WOS_PIN_PAD_PD6,
    WOS_PIN_PAD_PA1 = _WOS_PIN_PAD_PA1,
    WOS_PIN_PAD_PA2 = _WOS_PIN_PAD_PA2,
    WOS_PIN_PAD_PA3 = _WOS_PIN_PAD_PA3,
    WOS_PIN_PAD_PB5 = _WOS_PIN_PAD_PB5,
    WOS_PIN_PAD_PB4 = _WOS_PIN_PAD_PB4,
    WOS_PIN_PAD_PC3 = _WOS_PIN_PAD_PC3,
    WOS_PIN_PAD_PC4 = _WOS_PIN_PAD_PC4,
    WOS_PIN_PAD_PC5 = _WOS_PIN_PAD_PC5,
    WOS_PIN_PAD_PC6 = _WOS_PIN_PAD_PC6,
    WOS_PIN_PAD_PC7 = _WOS_PIN_PAD_PC7,
    WOS_PIN_PAD_PD1 = _WOS_PIN_PAD_PD1,
    WOS_PIN_PAD_PD2 = _WOS_PIN_PAD_PD2,
    WOS_PIN_PAD_PD3 = _WOS_PIN_PAD_PD3,
};

int wos_pin_pad_is_valid(enum wos_pin_pad_enum value);
char const *wos_pin_pad_to_string(enum wos_pin_pad_enum item);
enum wos_pin_pad_enum wos_pin_pad_parse(char const *v);
enum wos_pin_pad_enum wos_pin_pad_parsei(char const *v);
int wos_pin_pad_count();
enum wos_pin_pad_enum wos_pin_pad_at(int index);
int wos_pin_pad_index_of(enum wos_pin_pad_enum item);
enum wos_pin_pad_enum wos_pin_pad_clamp(int value);

unsigned int wos_pin_pad_flag_of(enum wos_pin_pad_enum item);
unsigned int wos_pin_pad_test_flag(unsigned int data,
                                   enum wos_pin_pad_enum item);
unsigned int wos_pin_pad_set_flag(unsigned int data,
                                  enum wos_pin_pad_enum item);
unsigned int wos_pin_pad_clear_flag(unsigned int data,
                                    enum wos_pin_pad_enum item);

void wos_pin_pad_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_pad_is_valid(enum wos_pin_pad_enum value)
{
    switch (value)
    {

    case WOS_PIN_PAD_PD4:
        return 1;
    case WOS_PIN_PAD_PD5:
        return 1;
    case WOS_PIN_PAD_PD6:
        return 1;
    case WOS_PIN_PAD_PA1:
        return 1;
    case WOS_PIN_PAD_PA2:
        return 1;
    case WOS_PIN_PAD_PA3:
        return 1;
    case WOS_PIN_PAD_PB5:
        return 1;
    case WOS_PIN_PAD_PB4:
        return 1;
    case WOS_PIN_PAD_PC3:
        return 1;
    case WOS_PIN_PAD_PC4:
        return 1;
    case WOS_PIN_PAD_PC5:
        return 1;
    case WOS_PIN_PAD_PC6:
        return 1;
    case WOS_PIN_PAD_PC7:
        return 1;
    case WOS_PIN_PAD_PD1:
        return 1;
    case WOS_PIN_PAD_PD2:
        return 1;
    case WOS_PIN_PAD_PD3:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_pad_enum wos_pin_pad_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_PAD_PD4:
        return WOS_PIN_PAD_PD4;
    case WOS_PIN_PAD_PD5:
        return WOS_PIN_PAD_PD5;
    case WOS_PIN_PAD_PD6:
        return WOS_PIN_PAD_PD6;
    case WOS_PIN_PAD_PA1:
        return WOS_PIN_PAD_PA1;
    case WOS_PIN_PAD_PA2:
        return WOS_PIN_PAD_PA2;
    case WOS_PIN_PAD_PA3:
        return WOS_PIN_PAD_PA3;
    case WOS_PIN_PAD_PB5:
        return WOS_PIN_PAD_PB5;
    case WOS_PIN_PAD_PB4:
        return WOS_PIN_PAD_PB4;
    case WOS_PIN_PAD_PC3:
        return WOS_PIN_PAD_PC3;
    case WOS_PIN_PAD_PC4:
        return WOS_PIN_PAD_PC4;
    case WOS_PIN_PAD_PC5:
        return WOS_PIN_PAD_PC5;
    case WOS_PIN_PAD_PC6:
        return WOS_PIN_PAD_PC6;
    case WOS_PIN_PAD_PC7:
        return WOS_PIN_PAD_PC7;
    case WOS_PIN_PAD_PD1:
        return WOS_PIN_PAD_PD1;
    case WOS_PIN_PAD_PD2:
        return WOS_PIN_PAD_PD2;
    case WOS_PIN_PAD_PD3:
        return WOS_PIN_PAD_PD3;
    }

    return value > _WOS_PIN_PAD_MAX ? _WOS_PIN_PAD_MAX : wos_pin_pad_at(0);
}

unsigned int wos_pin_pad_flag_of(enum wos_pin_pad_enum item)
{
    switch (item)
    {

    case WOS_PIN_PAD_PD4:
        return WOS_PIN_PAD_FLAG_PD4;
    case WOS_PIN_PAD_PD5:
        return WOS_PIN_PAD_FLAG_PD5;
    case WOS_PIN_PAD_PD6:
        return WOS_PIN_PAD_FLAG_PD6;
    case WOS_PIN_PAD_PA1:
        return WOS_PIN_PAD_FLAG_PA1;
    case WOS_PIN_PAD_PA2:
        return WOS_PIN_PAD_FLAG_PA2;
    case WOS_PIN_PAD_PA3:
        return WOS_PIN_PAD_FLAG_PA3;
    case WOS_PIN_PAD_PB5:
        return WOS_PIN_PAD_FLAG_PB5;
    case WOS_PIN_PAD_PB4:
        return WOS_PIN_PAD_FLAG_PB4;
    case WOS_PIN_PAD_PC3:
        return WOS_PIN_PAD_FLAG_PC3;
    case WOS_PIN_PAD_PC4:
        return WOS_PIN_PAD_FLAG_PC4;
    case WOS_PIN_PAD_PC5:
        return WOS_PIN_PAD_FLAG_PC5;
    case WOS_PIN_PAD_PC6:
        return WOS_PIN_PAD_FLAG_PC6;
    case WOS_PIN_PAD_PC7:
        return WOS_PIN_PAD_FLAG_PC7;
    case WOS_PIN_PAD_PD1:
        return WOS_PIN_PAD_FLAG_PD1;
    case WOS_PIN_PAD_PD2:
        return WOS_PIN_PAD_FLAG_PD2;
    case WOS_PIN_PAD_PD3:
        return WOS_PIN_PAD_FLAG_PD3;

    default:
        return 0;
    }
}

unsigned int wos_pin_pad_test_flag(unsigned int data,
                                   enum wos_pin_pad_enum item)
{
    switch (item)
    {

    case WOS_PIN_PAD_PD4:
        return (data & WOS_PIN_PAD_FLAG_PD4) ? 1 : 0;
    case WOS_PIN_PAD_PD5:
        return (data & WOS_PIN_PAD_FLAG_PD5) ? 1 : 0;
    case WOS_PIN_PAD_PD6:
        return (data & WOS_PIN_PAD_FLAG_PD6) ? 1 : 0;
    case WOS_PIN_PAD_PA1:
        return (data & WOS_PIN_PAD_FLAG_PA1) ? 1 : 0;
    case WOS_PIN_PAD_PA2:
        return (data & WOS_PIN_PAD_FLAG_PA2) ? 1 : 0;
    case WOS_PIN_PAD_PA3:
        return (data & WOS_PIN_PAD_FLAG_PA3) ? 1 : 0;
    case WOS_PIN_PAD_PB5:
        return (data & WOS_PIN_PAD_FLAG_PB5) ? 1 : 0;
    case WOS_PIN_PAD_PB4:
        return (data & WOS_PIN_PAD_FLAG_PB4) ? 1 : 0;
    case WOS_PIN_PAD_PC3:
        return (data & WOS_PIN_PAD_FLAG_PC3) ? 1 : 0;
    case WOS_PIN_PAD_PC4:
        return (data & WOS_PIN_PAD_FLAG_PC4) ? 1 : 0;
    case WOS_PIN_PAD_PC5:
        return (data & WOS_PIN_PAD_FLAG_PC5) ? 1 : 0;
    case WOS_PIN_PAD_PC6:
        return (data & WOS_PIN_PAD_FLAG_PC6) ? 1 : 0;
    case WOS_PIN_PAD_PC7:
        return (data & WOS_PIN_PAD_FLAG_PC7) ? 1 : 0;
    case WOS_PIN_PAD_PD1:
        return (data & WOS_PIN_PAD_FLAG_PD1) ? 1 : 0;
    case WOS_PIN_PAD_PD2:
        return (data & WOS_PIN_PAD_FLAG_PD2) ? 1 : 0;
    case WOS_PIN_PAD_PD3:
        return (data & WOS_PIN_PAD_FLAG_PD3) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_pad_set_flag(unsigned int data, enum wos_pin_pad_enum item)
{
    switch (item)
    {

    case WOS_PIN_PAD_PD4:
        return data | WOS_PIN_PAD_FLAG_PD4;
    case WOS_PIN_PAD_PD5:
        return data | WOS_PIN_PAD_FLAG_PD5;
    case WOS_PIN_PAD_PD6:
        return data | WOS_PIN_PAD_FLAG_PD6;
    case WOS_PIN_PAD_PA1:
        return data | WOS_PIN_PAD_FLAG_PA1;
    case WOS_PIN_PAD_PA2:
        return data | WOS_PIN_PAD_FLAG_PA2;
    case WOS_PIN_PAD_PA3:
        return data | WOS_PIN_PAD_FLAG_PA3;
    case WOS_PIN_PAD_PB5:
        return data | WOS_PIN_PAD_FLAG_PB5;
    case WOS_PIN_PAD_PB4:
        return data | WOS_PIN_PAD_FLAG_PB4;
    case WOS_PIN_PAD_PC3:
        return data | WOS_PIN_PAD_FLAG_PC3;
    case WOS_PIN_PAD_PC4:
        return data | WOS_PIN_PAD_FLAG_PC4;
    case WOS_PIN_PAD_PC5:
        return data | WOS_PIN_PAD_FLAG_PC5;
    case WOS_PIN_PAD_PC6:
        return data | WOS_PIN_PAD_FLAG_PC6;
    case WOS_PIN_PAD_PC7:
        return data | WOS_PIN_PAD_FLAG_PC7;
    case WOS_PIN_PAD_PD1:
        return data | WOS_PIN_PAD_FLAG_PD1;
    case WOS_PIN_PAD_PD2:
        return data | WOS_PIN_PAD_FLAG_PD2;
    case WOS_PIN_PAD_PD3:
        return data | WOS_PIN_PAD_FLAG_PD3;

    default:
        return data;
    }
}

unsigned int wos_pin_pad_clear_flag(unsigned int data,
                                    enum wos_pin_pad_enum item)
{
    switch (item)
    {

    case WOS_PIN_PAD_PD4:
        return data & ~(WOS_PIN_PAD_FLAG_PD4);
    case WOS_PIN_PAD_PD5:
        return data & ~(WOS_PIN_PAD_FLAG_PD5);
    case WOS_PIN_PAD_PD6:
        return data & ~(WOS_PIN_PAD_FLAG_PD6);
    case WOS_PIN_PAD_PA1:
        return data & ~(WOS_PIN_PAD_FLAG_PA1);
    case WOS_PIN_PAD_PA2:
        return data & ~(WOS_PIN_PAD_FLAG_PA2);
    case WOS_PIN_PAD_PA3:
        return data & ~(WOS_PIN_PAD_FLAG_PA3);
    case WOS_PIN_PAD_PB5:
        return data & ~(WOS_PIN_PAD_FLAG_PB5);
    case WOS_PIN_PAD_PB4:
        return data & ~(WOS_PIN_PAD_FLAG_PB4);
    case WOS_PIN_PAD_PC3:
        return data & ~(WOS_PIN_PAD_FLAG_PC3);
    case WOS_PIN_PAD_PC4:
        return data & ~(WOS_PIN_PAD_FLAG_PC4);
    case WOS_PIN_PAD_PC5:
        return data & ~(WOS_PIN_PAD_FLAG_PC5);
    case WOS_PIN_PAD_PC6:
        return data & ~(WOS_PIN_PAD_FLAG_PC6);
    case WOS_PIN_PAD_PC7:
        return data & ~(WOS_PIN_PAD_FLAG_PC7);
    case WOS_PIN_PAD_PD1:
        return data & ~(WOS_PIN_PAD_FLAG_PD1);
    case WOS_PIN_PAD_PD2:
        return data & ~(WOS_PIN_PAD_FLAG_PD2);
    case WOS_PIN_PAD_PD3:
        return data & ~(WOS_PIN_PAD_FLAG_PD3);

    default:
        return data;
    }
}

char const *wos_pin_pad_to_string(enum wos_pin_pad_enum item)
{
    switch (item)
    {

    case WOS_PIN_PAD_PD4:
        return "PD4";
    case WOS_PIN_PAD_PD5:
        return "PD5";
    case WOS_PIN_PAD_PD6:
        return "PD6";
    case WOS_PIN_PAD_PA1:
        return "PA1";
    case WOS_PIN_PAD_PA2:
        return "PA2";
    case WOS_PIN_PAD_PA3:
        return "PA3";
    case WOS_PIN_PAD_PB5:
        return "PB5";
    case WOS_PIN_PAD_PB4:
        return "PB4";
    case WOS_PIN_PAD_PC3:
        return "PC3";
    case WOS_PIN_PAD_PC4:
        return "PC4";
    case WOS_PIN_PAD_PC5:
        return "PC5";
    case WOS_PIN_PAD_PC6:
        return "PC6";
    case WOS_PIN_PAD_PC7:
        return "PC7";
    case WOS_PIN_PAD_PD1:
        return "PD1";
    case WOS_PIN_PAD_PD2:
        return "PD2";
    case WOS_PIN_PAD_PD3:
        return "PD3";

    default:
        return "WOS_PIN_PAD_INVALID";
    }
}

enum wos_pin_pad_enum wos_pin_pad_parse(char const *v)
{

    if (!X_strcmp("PD4", v))
    {
        return WOS_PIN_PAD_PD4;
    }
    if (!X_strcmp("PD5", v))
    {
        return WOS_PIN_PAD_PD5;
    }
    if (!X_strcmp("PD6", v))
    {
        return WOS_PIN_PAD_PD6;
    }
    if (!X_strcmp("PA1", v))
    {
        return WOS_PIN_PAD_PA1;
    }
    if (!X_strcmp("PA2", v))
    {
        return WOS_PIN_PAD_PA2;
    }
    if (!X_strcmp("PA3", v))
    {
        return WOS_PIN_PAD_PA3;
    }
    if (!X_strcmp("PB5", v))
    {
        return WOS_PIN_PAD_PB5;
    }
    if (!X_strcmp("PB4", v))
    {
        return WOS_PIN_PAD_PB4;
    }
    if (!X_strcmp("PC3", v))
    {
        return WOS_PIN_PAD_PC3;
    }
    if (!X_strcmp("PC4", v))
    {
        return WOS_PIN_PAD_PC4;
    }
    if (!X_strcmp("PC5", v))
    {
        return WOS_PIN_PAD_PC5;
    }
    if (!X_strcmp("PC6", v))
    {
        return WOS_PIN_PAD_PC6;
    }
    if (!X_strcmp("PC7", v))
    {
        return WOS_PIN_PAD_PC7;
    }
    if (!X_strcmp("PD1", v))
    {
        return WOS_PIN_PAD_PD1;
    }
    if (!X_strcmp("PD2", v))
    {
        return WOS_PIN_PAD_PD2;
    }
    if (!X_strcmp("PD3", v))
    {
        return WOS_PIN_PAD_PD3;
    }

    return WOS_PIN_PAD_INVALID;
}

enum wos_pin_pad_enum wos_pin_pad_parsei(char const *v)
{

    if (!X_strcmpi("PD4", v))
    {
        return WOS_PIN_PAD_PD4;
    }
    if (!X_strcmpi("PD5", v))
    {
        return WOS_PIN_PAD_PD5;
    }
    if (!X_strcmpi("PD6", v))
    {
        return WOS_PIN_PAD_PD6;
    }
    if (!X_strcmpi("PA1", v))
    {
        return WOS_PIN_PAD_PA1;
    }
    if (!X_strcmpi("PA2", v))
    {
        return WOS_PIN_PAD_PA2;
    }
    if (!X_strcmpi("PA3", v))
    {
        return WOS_PIN_PAD_PA3;
    }
    if (!X_strcmpi("PB5", v))
    {
        return WOS_PIN_PAD_PB5;
    }
    if (!X_strcmpi("PB4", v))
    {
        return WOS_PIN_PAD_PB4;
    }
    if (!X_strcmpi("PC3", v))
    {
        return WOS_PIN_PAD_PC3;
    }
    if (!X_strcmpi("PC4", v))
    {
        return WOS_PIN_PAD_PC4;
    }
    if (!X_strcmpi("PC5", v))
    {
        return WOS_PIN_PAD_PC5;
    }
    if (!X_strcmpi("PC6", v))
    {
        return WOS_PIN_PAD_PC6;
    }
    if (!X_strcmpi("PC7", v))
    {
        return WOS_PIN_PAD_PC7;
    }
    if (!X_strcmpi("PD1", v))
    {
        return WOS_PIN_PAD_PD1;
    }
    if (!X_strcmpi("PD2", v))
    {
        return WOS_PIN_PAD_PD2;
    }
    if (!X_strcmpi("PD3", v))
    {
        return WOS_PIN_PAD_PD3;
    }

    return WOS_PIN_PAD_INVALID;
}

int wos_pin_pad_count()
{
    return WOS_PIN_PAD_NUMBER_OF_ITEMS;
}

enum wos_pin_pad_enum wos_pin_pad_at(int index)
{
    switch (index)
    {

    case WOS_PIN_PAD_INDEX_PD4:
        return WOS_PIN_PAD_PD4;
    case WOS_PIN_PAD_INDEX_PD5:
        return WOS_PIN_PAD_PD5;
    case WOS_PIN_PAD_INDEX_PD6:
        return WOS_PIN_PAD_PD6;
    case WOS_PIN_PAD_INDEX_PA1:
        return WOS_PIN_PAD_PA1;
    case WOS_PIN_PAD_INDEX_PA2:
        return WOS_PIN_PAD_PA2;
    case WOS_PIN_PAD_INDEX_PA3:
        return WOS_PIN_PAD_PA3;
    case WOS_PIN_PAD_INDEX_PB5:
        return WOS_PIN_PAD_PB5;
    case WOS_PIN_PAD_INDEX_PB4:
        return WOS_PIN_PAD_PB4;
    case WOS_PIN_PAD_INDEX_PC3:
        return WOS_PIN_PAD_PC3;
    case WOS_PIN_PAD_INDEX_PC4:
        return WOS_PIN_PAD_PC4;
    case WOS_PIN_PAD_INDEX_PC5:
        return WOS_PIN_PAD_PC5;
    case WOS_PIN_PAD_INDEX_PC6:
        return WOS_PIN_PAD_PC6;
    case WOS_PIN_PAD_INDEX_PC7:
        return WOS_PIN_PAD_PC7;
    case WOS_PIN_PAD_INDEX_PD1:
        return WOS_PIN_PAD_PD1;
    case WOS_PIN_PAD_INDEX_PD2:
        return WOS_PIN_PAD_PD2;
    case WOS_PIN_PAD_INDEX_PD3:
        return WOS_PIN_PAD_PD3;

    default:
        return WOS_PIN_PAD_INVALID;
    }
}

int wos_pin_pad_index_of(enum wos_pin_pad_enum item)
{
    switch (item)
    {

    case WOS_PIN_PAD_PD4:
        return WOS_PIN_PAD_INDEX_PD4;
    case WOS_PIN_PAD_PD5:
        return WOS_PIN_PAD_INDEX_PD5;
    case WOS_PIN_PAD_PD6:
        return WOS_PIN_PAD_INDEX_PD6;
    case WOS_PIN_PAD_PA1:
        return WOS_PIN_PAD_INDEX_PA1;
    case WOS_PIN_PAD_PA2:
        return WOS_PIN_PAD_INDEX_PA2;
    case WOS_PIN_PAD_PA3:
        return WOS_PIN_PAD_INDEX_PA3;
    case WOS_PIN_PAD_PB5:
        return WOS_PIN_PAD_INDEX_PB5;
    case WOS_PIN_PAD_PB4:
        return WOS_PIN_PAD_INDEX_PB4;
    case WOS_PIN_PAD_PC3:
        return WOS_PIN_PAD_INDEX_PC3;
    case WOS_PIN_PAD_PC4:
        return WOS_PIN_PAD_INDEX_PC4;
    case WOS_PIN_PAD_PC5:
        return WOS_PIN_PAD_INDEX_PC5;
    case WOS_PIN_PAD_PC6:
        return WOS_PIN_PAD_INDEX_PC6;
    case WOS_PIN_PAD_PC7:
        return WOS_PIN_PAD_INDEX_PC7;
    case WOS_PIN_PAD_PD1:
        return WOS_PIN_PAD_INDEX_PD1;
    case WOS_PIN_PAD_PD2:
        return WOS_PIN_PAD_INDEX_PD2;
    case WOS_PIN_PAD_PD3:
        return WOS_PIN_PAD_INDEX_PD3;

    default:
        return WOS_PIN_PAD_INDEX_INVALID;
    }
}
# 20 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_assignment_meta_enum
{

    WOS_PIN_ASSIGNMENT_INDEX_SDA,
    WOS_PIN_ASSIGNMENT_INDEX_SCL,
    WOS_PIN_ASSIGNMENT_INDEX_LIDAR_RX,
    WOS_PIN_ASSIGNMENT_INDEX_LIDAR_TX,
    WOS_PIN_ASSIGNMENT_INDEX_LIDAR_INT,
    WOS_PIN_ASSIGNMENT_INDEX_BUTTON1,
    WOS_PIN_ASSIGNMENT_INDEX_STROBE,
    WOS_PIN_ASSIGNMENT_INDEX_PWM1,
    WOS_PIN_ASSIGNMENT_INDEX_PWM2,
    WOS_PIN_ASSIGNMENT_INDEX_PWM3,

    WOS_PIN_ASSIGNMENT_NUMBER_OF_ITEMS,
    WOS_PIN_ASSIGNMENT_INDEX_INVALID = WOS_PIN_ASSIGNMENT_NUMBER_OF_ITEMS,

    WOS_PIN_ASSIGNMENT_INVALID = 0,

    _WOS_PIN_ASSIGNMENT_SDA,
    _WOS_PIN_ASSIGNMENT_SCL,
    _WOS_PIN_ASSIGNMENT_LIDAR_RX,
    _WOS_PIN_ASSIGNMENT_LIDAR_TX,
    _WOS_PIN_ASSIGNMENT_LIDAR_INT,
    _WOS_PIN_ASSIGNMENT_BUTTON1,
    _WOS_PIN_ASSIGNMENT_STROBE,
    _WOS_PIN_ASSIGNMENT_PWM1,
    _WOS_PIN_ASSIGNMENT_PWM2,
    _WOS_PIN_ASSIGNMENT_PWM3,

    _WOS_PIN_ASSIGNMENT_NEXT,
    _WOS_PIN_ASSIGNMENT_MAX = _WOS_PIN_ASSIGNMENT_NEXT - 1,

    WOS_PIN_ASSIGNMENT_FLAG_SDA = 1 << WOS_PIN_ASSIGNMENT_INDEX_SDA,
    WOS_PIN_ASSIGNMENT_FLAG_SCL = 1 << WOS_PIN_ASSIGNMENT_INDEX_SCL,
    WOS_PIN_ASSIGNMENT_FLAG_LIDAR_RX = 1 << WOS_PIN_ASSIGNMENT_INDEX_LIDAR_RX,
    WOS_PIN_ASSIGNMENT_FLAG_LIDAR_TX = 1 << WOS_PIN_ASSIGNMENT_INDEX_LIDAR_TX,
    WOS_PIN_ASSIGNMENT_FLAG_LIDAR_INT = 1 << WOS_PIN_ASSIGNMENT_INDEX_LIDAR_INT,
    WOS_PIN_ASSIGNMENT_FLAG_BUTTON1 = 1 << WOS_PIN_ASSIGNMENT_INDEX_BUTTON1,
    WOS_PIN_ASSIGNMENT_FLAG_STROBE = 1 << WOS_PIN_ASSIGNMENT_INDEX_STROBE,
    WOS_PIN_ASSIGNMENT_FLAG_PWM1 = 1 << WOS_PIN_ASSIGNMENT_INDEX_PWM1,
    WOS_PIN_ASSIGNMENT_FLAG_PWM2 = 1 << WOS_PIN_ASSIGNMENT_INDEX_PWM2,
    WOS_PIN_ASSIGNMENT_FLAG_PWM3 = 1 << WOS_PIN_ASSIGNMENT_INDEX_PWM3,
};

enum wos_pin_assignment_enum
{

    WOS_PIN_ASSIGNMENT_SDA = _WOS_PIN_ASSIGNMENT_SDA,
    WOS_PIN_ASSIGNMENT_SCL = _WOS_PIN_ASSIGNMENT_SCL,
    WOS_PIN_ASSIGNMENT_LIDAR_RX = _WOS_PIN_ASSIGNMENT_LIDAR_RX,
    WOS_PIN_ASSIGNMENT_LIDAR_TX = _WOS_PIN_ASSIGNMENT_LIDAR_TX,
    WOS_PIN_ASSIGNMENT_LIDAR_INT = _WOS_PIN_ASSIGNMENT_LIDAR_INT,
    WOS_PIN_ASSIGNMENT_BUTTON1 = _WOS_PIN_ASSIGNMENT_BUTTON1,
    WOS_PIN_ASSIGNMENT_STROBE = _WOS_PIN_ASSIGNMENT_STROBE,
    WOS_PIN_ASSIGNMENT_PWM1 = _WOS_PIN_ASSIGNMENT_PWM1,
    WOS_PIN_ASSIGNMENT_PWM2 = _WOS_PIN_ASSIGNMENT_PWM2,
    WOS_PIN_ASSIGNMENT_PWM3 = _WOS_PIN_ASSIGNMENT_PWM3,
};

int wos_pin_assignment_is_valid(enum wos_pin_assignment_enum value);
char const *wos_pin_assignment_to_string(enum wos_pin_assignment_enum item);
enum wos_pin_assignment_enum wos_pin_assignment_parse(char const *v);
enum wos_pin_assignment_enum wos_pin_assignment_parsei(char const *v);
int wos_pin_assignment_count();
enum wos_pin_assignment_enum wos_pin_assignment_at(int index);
int wos_pin_assignment_index_of(enum wos_pin_assignment_enum item);
enum wos_pin_assignment_enum wos_pin_assignment_clamp(int value);

unsigned int wos_pin_assignment_flag_of(enum wos_pin_assignment_enum item);
unsigned int wos_pin_assignment_test_flag(unsigned int data,
                                          enum wos_pin_assignment_enum item);
unsigned int wos_pin_assignment_set_flag(unsigned int data,
                                         enum wos_pin_assignment_enum item);
unsigned int wos_pin_assignment_clear_flag(unsigned int data,
                                           enum wos_pin_assignment_enum item);

void wos_pin_assignment_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_assignment_is_valid(enum wos_pin_assignment_enum value)
{
    switch (value)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return 1;
    case WOS_PIN_ASSIGNMENT_SCL:
        return 1;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return 1;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return 1;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return 1;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return 1;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return 1;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return 1;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return 1;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_assignment_enum wos_pin_assignment_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return WOS_PIN_ASSIGNMENT_SDA;
    case WOS_PIN_ASSIGNMENT_SCL:
        return WOS_PIN_ASSIGNMENT_SCL;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return WOS_PIN_ASSIGNMENT_LIDAR_RX;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return WOS_PIN_ASSIGNMENT_LIDAR_TX;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return WOS_PIN_ASSIGNMENT_LIDAR_INT;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return WOS_PIN_ASSIGNMENT_BUTTON1;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return WOS_PIN_ASSIGNMENT_STROBE;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return WOS_PIN_ASSIGNMENT_PWM1;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return WOS_PIN_ASSIGNMENT_PWM2;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return WOS_PIN_ASSIGNMENT_PWM3;
    }

    return value > _WOS_PIN_ASSIGNMENT_MAX ? _WOS_PIN_ASSIGNMENT_MAX
                                           : wos_pin_assignment_at(0);
}

unsigned int wos_pin_assignment_flag_of(enum wos_pin_assignment_enum item)
{
    switch (item)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return WOS_PIN_ASSIGNMENT_FLAG_SDA;
    case WOS_PIN_ASSIGNMENT_SCL:
        return WOS_PIN_ASSIGNMENT_FLAG_SCL;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return WOS_PIN_ASSIGNMENT_FLAG_LIDAR_RX;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return WOS_PIN_ASSIGNMENT_FLAG_LIDAR_TX;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return WOS_PIN_ASSIGNMENT_FLAG_LIDAR_INT;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return WOS_PIN_ASSIGNMENT_FLAG_BUTTON1;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return WOS_PIN_ASSIGNMENT_FLAG_STROBE;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return WOS_PIN_ASSIGNMENT_FLAG_PWM1;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return WOS_PIN_ASSIGNMENT_FLAG_PWM2;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return WOS_PIN_ASSIGNMENT_FLAG_PWM3;

    default:
        return 0;
    }
}

unsigned int wos_pin_assignment_test_flag(unsigned int data,
                                          enum wos_pin_assignment_enum item)
{
    switch (item)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_SDA) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_SCL:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_SCL) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_LIDAR_RX) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_LIDAR_TX) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_LIDAR_INT) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_BUTTON1) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_STROBE) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_PWM1) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_PWM2) ? 1 : 0;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return (data & WOS_PIN_ASSIGNMENT_FLAG_PWM3) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_assignment_set_flag(unsigned int data,
                                         enum wos_pin_assignment_enum item)
{
    switch (item)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return data | WOS_PIN_ASSIGNMENT_FLAG_SDA;
    case WOS_PIN_ASSIGNMENT_SCL:
        return data | WOS_PIN_ASSIGNMENT_FLAG_SCL;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return data | WOS_PIN_ASSIGNMENT_FLAG_LIDAR_RX;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return data | WOS_PIN_ASSIGNMENT_FLAG_LIDAR_TX;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return data | WOS_PIN_ASSIGNMENT_FLAG_LIDAR_INT;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return data | WOS_PIN_ASSIGNMENT_FLAG_BUTTON1;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return data | WOS_PIN_ASSIGNMENT_FLAG_STROBE;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return data | WOS_PIN_ASSIGNMENT_FLAG_PWM1;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return data | WOS_PIN_ASSIGNMENT_FLAG_PWM2;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return data | WOS_PIN_ASSIGNMENT_FLAG_PWM3;

    default:
        return data;
    }
}

unsigned int wos_pin_assignment_clear_flag(unsigned int data,
                                           enum wos_pin_assignment_enum item)
{
    switch (item)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_SDA);
    case WOS_PIN_ASSIGNMENT_SCL:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_SCL);
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_LIDAR_RX);
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_LIDAR_TX);
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_LIDAR_INT);
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_BUTTON1);
    case WOS_PIN_ASSIGNMENT_STROBE:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_STROBE);
    case WOS_PIN_ASSIGNMENT_PWM1:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_PWM1);
    case WOS_PIN_ASSIGNMENT_PWM2:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_PWM2);
    case WOS_PIN_ASSIGNMENT_PWM3:
        return data & ~(WOS_PIN_ASSIGNMENT_FLAG_PWM3);

    default:
        return data;
    }
}

char const *wos_pin_assignment_to_string(enum wos_pin_assignment_enum item)
{
    switch (item)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return "SDA";
    case WOS_PIN_ASSIGNMENT_SCL:
        return "SCL";
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return "LIDAR_RX";
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return "LIDAR_TX";
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return "LIDAR_INT";
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return "BUTTON1";
    case WOS_PIN_ASSIGNMENT_STROBE:
        return "STROBE";
    case WOS_PIN_ASSIGNMENT_PWM1:
        return "PWM1";
    case WOS_PIN_ASSIGNMENT_PWM2:
        return "PWM2";
    case WOS_PIN_ASSIGNMENT_PWM3:
        return "PWM3";

    default:
        return "WOS_PIN_ASSIGNMENT_INVALID";
    }
}

enum wos_pin_assignment_enum wos_pin_assignment_parse(char const *v)
{

    if (!X_strcmp("SDA", v))
    {
        return WOS_PIN_ASSIGNMENT_SDA;
    }
    if (!X_strcmp("SCL", v))
    {
        return WOS_PIN_ASSIGNMENT_SCL;
    }
    if (!X_strcmp("LIDAR_RX", v))
    {
        return WOS_PIN_ASSIGNMENT_LIDAR_RX;
    }
    if (!X_strcmp("LIDAR_TX", v))
    {
        return WOS_PIN_ASSIGNMENT_LIDAR_TX;
    }
    if (!X_strcmp("LIDAR_INT", v))
    {
        return WOS_PIN_ASSIGNMENT_LIDAR_INT;
    }
    if (!X_strcmp("BUTTON1", v))
    {
        return WOS_PIN_ASSIGNMENT_BUTTON1;
    }
    if (!X_strcmp("STROBE", v))
    {
        return WOS_PIN_ASSIGNMENT_STROBE;
    }
    if (!X_strcmp("PWM1", v))
    {
        return WOS_PIN_ASSIGNMENT_PWM1;
    }
    if (!X_strcmp("PWM2", v))
    {
        return WOS_PIN_ASSIGNMENT_PWM2;
    }
    if (!X_strcmp("PWM3", v))
    {
        return WOS_PIN_ASSIGNMENT_PWM3;
    }

    return WOS_PIN_ASSIGNMENT_INVALID;
}

enum wos_pin_assignment_enum wos_pin_assignment_parsei(char const *v)
{

    if (!X_strcmpi("SDA", v))
    {
        return WOS_PIN_ASSIGNMENT_SDA;
    }
    if (!X_strcmpi("SCL", v))
    {
        return WOS_PIN_ASSIGNMENT_SCL;
    }
    if (!X_strcmpi("LIDAR_RX", v))
    {
        return WOS_PIN_ASSIGNMENT_LIDAR_RX;
    }
    if (!X_strcmpi("LIDAR_TX", v))
    {
        return WOS_PIN_ASSIGNMENT_LIDAR_TX;
    }
    if (!X_strcmpi("LIDAR_INT", v))
    {
        return WOS_PIN_ASSIGNMENT_LIDAR_INT;
    }
    if (!X_strcmpi("BUTTON1", v))
    {
        return WOS_PIN_ASSIGNMENT_BUTTON1;
    }
    if (!X_strcmpi("STROBE", v))
    {
        return WOS_PIN_ASSIGNMENT_STROBE;
    }
    if (!X_strcmpi("PWM1", v))
    {
        return WOS_PIN_ASSIGNMENT_PWM1;
    }
    if (!X_strcmpi("PWM2", v))
    {
        return WOS_PIN_ASSIGNMENT_PWM2;
    }
    if (!X_strcmpi("PWM3", v))
    {
        return WOS_PIN_ASSIGNMENT_PWM3;
    }

    return WOS_PIN_ASSIGNMENT_INVALID;
}

int wos_pin_assignment_count()
{
    return WOS_PIN_ASSIGNMENT_NUMBER_OF_ITEMS;
}

enum wos_pin_assignment_enum wos_pin_assignment_at(int index)
{
    switch (index)
    {

    case WOS_PIN_ASSIGNMENT_INDEX_SDA:
        return WOS_PIN_ASSIGNMENT_SDA;
    case WOS_PIN_ASSIGNMENT_INDEX_SCL:
        return WOS_PIN_ASSIGNMENT_SCL;
    case WOS_PIN_ASSIGNMENT_INDEX_LIDAR_RX:
        return WOS_PIN_ASSIGNMENT_LIDAR_RX;
    case WOS_PIN_ASSIGNMENT_INDEX_LIDAR_TX:
        return WOS_PIN_ASSIGNMENT_LIDAR_TX;
    case WOS_PIN_ASSIGNMENT_INDEX_LIDAR_INT:
        return WOS_PIN_ASSIGNMENT_LIDAR_INT;
    case WOS_PIN_ASSIGNMENT_INDEX_BUTTON1:
        return WOS_PIN_ASSIGNMENT_BUTTON1;
    case WOS_PIN_ASSIGNMENT_INDEX_STROBE:
        return WOS_PIN_ASSIGNMENT_STROBE;
    case WOS_PIN_ASSIGNMENT_INDEX_PWM1:
        return WOS_PIN_ASSIGNMENT_PWM1;
    case WOS_PIN_ASSIGNMENT_INDEX_PWM2:
        return WOS_PIN_ASSIGNMENT_PWM2;
    case WOS_PIN_ASSIGNMENT_INDEX_PWM3:
        return WOS_PIN_ASSIGNMENT_PWM3;

    default:
        return WOS_PIN_ASSIGNMENT_INVALID;
    }
}

int wos_pin_assignment_index_of(enum wos_pin_assignment_enum item)
{
    switch (item)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return WOS_PIN_ASSIGNMENT_INDEX_SDA;
    case WOS_PIN_ASSIGNMENT_SCL:
        return WOS_PIN_ASSIGNMENT_INDEX_SCL;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return WOS_PIN_ASSIGNMENT_INDEX_LIDAR_RX;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return WOS_PIN_ASSIGNMENT_INDEX_LIDAR_TX;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return WOS_PIN_ASSIGNMENT_INDEX_LIDAR_INT;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return WOS_PIN_ASSIGNMENT_INDEX_BUTTON1;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return WOS_PIN_ASSIGNMENT_INDEX_STROBE;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return WOS_PIN_ASSIGNMENT_INDEX_PWM1;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return WOS_PIN_ASSIGNMENT_INDEX_PWM2;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return WOS_PIN_ASSIGNMENT_INDEX_PWM3;

    default:
        return WOS_PIN_ASSIGNMENT_INDEX_INVALID;
    }
}
# 26 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

enum wos_pin_pad_enum
wos_pin_assignment_get_pad(enum wos_pin_assignment_enum pin)

{
    switch (pin)
    {

    case WOS_PIN_ASSIGNMENT_SDA:
        return WOS_PIN_PAD_PB5;
    case WOS_PIN_ASSIGNMENT_SCL:
        return WOS_PIN_PAD_PB4;
    case WOS_PIN_ASSIGNMENT_LIDAR_RX:
        return WOS_PIN_PAD_PD6;
    case WOS_PIN_ASSIGNMENT_LIDAR_TX:
        return WOS_PIN_PAD_PD5;
    case WOS_PIN_ASSIGNMENT_LIDAR_INT:
        return WOS_PIN_PAD_PA1;
    case WOS_PIN_ASSIGNMENT_BUTTON1:
        return WOS_PIN_PAD_PA2;
    case WOS_PIN_ASSIGNMENT_STROBE:
        return WOS_PIN_PAD_PC4;
    case WOS_PIN_ASSIGNMENT_PWM1:
        return WOS_PIN_PAD_PD4;
    case WOS_PIN_ASSIGNMENT_PWM2:
        return WOS_PIN_PAD_PD3;
    case WOS_PIN_ASSIGNMENT_PWM3:
        return WOS_PIN_PAD_PA3;

    default:
        return WOS_PIN_PAD_INVALID;
    }
}

enum wos_pin_assignment_enum
wos_pin_pad_get_assignment(enum wos_pin_pad_enum pad)

{
    switch (pad)
    {

    case WOS_PIN_PAD_PB5:
        return WOS_PIN_ASSIGNMENT_SDA;
    case WOS_PIN_PAD_PB4:
        return WOS_PIN_ASSIGNMENT_SCL;
    case WOS_PIN_PAD_PD6:
        return WOS_PIN_ASSIGNMENT_LIDAR_RX;
    case WOS_PIN_PAD_PD5:
        return WOS_PIN_ASSIGNMENT_LIDAR_TX;
    case WOS_PIN_PAD_PA1:
        return WOS_PIN_ASSIGNMENT_LIDAR_INT;
    case WOS_PIN_PAD_PA2:
        return WOS_PIN_ASSIGNMENT_BUTTON1;
    case WOS_PIN_PAD_PC4:
        return WOS_PIN_ASSIGNMENT_STROBE;
    case WOS_PIN_PAD_PD4:
        return WOS_PIN_ASSIGNMENT_PWM1;
    case WOS_PIN_PAD_PD3:
        return WOS_PIN_ASSIGNMENT_PWM2;
    case WOS_PIN_PAD_PA3:
        return WOS_PIN_ASSIGNMENT_PWM3;

    default:
        return WOS_PIN_ASSIGNMENT_INVALID;
    }
}

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_pull_meta_enum
{

    WOS_PIN_PULL_INDEX_NONE,
    WOS_PIN_PULL_INDEX_UP,
    WOS_PIN_PULL_INDEX_DOWN,

    WOS_PIN_PULL_NUMBER_OF_ITEMS,
    WOS_PIN_PULL_INDEX_INVALID = WOS_PIN_PULL_NUMBER_OF_ITEMS,

    WOS_PIN_PULL_INVALID = 0,

    _WOS_PIN_PULL_NONE,
    _WOS_PIN_PULL_UP,
    _WOS_PIN_PULL_DOWN,

    _WOS_PIN_PULL_NEXT,
    _WOS_PIN_PULL_MAX = _WOS_PIN_PULL_NEXT - 1,

    WOS_PIN_PULL_FLAG_NONE = 1 << WOS_PIN_PULL_INDEX_NONE,
    WOS_PIN_PULL_FLAG_UP = 1 << WOS_PIN_PULL_INDEX_UP,
    WOS_PIN_PULL_FLAG_DOWN = 1 << WOS_PIN_PULL_INDEX_DOWN,
};

enum wos_pin_pull_enum
{

    WOS_PIN_PULL_NONE = _WOS_PIN_PULL_NONE,
    WOS_PIN_PULL_UP = _WOS_PIN_PULL_UP,
    WOS_PIN_PULL_DOWN = _WOS_PIN_PULL_DOWN,
};

int wos_pin_pull_is_valid(enum wos_pin_pull_enum value);
char const *wos_pin_pull_to_string(enum wos_pin_pull_enum item);
enum wos_pin_pull_enum wos_pin_pull_parse(char const *v);
enum wos_pin_pull_enum wos_pin_pull_parsei(char const *v);
int wos_pin_pull_count();
enum wos_pin_pull_enum wos_pin_pull_at(int index);
int wos_pin_pull_index_of(enum wos_pin_pull_enum item);
enum wos_pin_pull_enum wos_pin_pull_clamp(int value);

unsigned int wos_pin_pull_flag_of(enum wos_pin_pull_enum item);
unsigned int wos_pin_pull_test_flag(unsigned int data,
                                    enum wos_pin_pull_enum item);
unsigned int wos_pin_pull_set_flag(unsigned int data,
                                   enum wos_pin_pull_enum item);
unsigned int wos_pin_pull_clear_flag(unsigned int data,
                                     enum wos_pin_pull_enum item);

void wos_pin_pull_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_pull_is_valid(enum wos_pin_pull_enum value)
{
    switch (value)
    {

    case WOS_PIN_PULL_NONE:
        return 1;
    case WOS_PIN_PULL_UP:
        return 1;
    case WOS_PIN_PULL_DOWN:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_pull_enum wos_pin_pull_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_PULL_NONE:
        return WOS_PIN_PULL_NONE;
    case WOS_PIN_PULL_UP:
        return WOS_PIN_PULL_UP;
    case WOS_PIN_PULL_DOWN:
        return WOS_PIN_PULL_DOWN;
    }

    return value > _WOS_PIN_PULL_MAX ? _WOS_PIN_PULL_MAX : wos_pin_pull_at(0);
}

unsigned int wos_pin_pull_flag_of(enum wos_pin_pull_enum item)
{
    switch (item)
    {

    case WOS_PIN_PULL_NONE:
        return WOS_PIN_PULL_FLAG_NONE;
    case WOS_PIN_PULL_UP:
        return WOS_PIN_PULL_FLAG_UP;
    case WOS_PIN_PULL_DOWN:
        return WOS_PIN_PULL_FLAG_DOWN;

    default:
        return 0;
    }
}

unsigned int wos_pin_pull_test_flag(unsigned int data,
                                    enum wos_pin_pull_enum item)
{
    switch (item)
    {

    case WOS_PIN_PULL_NONE:
        return (data & WOS_PIN_PULL_FLAG_NONE) ? 1 : 0;
    case WOS_PIN_PULL_UP:
        return (data & WOS_PIN_PULL_FLAG_UP) ? 1 : 0;
    case WOS_PIN_PULL_DOWN:
        return (data & WOS_PIN_PULL_FLAG_DOWN) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_pull_set_flag(unsigned int data,
                                   enum wos_pin_pull_enum item)
{
    switch (item)
    {

    case WOS_PIN_PULL_NONE:
        return data | WOS_PIN_PULL_FLAG_NONE;
    case WOS_PIN_PULL_UP:
        return data | WOS_PIN_PULL_FLAG_UP;
    case WOS_PIN_PULL_DOWN:
        return data | WOS_PIN_PULL_FLAG_DOWN;

    default:
        return data;
    }
}

unsigned int wos_pin_pull_clear_flag(unsigned int data,
                                     enum wos_pin_pull_enum item)
{
    switch (item)
    {

    case WOS_PIN_PULL_NONE:
        return data & ~(WOS_PIN_PULL_FLAG_NONE);
    case WOS_PIN_PULL_UP:
        return data & ~(WOS_PIN_PULL_FLAG_UP);
    case WOS_PIN_PULL_DOWN:
        return data & ~(WOS_PIN_PULL_FLAG_DOWN);

    default:
        return data;
    }
}

char const *wos_pin_pull_to_string(enum wos_pin_pull_enum item)
{
    switch (item)
    {

    case WOS_PIN_PULL_NONE:
        return "NONE";
    case WOS_PIN_PULL_UP:
        return "UP";
    case WOS_PIN_PULL_DOWN:
        return "DOWN";

    default:
        return "WOS_PIN_PULL_INVALID";
    }
}

enum wos_pin_pull_enum wos_pin_pull_parse(char const *v)
{

    if (!X_strcmp("NONE", v))
    {
        return WOS_PIN_PULL_NONE;
    }
    if (!X_strcmp("UP", v))
    {
        return WOS_PIN_PULL_UP;
    }
    if (!X_strcmp("DOWN", v))
    {
        return WOS_PIN_PULL_DOWN;
    }

    return WOS_PIN_PULL_INVALID;
}

enum wos_pin_pull_enum wos_pin_pull_parsei(char const *v)
{

    if (!X_strcmpi("NONE", v))
    {
        return WOS_PIN_PULL_NONE;
    }
    if (!X_strcmpi("UP", v))
    {
        return WOS_PIN_PULL_UP;
    }
    if (!X_strcmpi("DOWN", v))
    {
        return WOS_PIN_PULL_DOWN;
    }

    return WOS_PIN_PULL_INVALID;
}

int wos_pin_pull_count()
{
    return WOS_PIN_PULL_NUMBER_OF_ITEMS;
}

enum wos_pin_pull_enum wos_pin_pull_at(int index)
{
    switch (index)
    {

    case WOS_PIN_PULL_INDEX_NONE:
        return WOS_PIN_PULL_NONE;
    case WOS_PIN_PULL_INDEX_UP:
        return WOS_PIN_PULL_UP;
    case WOS_PIN_PULL_INDEX_DOWN:
        return WOS_PIN_PULL_DOWN;

    default:
        return WOS_PIN_PULL_INVALID;
    }
}

int wos_pin_pull_index_of(enum wos_pin_pull_enum item)
{
    switch (item)
    {

    case WOS_PIN_PULL_NONE:
        return WOS_PIN_PULL_INDEX_NONE;
    case WOS_PIN_PULL_UP:
        return WOS_PIN_PULL_INDEX_UP;
    case WOS_PIN_PULL_DOWN:
        return WOS_PIN_PULL_INDEX_DOWN;

    default:
        return WOS_PIN_PULL_INDEX_INVALID;
    }
}
# 71 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2
# 81 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h"
# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_interrupt_type_meta_enum
{

    WOS_PIN_INTERRUPT_TYPE_INDEX_NONE,
    WOS_PIN_INTERRUPT_TYPE_INDEX_RISING,
    WOS_PIN_INTERRUPT_TYPE_INDEX_FALLING,
    WOS_PIN_INTERRUPT_TYPE_INDEX_EDGE,
    WOS_PIN_INTERRUPT_TYPE_INDEX_LOW,
    WOS_PIN_INTERRUPT_TYPE_INDEX_HIGH,

    WOS_PIN_INTERRUPT_TYPE_NUMBER_OF_ITEMS,
    WOS_PIN_INTERRUPT_TYPE_INDEX_INVALID =
        WOS_PIN_INTERRUPT_TYPE_NUMBER_OF_ITEMS,

    WOS_PIN_INTERRUPT_TYPE_INVALID = 0,

    _WOS_PIN_INTERRUPT_TYPE_NONE,
    _WOS_PIN_INTERRUPT_TYPE_RISING,
    _WOS_PIN_INTERRUPT_TYPE_FALLING,
    _WOS_PIN_INTERRUPT_TYPE_EDGE,
    _WOS_PIN_INTERRUPT_TYPE_LOW,
    _WOS_PIN_INTERRUPT_TYPE_HIGH,

    _WOS_PIN_INTERRUPT_TYPE_NEXT,
    _WOS_PIN_INTERRUPT_TYPE_MAX = _WOS_PIN_INTERRUPT_TYPE_NEXT - 1,

    WOS_PIN_INTERRUPT_TYPE_FLAG_NONE = 1 << WOS_PIN_INTERRUPT_TYPE_INDEX_NONE,
    WOS_PIN_INTERRUPT_TYPE_FLAG_RISING = 1
                                         << WOS_PIN_INTERRUPT_TYPE_INDEX_RISING,
    WOS_PIN_INTERRUPT_TYPE_FLAG_FALLING =
        1 << WOS_PIN_INTERRUPT_TYPE_INDEX_FALLING,
    WOS_PIN_INTERRUPT_TYPE_FLAG_EDGE = 1 << WOS_PIN_INTERRUPT_TYPE_INDEX_EDGE,
    WOS_PIN_INTERRUPT_TYPE_FLAG_LOW = 1 << WOS_PIN_INTERRUPT_TYPE_INDEX_LOW,
    WOS_PIN_INTERRUPT_TYPE_FLAG_HIGH = 1 << WOS_PIN_INTERRUPT_TYPE_INDEX_HIGH,
};

enum wos_pin_interrupt_type_enum
{

    WOS_PIN_INTERRUPT_TYPE_NONE = _WOS_PIN_INTERRUPT_TYPE_NONE,
    WOS_PIN_INTERRUPT_TYPE_RISING = _WOS_PIN_INTERRUPT_TYPE_RISING,
    WOS_PIN_INTERRUPT_TYPE_FALLING = _WOS_PIN_INTERRUPT_TYPE_FALLING,
    WOS_PIN_INTERRUPT_TYPE_EDGE = _WOS_PIN_INTERRUPT_TYPE_EDGE,
    WOS_PIN_INTERRUPT_TYPE_LOW = _WOS_PIN_INTERRUPT_TYPE_LOW,
    WOS_PIN_INTERRUPT_TYPE_HIGH = _WOS_PIN_INTERRUPT_TYPE_HIGH,
};

int wos_pin_interrupt_type_is_valid(enum wos_pin_interrupt_type_enum value);
char const *
wos_pin_interrupt_type_to_string(enum wos_pin_interrupt_type_enum item);
enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_parse(char const *v);
enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_parsei(char const *v);
int wos_pin_interrupt_type_count();
enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_at(int index);
int wos_pin_interrupt_type_index_of(enum wos_pin_interrupt_type_enum item);
enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_clamp(int value);

unsigned int
wos_pin_interrupt_type_flag_of(enum wos_pin_interrupt_type_enum item);
unsigned int
wos_pin_interrupt_type_test_flag(unsigned int data,
                                 enum wos_pin_interrupt_type_enum item);
unsigned int
wos_pin_interrupt_type_set_flag(unsigned int data,
                                enum wos_pin_interrupt_type_enum item);
unsigned int
wos_pin_interrupt_type_clear_flag(unsigned int data,
                                  enum wos_pin_interrupt_type_enum item);

void wos_pin_interrupt_type_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_interrupt_type_is_valid(enum wos_pin_interrupt_type_enum value)
{
    switch (value)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return 1;
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return 1;
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return 1;
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return 1;
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return 1;
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return WOS_PIN_INTERRUPT_TYPE_NONE;
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return WOS_PIN_INTERRUPT_TYPE_RISING;
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return WOS_PIN_INTERRUPT_TYPE_FALLING;
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return WOS_PIN_INTERRUPT_TYPE_EDGE;
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return WOS_PIN_INTERRUPT_TYPE_LOW;
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return WOS_PIN_INTERRUPT_TYPE_HIGH;
    }

    return value > _WOS_PIN_INTERRUPT_TYPE_MAX ? _WOS_PIN_INTERRUPT_TYPE_MAX
                                               : wos_pin_interrupt_type_at(0);
}

unsigned int
wos_pin_interrupt_type_flag_of(enum wos_pin_interrupt_type_enum item)
{
    switch (item)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return WOS_PIN_INTERRUPT_TYPE_FLAG_NONE;
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return WOS_PIN_INTERRUPT_TYPE_FLAG_RISING;
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return WOS_PIN_INTERRUPT_TYPE_FLAG_FALLING;
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return WOS_PIN_INTERRUPT_TYPE_FLAG_EDGE;
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return WOS_PIN_INTERRUPT_TYPE_FLAG_LOW;
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return WOS_PIN_INTERRUPT_TYPE_FLAG_HIGH;

    default:
        return 0;
    }
}

unsigned int
wos_pin_interrupt_type_test_flag(unsigned int data,
                                 enum wos_pin_interrupt_type_enum item)
{
    switch (item)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return (data & WOS_PIN_INTERRUPT_TYPE_FLAG_NONE) ? 1 : 0;
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return (data & WOS_PIN_INTERRUPT_TYPE_FLAG_RISING) ? 1 : 0;
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return (data & WOS_PIN_INTERRUPT_TYPE_FLAG_FALLING) ? 1 : 0;
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return (data & WOS_PIN_INTERRUPT_TYPE_FLAG_EDGE) ? 1 : 0;
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return (data & WOS_PIN_INTERRUPT_TYPE_FLAG_LOW) ? 1 : 0;
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return (data & WOS_PIN_INTERRUPT_TYPE_FLAG_HIGH) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int
wos_pin_interrupt_type_set_flag(unsigned int data,
                                enum wos_pin_interrupt_type_enum item)
{
    switch (item)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return data | WOS_PIN_INTERRUPT_TYPE_FLAG_NONE;
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return data | WOS_PIN_INTERRUPT_TYPE_FLAG_RISING;
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return data | WOS_PIN_INTERRUPT_TYPE_FLAG_FALLING;
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return data | WOS_PIN_INTERRUPT_TYPE_FLAG_EDGE;
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return data | WOS_PIN_INTERRUPT_TYPE_FLAG_LOW;
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return data | WOS_PIN_INTERRUPT_TYPE_FLAG_HIGH;

    default:
        return data;
    }
}

unsigned int
wos_pin_interrupt_type_clear_flag(unsigned int data,
                                  enum wos_pin_interrupt_type_enum item)
{
    switch (item)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return data & ~(WOS_PIN_INTERRUPT_TYPE_FLAG_NONE);
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return data & ~(WOS_PIN_INTERRUPT_TYPE_FLAG_RISING);
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return data & ~(WOS_PIN_INTERRUPT_TYPE_FLAG_FALLING);
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return data & ~(WOS_PIN_INTERRUPT_TYPE_FLAG_EDGE);
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return data & ~(WOS_PIN_INTERRUPT_TYPE_FLAG_LOW);
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return data & ~(WOS_PIN_INTERRUPT_TYPE_FLAG_HIGH);

    default:
        return data;
    }
}

char const *
wos_pin_interrupt_type_to_string(enum wos_pin_interrupt_type_enum item)
{
    switch (item)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return "NONE";
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return "RISING";
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return "FALLING";
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return "EDGE";
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return "LOW";
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return "HIGH";

    default:
        return "WOS_PIN_INTERRUPT_TYPE_INVALID";
    }
}

enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_parse(char const *v)
{

    if (!X_strcmp("NONE", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_NONE;
    }
    if (!X_strcmp("RISING", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_RISING;
    }
    if (!X_strcmp("FALLING", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_FALLING;
    }
    if (!X_strcmp("EDGE", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_EDGE;
    }
    if (!X_strcmp("LOW", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_LOW;
    }
    if (!X_strcmp("HIGH", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_HIGH;
    }

    return WOS_PIN_INTERRUPT_TYPE_INVALID;
}

enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_parsei(char const *v)
{

    if (!X_strcmpi("NONE", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_NONE;
    }
    if (!X_strcmpi("RISING", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_RISING;
    }
    if (!X_strcmpi("FALLING", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_FALLING;
    }
    if (!X_strcmpi("EDGE", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_EDGE;
    }
    if (!X_strcmpi("LOW", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_LOW;
    }
    if (!X_strcmpi("HIGH", v))
    {
        return WOS_PIN_INTERRUPT_TYPE_HIGH;
    }

    return WOS_PIN_INTERRUPT_TYPE_INVALID;
}

int wos_pin_interrupt_type_count()
{
    return WOS_PIN_INTERRUPT_TYPE_NUMBER_OF_ITEMS;
}

enum wos_pin_interrupt_type_enum wos_pin_interrupt_type_at(int index)
{
    switch (index)
    {

    case WOS_PIN_INTERRUPT_TYPE_INDEX_NONE:
        return WOS_PIN_INTERRUPT_TYPE_NONE;
    case WOS_PIN_INTERRUPT_TYPE_INDEX_RISING:
        return WOS_PIN_INTERRUPT_TYPE_RISING;
    case WOS_PIN_INTERRUPT_TYPE_INDEX_FALLING:
        return WOS_PIN_INTERRUPT_TYPE_FALLING;
    case WOS_PIN_INTERRUPT_TYPE_INDEX_EDGE:
        return WOS_PIN_INTERRUPT_TYPE_EDGE;
    case WOS_PIN_INTERRUPT_TYPE_INDEX_LOW:
        return WOS_PIN_INTERRUPT_TYPE_LOW;
    case WOS_PIN_INTERRUPT_TYPE_INDEX_HIGH:
        return WOS_PIN_INTERRUPT_TYPE_HIGH;

    default:
        return WOS_PIN_INTERRUPT_TYPE_INVALID;
    }
}

int wos_pin_interrupt_type_index_of(enum wos_pin_interrupt_type_enum item)
{
    switch (item)
    {

    case WOS_PIN_INTERRUPT_TYPE_NONE:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_NONE;
    case WOS_PIN_INTERRUPT_TYPE_RISING:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_RISING;
    case WOS_PIN_INTERRUPT_TYPE_FALLING:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_FALLING;
    case WOS_PIN_INTERRUPT_TYPE_EDGE:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_EDGE;
    case WOS_PIN_INTERRUPT_TYPE_LOW:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_LOW;
    case WOS_PIN_INTERRUPT_TYPE_HIGH:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_HIGH;

    default:
        return WOS_PIN_INTERRUPT_TYPE_INDEX_INVALID;
    }
}
# 82 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_gp_input_meta_enum
{

    WOS_PIN_GP_INPUT_INDEX_LIDAR_INT,
    WOS_PIN_GP_INPUT_INDEX_BUTTON1,
    WOS_PIN_GP_INPUT_INDEX_STROBE,

    WOS_PIN_GP_INPUT_NUMBER_OF_ITEMS,
    WOS_PIN_GP_INPUT_INDEX_INVALID = WOS_PIN_GP_INPUT_NUMBER_OF_ITEMS,

    WOS_PIN_GP_INPUT_INVALID = 0,

    _WOS_PIN_GP_INPUT_LIDAR_INT,
    _WOS_PIN_GP_INPUT_BUTTON1,
    _WOS_PIN_GP_INPUT_STROBE,

    _WOS_PIN_GP_INPUT_NEXT,
    _WOS_PIN_GP_INPUT_MAX = _WOS_PIN_GP_INPUT_NEXT - 1,

    WOS_PIN_GP_INPUT_FLAG_LIDAR_INT = 1 << WOS_PIN_GP_INPUT_INDEX_LIDAR_INT,
    WOS_PIN_GP_INPUT_FLAG_BUTTON1 = 1 << WOS_PIN_GP_INPUT_INDEX_BUTTON1,
    WOS_PIN_GP_INPUT_FLAG_STROBE = 1 << WOS_PIN_GP_INPUT_INDEX_STROBE,
};

enum wos_pin_gp_input_enum
{

    WOS_PIN_GP_INPUT_LIDAR_INT = _WOS_PIN_GP_INPUT_LIDAR_INT,
    WOS_PIN_GP_INPUT_BUTTON1 = _WOS_PIN_GP_INPUT_BUTTON1,
    WOS_PIN_GP_INPUT_STROBE = _WOS_PIN_GP_INPUT_STROBE,
};

int wos_pin_gp_input_is_valid(enum wos_pin_gp_input_enum value);
char const *wos_pin_gp_input_to_string(enum wos_pin_gp_input_enum item);
enum wos_pin_gp_input_enum wos_pin_gp_input_parse(char const *v);
enum wos_pin_gp_input_enum wos_pin_gp_input_parsei(char const *v);
int wos_pin_gp_input_count();
enum wos_pin_gp_input_enum wos_pin_gp_input_at(int index);
int wos_pin_gp_input_index_of(enum wos_pin_gp_input_enum item);
enum wos_pin_gp_input_enum wos_pin_gp_input_clamp(int value);

unsigned int wos_pin_gp_input_flag_of(enum wos_pin_gp_input_enum item);
unsigned int wos_pin_gp_input_test_flag(unsigned int data,
                                        enum wos_pin_gp_input_enum item);
unsigned int wos_pin_gp_input_set_flag(unsigned int data,
                                       enum wos_pin_gp_input_enum item);
unsigned int wos_pin_gp_input_clear_flag(unsigned int data,
                                         enum wos_pin_gp_input_enum item);

void wos_pin_gp_input_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_gp_input_is_valid(enum wos_pin_gp_input_enum value)
{
    switch (value)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return 1;
    case WOS_PIN_GP_INPUT_BUTTON1:
        return 1;
    case WOS_PIN_GP_INPUT_STROBE:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_gp_input_enum wos_pin_gp_input_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return WOS_PIN_GP_INPUT_LIDAR_INT;
    case WOS_PIN_GP_INPUT_BUTTON1:
        return WOS_PIN_GP_INPUT_BUTTON1;
    case WOS_PIN_GP_INPUT_STROBE:
        return WOS_PIN_GP_INPUT_STROBE;
    }

    return value > _WOS_PIN_GP_INPUT_MAX ? _WOS_PIN_GP_INPUT_MAX
                                         : wos_pin_gp_input_at(0);
}

unsigned int wos_pin_gp_input_flag_of(enum wos_pin_gp_input_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return WOS_PIN_GP_INPUT_FLAG_LIDAR_INT;
    case WOS_PIN_GP_INPUT_BUTTON1:
        return WOS_PIN_GP_INPUT_FLAG_BUTTON1;
    case WOS_PIN_GP_INPUT_STROBE:
        return WOS_PIN_GP_INPUT_FLAG_STROBE;

    default:
        return 0;
    }
}

unsigned int wos_pin_gp_input_test_flag(unsigned int data,
                                        enum wos_pin_gp_input_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return (data & WOS_PIN_GP_INPUT_FLAG_LIDAR_INT) ? 1 : 0;
    case WOS_PIN_GP_INPUT_BUTTON1:
        return (data & WOS_PIN_GP_INPUT_FLAG_BUTTON1) ? 1 : 0;
    case WOS_PIN_GP_INPUT_STROBE:
        return (data & WOS_PIN_GP_INPUT_FLAG_STROBE) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_gp_input_set_flag(unsigned int data,
                                       enum wos_pin_gp_input_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return data | WOS_PIN_GP_INPUT_FLAG_LIDAR_INT;
    case WOS_PIN_GP_INPUT_BUTTON1:
        return data | WOS_PIN_GP_INPUT_FLAG_BUTTON1;
    case WOS_PIN_GP_INPUT_STROBE:
        return data | WOS_PIN_GP_INPUT_FLAG_STROBE;

    default:
        return data;
    }
}

unsigned int wos_pin_gp_input_clear_flag(unsigned int data,
                                         enum wos_pin_gp_input_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return data & ~(WOS_PIN_GP_INPUT_FLAG_LIDAR_INT);
    case WOS_PIN_GP_INPUT_BUTTON1:
        return data & ~(WOS_PIN_GP_INPUT_FLAG_BUTTON1);
    case WOS_PIN_GP_INPUT_STROBE:
        return data & ~(WOS_PIN_GP_INPUT_FLAG_STROBE);

    default:
        return data;
    }
}

char const *wos_pin_gp_input_to_string(enum wos_pin_gp_input_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return "LIDAR_INT";
    case WOS_PIN_GP_INPUT_BUTTON1:
        return "BUTTON1";
    case WOS_PIN_GP_INPUT_STROBE:
        return "STROBE";

    default:
        return "WOS_PIN_GP_INPUT_INVALID";
    }
}

enum wos_pin_gp_input_enum wos_pin_gp_input_parse(char const *v)
{

    if (!X_strcmp("LIDAR_INT", v))
    {
        return WOS_PIN_GP_INPUT_LIDAR_INT;
    }
    if (!X_strcmp("BUTTON1", v))
    {
        return WOS_PIN_GP_INPUT_BUTTON1;
    }
    if (!X_strcmp("STROBE", v))
    {
        return WOS_PIN_GP_INPUT_STROBE;
    }

    return WOS_PIN_GP_INPUT_INVALID;
}

enum wos_pin_gp_input_enum wos_pin_gp_input_parsei(char const *v)
{

    if (!X_strcmpi("LIDAR_INT", v))
    {
        return WOS_PIN_GP_INPUT_LIDAR_INT;
    }
    if (!X_strcmpi("BUTTON1", v))
    {
        return WOS_PIN_GP_INPUT_BUTTON1;
    }
    if (!X_strcmpi("STROBE", v))
    {
        return WOS_PIN_GP_INPUT_STROBE;
    }

    return WOS_PIN_GP_INPUT_INVALID;
}

int wos_pin_gp_input_count()
{
    return WOS_PIN_GP_INPUT_NUMBER_OF_ITEMS;
}

enum wos_pin_gp_input_enum wos_pin_gp_input_at(int index)
{
    switch (index)
    {

    case WOS_PIN_GP_INPUT_INDEX_LIDAR_INT:
        return WOS_PIN_GP_INPUT_LIDAR_INT;
    case WOS_PIN_GP_INPUT_INDEX_BUTTON1:
        return WOS_PIN_GP_INPUT_BUTTON1;
    case WOS_PIN_GP_INPUT_INDEX_STROBE:
        return WOS_PIN_GP_INPUT_STROBE;

    default:
        return WOS_PIN_GP_INPUT_INVALID;
    }
}

int wos_pin_gp_input_index_of(enum wos_pin_gp_input_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_INPUT_LIDAR_INT:
        return WOS_PIN_GP_INPUT_INDEX_LIDAR_INT;
    case WOS_PIN_GP_INPUT_BUTTON1:
        return WOS_PIN_GP_INPUT_INDEX_BUTTON1;
    case WOS_PIN_GP_INPUT_STROBE:
        return WOS_PIN_GP_INPUT_INDEX_STROBE;

    default:
        return WOS_PIN_GP_INPUT_INDEX_INVALID;
    }
}
# 88 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

WOS_PIN_STATUS wos_pin_init_gp_input(void)

{
    int rv = WOS_PIN_STATUS_OK;

    rv += wos_pin_bsp_init_gp_input(
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_LIDAR_INT),
        WOS_PIN_PULL_UP, WOS_PIN_INTERRUPT_TYPE_RISING);
    rv += wos_pin_bsp_init_gp_input(
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_BUTTON1), WOS_PIN_PULL_UP,
        WOS_PIN_INTERRUPT_TYPE_FALLING);
    rv += wos_pin_bsp_init_gp_input(
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_STROBE), WOS_PIN_PULL_UP,
        WOS_PIN_INTERRUPT_TYPE_EDGE);

    return rv;
}

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 107 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_output_configuration_meta_enum
{

    WOS_PIN_OUTPUT_CONFIGURATION_INDEX_OPEN_DRAIN,
    WOS_PIN_OUTPUT_CONFIGURATION_INDEX_PUSH_PULL,

    WOS_PIN_OUTPUT_CONFIGURATION_NUMBER_OF_ITEMS,
    WOS_PIN_OUTPUT_CONFIGURATION_INDEX_INVALID =
        WOS_PIN_OUTPUT_CONFIGURATION_NUMBER_OF_ITEMS,

    WOS_PIN_OUTPUT_CONFIGURATION_INVALID = 0,

    _WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN,
    _WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL,

    _WOS_PIN_OUTPUT_CONFIGURATION_NEXT,
    _WOS_PIN_OUTPUT_CONFIGURATION_MAX = _WOS_PIN_OUTPUT_CONFIGURATION_NEXT - 1,

    WOS_PIN_OUTPUT_CONFIGURATION_FLAG_OPEN_DRAIN =
        1 << WOS_PIN_OUTPUT_CONFIGURATION_INDEX_OPEN_DRAIN,
    WOS_PIN_OUTPUT_CONFIGURATION_FLAG_PUSH_PULL =
        1 << WOS_PIN_OUTPUT_CONFIGURATION_INDEX_PUSH_PULL,
};

enum wos_pin_output_configuration_enum
{

    WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN =
        _WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN,
    WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL =
        _WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL,
};

int wos_pin_output_configuration_is_valid(
    enum wos_pin_output_configuration_enum value);
char const *wos_pin_output_configuration_to_string(
    enum wos_pin_output_configuration_enum item);
enum wos_pin_output_configuration_enum
wos_pin_output_configuration_parse(char const *v);
enum wos_pin_output_configuration_enum
wos_pin_output_configuration_parsei(char const *v);
int wos_pin_output_configuration_count();
enum wos_pin_output_configuration_enum
wos_pin_output_configuration_at(int index);
int wos_pin_output_configuration_index_of(
    enum wos_pin_output_configuration_enum item);
enum wos_pin_output_configuration_enum
wos_pin_output_configuration_clamp(int value);

unsigned int wos_pin_output_configuration_flag_of(
    enum wos_pin_output_configuration_enum item);
unsigned int wos_pin_output_configuration_test_flag(
    unsigned int data, enum wos_pin_output_configuration_enum item);
unsigned int wos_pin_output_configuration_set_flag(
    unsigned int data, enum wos_pin_output_configuration_enum item);
unsigned int wos_pin_output_configuration_clear_flag(
    unsigned int data, enum wos_pin_output_configuration_enum item);

void wos_pin_output_configuration_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_output_configuration_is_valid(
    enum wos_pin_output_configuration_enum value)
{
    switch (value)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return 1;
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_output_configuration_enum
wos_pin_output_configuration_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN;
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL;
    }

    return value > _WOS_PIN_OUTPUT_CONFIGURATION_MAX
               ? _WOS_PIN_OUTPUT_CONFIGURATION_MAX
               : wos_pin_output_configuration_at(0);
}

unsigned int wos_pin_output_configuration_flag_of(
    enum wos_pin_output_configuration_enum item)
{
    switch (item)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return WOS_PIN_OUTPUT_CONFIGURATION_FLAG_OPEN_DRAIN;
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return WOS_PIN_OUTPUT_CONFIGURATION_FLAG_PUSH_PULL;

    default:
        return 0;
    }
}

unsigned int wos_pin_output_configuration_test_flag(
    unsigned int data, enum wos_pin_output_configuration_enum item)
{
    switch (item)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return (data & WOS_PIN_OUTPUT_CONFIGURATION_FLAG_OPEN_DRAIN) ? 1 : 0;
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return (data & WOS_PIN_OUTPUT_CONFIGURATION_FLAG_PUSH_PULL) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_output_configuration_set_flag(
    unsigned int data, enum wos_pin_output_configuration_enum item)
{
    switch (item)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return data | WOS_PIN_OUTPUT_CONFIGURATION_FLAG_OPEN_DRAIN;
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return data | WOS_PIN_OUTPUT_CONFIGURATION_FLAG_PUSH_PULL;

    default:
        return data;
    }
}

unsigned int wos_pin_output_configuration_clear_flag(
    unsigned int data, enum wos_pin_output_configuration_enum item)
{
    switch (item)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return data & ~(WOS_PIN_OUTPUT_CONFIGURATION_FLAG_OPEN_DRAIN);
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return data & ~(WOS_PIN_OUTPUT_CONFIGURATION_FLAG_PUSH_PULL);

    default:
        return data;
    }
}

char const *wos_pin_output_configuration_to_string(
    enum wos_pin_output_configuration_enum item)
{
    switch (item)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return "OPEN_DRAIN";
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return "PUSH_PULL";

    default:
        return "WOS_PIN_OUTPUT_CONFIGURATION_INVALID";
    }
}

enum wos_pin_output_configuration_enum
wos_pin_output_configuration_parse(char const *v)
{

    if (!X_strcmp("OPEN_DRAIN", v))
    {
        return WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN;
    }
    if (!X_strcmp("PUSH_PULL", v))
    {
        return WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL;
    }

    return WOS_PIN_OUTPUT_CONFIGURATION_INVALID;
}

enum wos_pin_output_configuration_enum
wos_pin_output_configuration_parsei(char const *v)
{

    if (!X_strcmpi("OPEN_DRAIN", v))
    {
        return WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN;
    }
    if (!X_strcmpi("PUSH_PULL", v))
    {
        return WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL;
    }

    return WOS_PIN_OUTPUT_CONFIGURATION_INVALID;
}

int wos_pin_output_configuration_count()
{
    return WOS_PIN_OUTPUT_CONFIGURATION_NUMBER_OF_ITEMS;
}

enum wos_pin_output_configuration_enum
wos_pin_output_configuration_at(int index)
{
    switch (index)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_INDEX_OPEN_DRAIN:
        return WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN;
    case WOS_PIN_OUTPUT_CONFIGURATION_INDEX_PUSH_PULL:
        return WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL;

    default:
        return WOS_PIN_OUTPUT_CONFIGURATION_INVALID;
    }
}

int wos_pin_output_configuration_index_of(
    enum wos_pin_output_configuration_enum item)
{
    switch (item)
    {

    case WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN:
        return WOS_PIN_OUTPUT_CONFIGURATION_INDEX_OPEN_DRAIN;
    case WOS_PIN_OUTPUT_CONFIGURATION_PUSH_PULL:
        return WOS_PIN_OUTPUT_CONFIGURATION_INDEX_PUSH_PULL;

    default:
        return WOS_PIN_OUTPUT_CONFIGURATION_INDEX_INVALID;
    }
}
# 114 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2
# 122 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h"
# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_drive_strength_meta_enum
{

    WOS_PIN_DRIVE_STRENGTH_INDEX_LOW,
    WOS_PIN_DRIVE_STRENGTH_INDEX_MEDIUM,
    WOS_PIN_DRIVE_STRENGTH_INDEX_HIGH,
    WOS_PIN_DRIVE_STRENGTH_INDEX_VERY_HIGH,

    WOS_PIN_DRIVE_STRENGTH_NUMBER_OF_ITEMS,
    WOS_PIN_DRIVE_STRENGTH_INDEX_INVALID =
        WOS_PIN_DRIVE_STRENGTH_NUMBER_OF_ITEMS,

    WOS_PIN_DRIVE_STRENGTH_INVALID = 0,

    _WOS_PIN_DRIVE_STRENGTH_LOW,
    _WOS_PIN_DRIVE_STRENGTH_MEDIUM,
    _WOS_PIN_DRIVE_STRENGTH_HIGH,
    _WOS_PIN_DRIVE_STRENGTH_VERY_HIGH,

    _WOS_PIN_DRIVE_STRENGTH_NEXT,
    _WOS_PIN_DRIVE_STRENGTH_MAX = _WOS_PIN_DRIVE_STRENGTH_NEXT - 1,

    WOS_PIN_DRIVE_STRENGTH_FLAG_LOW = 1 << WOS_PIN_DRIVE_STRENGTH_INDEX_LOW,
    WOS_PIN_DRIVE_STRENGTH_FLAG_MEDIUM = 1
                                         << WOS_PIN_DRIVE_STRENGTH_INDEX_MEDIUM,
    WOS_PIN_DRIVE_STRENGTH_FLAG_HIGH = 1 << WOS_PIN_DRIVE_STRENGTH_INDEX_HIGH,
    WOS_PIN_DRIVE_STRENGTH_FLAG_VERY_HIGH =
        1 << WOS_PIN_DRIVE_STRENGTH_INDEX_VERY_HIGH,
};

enum wos_pin_drive_strength_enum
{

    WOS_PIN_DRIVE_STRENGTH_LOW = _WOS_PIN_DRIVE_STRENGTH_LOW,
    WOS_PIN_DRIVE_STRENGTH_MEDIUM = _WOS_PIN_DRIVE_STRENGTH_MEDIUM,
    WOS_PIN_DRIVE_STRENGTH_HIGH = _WOS_PIN_DRIVE_STRENGTH_HIGH,
    WOS_PIN_DRIVE_STRENGTH_VERY_HIGH = _WOS_PIN_DRIVE_STRENGTH_VERY_HIGH,
};

int wos_pin_drive_strength_is_valid(enum wos_pin_drive_strength_enum value);
char const *
wos_pin_drive_strength_to_string(enum wos_pin_drive_strength_enum item);
enum wos_pin_drive_strength_enum wos_pin_drive_strength_parse(char const *v);
enum wos_pin_drive_strength_enum wos_pin_drive_strength_parsei(char const *v);
int wos_pin_drive_strength_count();
enum wos_pin_drive_strength_enum wos_pin_drive_strength_at(int index);
int wos_pin_drive_strength_index_of(enum wos_pin_drive_strength_enum item);
enum wos_pin_drive_strength_enum wos_pin_drive_strength_clamp(int value);

unsigned int
wos_pin_drive_strength_flag_of(enum wos_pin_drive_strength_enum item);
unsigned int
wos_pin_drive_strength_test_flag(unsigned int data,
                                 enum wos_pin_drive_strength_enum item);
unsigned int
wos_pin_drive_strength_set_flag(unsigned int data,
                                enum wos_pin_drive_strength_enum item);
unsigned int
wos_pin_drive_strength_clear_flag(unsigned int data,
                                  enum wos_pin_drive_strength_enum item);

void wos_pin_drive_strength_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_drive_strength_is_valid(enum wos_pin_drive_strength_enum value)
{
    switch (value)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return 1;
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return 1;
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return 1;
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_drive_strength_enum wos_pin_drive_strength_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return WOS_PIN_DRIVE_STRENGTH_LOW;
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return WOS_PIN_DRIVE_STRENGTH_MEDIUM;
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_HIGH;
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_VERY_HIGH;
    }

    return value > _WOS_PIN_DRIVE_STRENGTH_MAX ? _WOS_PIN_DRIVE_STRENGTH_MAX
                                               : wos_pin_drive_strength_at(0);
}

unsigned int
wos_pin_drive_strength_flag_of(enum wos_pin_drive_strength_enum item)
{
    switch (item)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return WOS_PIN_DRIVE_STRENGTH_FLAG_LOW;
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return WOS_PIN_DRIVE_STRENGTH_FLAG_MEDIUM;
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_FLAG_HIGH;
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_FLAG_VERY_HIGH;

    default:
        return 0;
    }
}

unsigned int
wos_pin_drive_strength_test_flag(unsigned int data,
                                 enum wos_pin_drive_strength_enum item)
{
    switch (item)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return (data & WOS_PIN_DRIVE_STRENGTH_FLAG_LOW) ? 1 : 0;
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return (data & WOS_PIN_DRIVE_STRENGTH_FLAG_MEDIUM) ? 1 : 0;
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return (data & WOS_PIN_DRIVE_STRENGTH_FLAG_HIGH) ? 1 : 0;
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return (data & WOS_PIN_DRIVE_STRENGTH_FLAG_VERY_HIGH) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int
wos_pin_drive_strength_set_flag(unsigned int data,
                                enum wos_pin_drive_strength_enum item)
{
    switch (item)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return data | WOS_PIN_DRIVE_STRENGTH_FLAG_LOW;
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return data | WOS_PIN_DRIVE_STRENGTH_FLAG_MEDIUM;
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return data | WOS_PIN_DRIVE_STRENGTH_FLAG_HIGH;
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return data | WOS_PIN_DRIVE_STRENGTH_FLAG_VERY_HIGH;

    default:
        return data;
    }
}

unsigned int
wos_pin_drive_strength_clear_flag(unsigned int data,
                                  enum wos_pin_drive_strength_enum item)
{
    switch (item)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return data & ~(WOS_PIN_DRIVE_STRENGTH_FLAG_LOW);
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return data & ~(WOS_PIN_DRIVE_STRENGTH_FLAG_MEDIUM);
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return data & ~(WOS_PIN_DRIVE_STRENGTH_FLAG_HIGH);
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return data & ~(WOS_PIN_DRIVE_STRENGTH_FLAG_VERY_HIGH);

    default:
        return data;
    }
}

char const *
wos_pin_drive_strength_to_string(enum wos_pin_drive_strength_enum item)
{
    switch (item)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return "LOW";
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return "MEDIUM";
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return "HIGH";
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return "VERY_HIGH";

    default:
        return "WOS_PIN_DRIVE_STRENGTH_INVALID";
    }
}

enum wos_pin_drive_strength_enum wos_pin_drive_strength_parse(char const *v)
{

    if (!X_strcmp("LOW", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_LOW;
    }
    if (!X_strcmp("MEDIUM", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_MEDIUM;
    }
    if (!X_strcmp("HIGH", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_HIGH;
    }
    if (!X_strcmp("VERY_HIGH", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_VERY_HIGH;
    }

    return WOS_PIN_DRIVE_STRENGTH_INVALID;
}

enum wos_pin_drive_strength_enum wos_pin_drive_strength_parsei(char const *v)
{

    if (!X_strcmpi("LOW", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_LOW;
    }
    if (!X_strcmpi("MEDIUM", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_MEDIUM;
    }
    if (!X_strcmpi("HIGH", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_HIGH;
    }
    if (!X_strcmpi("VERY_HIGH", v))
    {
        return WOS_PIN_DRIVE_STRENGTH_VERY_HIGH;
    }

    return WOS_PIN_DRIVE_STRENGTH_INVALID;
}

int wos_pin_drive_strength_count()
{
    return WOS_PIN_DRIVE_STRENGTH_NUMBER_OF_ITEMS;
}

enum wos_pin_drive_strength_enum wos_pin_drive_strength_at(int index)
{
    switch (index)
    {

    case WOS_PIN_DRIVE_STRENGTH_INDEX_LOW:
        return WOS_PIN_DRIVE_STRENGTH_LOW;
    case WOS_PIN_DRIVE_STRENGTH_INDEX_MEDIUM:
        return WOS_PIN_DRIVE_STRENGTH_MEDIUM;
    case WOS_PIN_DRIVE_STRENGTH_INDEX_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_HIGH;
    case WOS_PIN_DRIVE_STRENGTH_INDEX_VERY_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_VERY_HIGH;

    default:
        return WOS_PIN_DRIVE_STRENGTH_INVALID;
    }
}

int wos_pin_drive_strength_index_of(enum wos_pin_drive_strength_enum item)
{
    switch (item)
    {

    case WOS_PIN_DRIVE_STRENGTH_LOW:
        return WOS_PIN_DRIVE_STRENGTH_INDEX_LOW;
    case WOS_PIN_DRIVE_STRENGTH_MEDIUM:
        return WOS_PIN_DRIVE_STRENGTH_INDEX_MEDIUM;
    case WOS_PIN_DRIVE_STRENGTH_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_INDEX_HIGH;
    case WOS_PIN_DRIVE_STRENGTH_VERY_HIGH:
        return WOS_PIN_DRIVE_STRENGTH_INDEX_VERY_HIGH;

    default:
        return WOS_PIN_DRIVE_STRENGTH_INDEX_INVALID;
    }
}
# 123 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_gp_output_meta_enum
{

    WOS_PIN_GP_OUTPUT_INDEX_PWM1,
    WOS_PIN_GP_OUTPUT_INDEX_PWM2,
    WOS_PIN_GP_OUTPUT_INDEX_PWM3,

    WOS_PIN_GP_OUTPUT_NUMBER_OF_ITEMS,
    WOS_PIN_GP_OUTPUT_INDEX_INVALID = WOS_PIN_GP_OUTPUT_NUMBER_OF_ITEMS,

    WOS_PIN_GP_OUTPUT_INVALID = 0,

    _WOS_PIN_GP_OUTPUT_PWM1,
    _WOS_PIN_GP_OUTPUT_PWM2,
    _WOS_PIN_GP_OUTPUT_PWM3,

    _WOS_PIN_GP_OUTPUT_NEXT,
    _WOS_PIN_GP_OUTPUT_MAX = _WOS_PIN_GP_OUTPUT_NEXT - 1,

    WOS_PIN_GP_OUTPUT_FLAG_PWM1 = 1 << WOS_PIN_GP_OUTPUT_INDEX_PWM1,
    WOS_PIN_GP_OUTPUT_FLAG_PWM2 = 1 << WOS_PIN_GP_OUTPUT_INDEX_PWM2,
    WOS_PIN_GP_OUTPUT_FLAG_PWM3 = 1 << WOS_PIN_GP_OUTPUT_INDEX_PWM3,
};

enum wos_pin_gp_output_enum
{

    WOS_PIN_GP_OUTPUT_PWM1 = _WOS_PIN_GP_OUTPUT_PWM1,
    WOS_PIN_GP_OUTPUT_PWM2 = _WOS_PIN_GP_OUTPUT_PWM2,
    WOS_PIN_GP_OUTPUT_PWM3 = _WOS_PIN_GP_OUTPUT_PWM3,
};

int wos_pin_gp_output_is_valid(enum wos_pin_gp_output_enum value);
char const *wos_pin_gp_output_to_string(enum wos_pin_gp_output_enum item);
enum wos_pin_gp_output_enum wos_pin_gp_output_parse(char const *v);
enum wos_pin_gp_output_enum wos_pin_gp_output_parsei(char const *v);
int wos_pin_gp_output_count();
enum wos_pin_gp_output_enum wos_pin_gp_output_at(int index);
int wos_pin_gp_output_index_of(enum wos_pin_gp_output_enum item);
enum wos_pin_gp_output_enum wos_pin_gp_output_clamp(int value);

unsigned int wos_pin_gp_output_flag_of(enum wos_pin_gp_output_enum item);
unsigned int wos_pin_gp_output_test_flag(unsigned int data,
                                         enum wos_pin_gp_output_enum item);
unsigned int wos_pin_gp_output_set_flag(unsigned int data,
                                        enum wos_pin_gp_output_enum item);
unsigned int wos_pin_gp_output_clear_flag(unsigned int data,
                                          enum wos_pin_gp_output_enum item);

void wos_pin_gp_output_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_gp_output_is_valid(enum wos_pin_gp_output_enum value)
{
    switch (value)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return 1;
    case WOS_PIN_GP_OUTPUT_PWM2:
        return 1;
    case WOS_PIN_GP_OUTPUT_PWM3:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_gp_output_enum wos_pin_gp_output_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return WOS_PIN_GP_OUTPUT_PWM1;
    case WOS_PIN_GP_OUTPUT_PWM2:
        return WOS_PIN_GP_OUTPUT_PWM2;
    case WOS_PIN_GP_OUTPUT_PWM3:
        return WOS_PIN_GP_OUTPUT_PWM3;
    }

    return value > _WOS_PIN_GP_OUTPUT_MAX ? _WOS_PIN_GP_OUTPUT_MAX
                                          : wos_pin_gp_output_at(0);
}

unsigned int wos_pin_gp_output_flag_of(enum wos_pin_gp_output_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return WOS_PIN_GP_OUTPUT_FLAG_PWM1;
    case WOS_PIN_GP_OUTPUT_PWM2:
        return WOS_PIN_GP_OUTPUT_FLAG_PWM2;
    case WOS_PIN_GP_OUTPUT_PWM3:
        return WOS_PIN_GP_OUTPUT_FLAG_PWM3;

    default:
        return 0;
    }
}

unsigned int wos_pin_gp_output_test_flag(unsigned int data,
                                         enum wos_pin_gp_output_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return (data & WOS_PIN_GP_OUTPUT_FLAG_PWM1) ? 1 : 0;
    case WOS_PIN_GP_OUTPUT_PWM2:
        return (data & WOS_PIN_GP_OUTPUT_FLAG_PWM2) ? 1 : 0;
    case WOS_PIN_GP_OUTPUT_PWM3:
        return (data & WOS_PIN_GP_OUTPUT_FLAG_PWM3) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_gp_output_set_flag(unsigned int data,
                                        enum wos_pin_gp_output_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return data | WOS_PIN_GP_OUTPUT_FLAG_PWM1;
    case WOS_PIN_GP_OUTPUT_PWM2:
        return data | WOS_PIN_GP_OUTPUT_FLAG_PWM2;
    case WOS_PIN_GP_OUTPUT_PWM3:
        return data | WOS_PIN_GP_OUTPUT_FLAG_PWM3;

    default:
        return data;
    }
}

unsigned int wos_pin_gp_output_clear_flag(unsigned int data,
                                          enum wos_pin_gp_output_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return data & ~(WOS_PIN_GP_OUTPUT_FLAG_PWM1);
    case WOS_PIN_GP_OUTPUT_PWM2:
        return data & ~(WOS_PIN_GP_OUTPUT_FLAG_PWM2);
    case WOS_PIN_GP_OUTPUT_PWM3:
        return data & ~(WOS_PIN_GP_OUTPUT_FLAG_PWM3);

    default:
        return data;
    }
}

char const *wos_pin_gp_output_to_string(enum wos_pin_gp_output_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return "PWM1";
    case WOS_PIN_GP_OUTPUT_PWM2:
        return "PWM2";
    case WOS_PIN_GP_OUTPUT_PWM3:
        return "PWM3";

    default:
        return "WOS_PIN_GP_OUTPUT_INVALID";
    }
}

enum wos_pin_gp_output_enum wos_pin_gp_output_parse(char const *v)
{

    if (!X_strcmp("PWM1", v))
    {
        return WOS_PIN_GP_OUTPUT_PWM1;
    }
    if (!X_strcmp("PWM2", v))
    {
        return WOS_PIN_GP_OUTPUT_PWM2;
    }
    if (!X_strcmp("PWM3", v))
    {
        return WOS_PIN_GP_OUTPUT_PWM3;
    }

    return WOS_PIN_GP_OUTPUT_INVALID;
}

enum wos_pin_gp_output_enum wos_pin_gp_output_parsei(char const *v)
{

    if (!X_strcmpi("PWM1", v))
    {
        return WOS_PIN_GP_OUTPUT_PWM1;
    }
    if (!X_strcmpi("PWM2", v))
    {
        return WOS_PIN_GP_OUTPUT_PWM2;
    }
    if (!X_strcmpi("PWM3", v))
    {
        return WOS_PIN_GP_OUTPUT_PWM3;
    }

    return WOS_PIN_GP_OUTPUT_INVALID;
}

int wos_pin_gp_output_count()
{
    return WOS_PIN_GP_OUTPUT_NUMBER_OF_ITEMS;
}

enum wos_pin_gp_output_enum wos_pin_gp_output_at(int index)
{
    switch (index)
    {

    case WOS_PIN_GP_OUTPUT_INDEX_PWM1:
        return WOS_PIN_GP_OUTPUT_PWM1;
    case WOS_PIN_GP_OUTPUT_INDEX_PWM2:
        return WOS_PIN_GP_OUTPUT_PWM2;
    case WOS_PIN_GP_OUTPUT_INDEX_PWM3:
        return WOS_PIN_GP_OUTPUT_PWM3;

    default:
        return WOS_PIN_GP_OUTPUT_INVALID;
    }
}

int wos_pin_gp_output_index_of(enum wos_pin_gp_output_enum item)
{
    switch (item)
    {

    case WOS_PIN_GP_OUTPUT_PWM1:
        return WOS_PIN_GP_OUTPUT_INDEX_PWM1;
    case WOS_PIN_GP_OUTPUT_PWM2:
        return WOS_PIN_GP_OUTPUT_INDEX_PWM2;
    case WOS_PIN_GP_OUTPUT_PWM3:
        return WOS_PIN_GP_OUTPUT_INDEX_PWM3;

    default:
        return WOS_PIN_GP_OUTPUT_INDEX_INVALID;
    }
}
# 129 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

WOS_PIN_STATUS wos_pin_init_gp_output(void)

{
    int rv = WOS_PIN_STATUS_OK;

    rv += wos_pin_bsp_init_gp_output(
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_PWM1),
        WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN, WOS_PIN_DRIVE_STRENGTH_MEDIUM);
    rv += wos_pin_bsp_init_gp_output(
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_PWM2),
        WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN, WOS_PIN_DRIVE_STRENGTH_MEDIUM);
    rv += wos_pin_bsp_init_gp_output(
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_PWM3),
        WOS_PIN_OUTPUT_CONFIGURATION_OPEN_DRAIN, WOS_PIN_DRIVE_STRENGTH_MEDIUM);

    return rv;
}

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 149 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2
# 159 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h"
# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_baud_meta_enum
{

    WOS_PIN_BAUD_INDEX_2400,
    WOS_PIN_BAUD_INDEX_4800,
    WOS_PIN_BAUD_INDEX_9600,
    WOS_PIN_BAUD_INDEX_38400,
    WOS_PIN_BAUD_INDEX_56700,
    WOS_PIN_BAUD_INDEX_115200,

    WOS_PIN_BAUD_NUMBER_OF_ITEMS,
    WOS_PIN_BAUD_INDEX_INVALID = WOS_PIN_BAUD_NUMBER_OF_ITEMS,

    WOS_PIN_BAUD_INVALID = 0,

    _WOS_PIN_BAUD_2400,
    _WOS_PIN_BAUD_4800,
    _WOS_PIN_BAUD_9600,
    _WOS_PIN_BAUD_38400,
    _WOS_PIN_BAUD_56700,
    _WOS_PIN_BAUD_115200,

    _WOS_PIN_BAUD_NEXT,
    _WOS_PIN_BAUD_MAX = _WOS_PIN_BAUD_NEXT - 1,

    WOS_PIN_BAUD_FLAG_2400 = 1 << WOS_PIN_BAUD_INDEX_2400,
    WOS_PIN_BAUD_FLAG_4800 = 1 << WOS_PIN_BAUD_INDEX_4800,
    WOS_PIN_BAUD_FLAG_9600 = 1 << WOS_PIN_BAUD_INDEX_9600,
    WOS_PIN_BAUD_FLAG_38400 = 1 << WOS_PIN_BAUD_INDEX_38400,
    WOS_PIN_BAUD_FLAG_56700 = 1 << WOS_PIN_BAUD_INDEX_56700,
    WOS_PIN_BAUD_FLAG_115200 = 1 << WOS_PIN_BAUD_INDEX_115200,
};

enum wos_pin_baud_enum
{

    WOS_PIN_BAUD_2400 = _WOS_PIN_BAUD_2400,
    WOS_PIN_BAUD_4800 = _WOS_PIN_BAUD_4800,
    WOS_PIN_BAUD_9600 = _WOS_PIN_BAUD_9600,
    WOS_PIN_BAUD_38400 = _WOS_PIN_BAUD_38400,
    WOS_PIN_BAUD_56700 = _WOS_PIN_BAUD_56700,
    WOS_PIN_BAUD_115200 = _WOS_PIN_BAUD_115200,
};

int wos_pin_baud_is_valid(enum wos_pin_baud_enum value);
char const *wos_pin_baud_to_string(enum wos_pin_baud_enum item);
enum wos_pin_baud_enum wos_pin_baud_parse(char const *v);
enum wos_pin_baud_enum wos_pin_baud_parsei(char const *v);
int wos_pin_baud_count();
enum wos_pin_baud_enum wos_pin_baud_at(int index);
int wos_pin_baud_index_of(enum wos_pin_baud_enum item);
enum wos_pin_baud_enum wos_pin_baud_clamp(int value);

unsigned int wos_pin_baud_flag_of(enum wos_pin_baud_enum item);
unsigned int wos_pin_baud_test_flag(unsigned int data,
                                    enum wos_pin_baud_enum item);
unsigned int wos_pin_baud_set_flag(unsigned int data,
                                   enum wos_pin_baud_enum item);
unsigned int wos_pin_baud_clear_flag(unsigned int data,
                                     enum wos_pin_baud_enum item);

void wos_pin_baud_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_baud_is_valid(enum wos_pin_baud_enum value)
{
    switch (value)
    {

    case WOS_PIN_BAUD_2400:
        return 1;
    case WOS_PIN_BAUD_4800:
        return 1;
    case WOS_PIN_BAUD_9600:
        return 1;
    case WOS_PIN_BAUD_38400:
        return 1;
    case WOS_PIN_BAUD_56700:
        return 1;
    case WOS_PIN_BAUD_115200:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_baud_enum wos_pin_baud_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_BAUD_2400:
        return WOS_PIN_BAUD_2400;
    case WOS_PIN_BAUD_4800:
        return WOS_PIN_BAUD_4800;
    case WOS_PIN_BAUD_9600:
        return WOS_PIN_BAUD_9600;
    case WOS_PIN_BAUD_38400:
        return WOS_PIN_BAUD_38400;
    case WOS_PIN_BAUD_56700:
        return WOS_PIN_BAUD_56700;
    case WOS_PIN_BAUD_115200:
        return WOS_PIN_BAUD_115200;
    }

    return value > _WOS_PIN_BAUD_MAX ? _WOS_PIN_BAUD_MAX : wos_pin_baud_at(0);
}

unsigned int wos_pin_baud_flag_of(enum wos_pin_baud_enum item)
{
    switch (item)
    {

    case WOS_PIN_BAUD_2400:
        return WOS_PIN_BAUD_FLAG_2400;
    case WOS_PIN_BAUD_4800:
        return WOS_PIN_BAUD_FLAG_4800;
    case WOS_PIN_BAUD_9600:
        return WOS_PIN_BAUD_FLAG_9600;
    case WOS_PIN_BAUD_38400:
        return WOS_PIN_BAUD_FLAG_38400;
    case WOS_PIN_BAUD_56700:
        return WOS_PIN_BAUD_FLAG_56700;
    case WOS_PIN_BAUD_115200:
        return WOS_PIN_BAUD_FLAG_115200;

    default:
        return 0;
    }
}

unsigned int wos_pin_baud_test_flag(unsigned int data,
                                    enum wos_pin_baud_enum item)
{
    switch (item)
    {

    case WOS_PIN_BAUD_2400:
        return (data & WOS_PIN_BAUD_FLAG_2400) ? 1 : 0;
    case WOS_PIN_BAUD_4800:
        return (data & WOS_PIN_BAUD_FLAG_4800) ? 1 : 0;
    case WOS_PIN_BAUD_9600:
        return (data & WOS_PIN_BAUD_FLAG_9600) ? 1 : 0;
    case WOS_PIN_BAUD_38400:
        return (data & WOS_PIN_BAUD_FLAG_38400) ? 1 : 0;
    case WOS_PIN_BAUD_56700:
        return (data & WOS_PIN_BAUD_FLAG_56700) ? 1 : 0;
    case WOS_PIN_BAUD_115200:
        return (data & WOS_PIN_BAUD_FLAG_115200) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_baud_set_flag(unsigned int data,
                                   enum wos_pin_baud_enum item)
{
    switch (item)
    {

    case WOS_PIN_BAUD_2400:
        return data | WOS_PIN_BAUD_FLAG_2400;
    case WOS_PIN_BAUD_4800:
        return data | WOS_PIN_BAUD_FLAG_4800;
    case WOS_PIN_BAUD_9600:
        return data | WOS_PIN_BAUD_FLAG_9600;
    case WOS_PIN_BAUD_38400:
        return data | WOS_PIN_BAUD_FLAG_38400;
    case WOS_PIN_BAUD_56700:
        return data | WOS_PIN_BAUD_FLAG_56700;
    case WOS_PIN_BAUD_115200:
        return data | WOS_PIN_BAUD_FLAG_115200;

    default:
        return data;
    }
}

unsigned int wos_pin_baud_clear_flag(unsigned int data,
                                     enum wos_pin_baud_enum item)
{
    switch (item)
    {

    case WOS_PIN_BAUD_2400:
        return data & ~(WOS_PIN_BAUD_FLAG_2400);
    case WOS_PIN_BAUD_4800:
        return data & ~(WOS_PIN_BAUD_FLAG_4800);
    case WOS_PIN_BAUD_9600:
        return data & ~(WOS_PIN_BAUD_FLAG_9600);
    case WOS_PIN_BAUD_38400:
        return data & ~(WOS_PIN_BAUD_FLAG_38400);
    case WOS_PIN_BAUD_56700:
        return data & ~(WOS_PIN_BAUD_FLAG_56700);
    case WOS_PIN_BAUD_115200:
        return data & ~(WOS_PIN_BAUD_FLAG_115200);

    default:
        return data;
    }
}

char const *wos_pin_baud_to_string(enum wos_pin_baud_enum item)
{
    switch (item)
    {

    case WOS_PIN_BAUD_2400:
        return "2400";
    case WOS_PIN_BAUD_4800:
        return "4800";
    case WOS_PIN_BAUD_9600:
        return "9600";
    case WOS_PIN_BAUD_38400:
        return "38400";
    case WOS_PIN_BAUD_56700:
        return "56700";
    case WOS_PIN_BAUD_115200:
        return "115200";

    default:
        return "WOS_PIN_BAUD_INVALID";
    }
}

enum wos_pin_baud_enum wos_pin_baud_parse(char const *v)
{

    if (!X_strcmp("2400", v))
    {
        return WOS_PIN_BAUD_2400;
    }
    if (!X_strcmp("4800", v))
    {
        return WOS_PIN_BAUD_4800;
    }
    if (!X_strcmp("9600", v))
    {
        return WOS_PIN_BAUD_9600;
    }
    if (!X_strcmp("38400", v))
    {
        return WOS_PIN_BAUD_38400;
    }
    if (!X_strcmp("56700", v))
    {
        return WOS_PIN_BAUD_56700;
    }
    if (!X_strcmp("115200", v))
    {
        return WOS_PIN_BAUD_115200;
    }

    return WOS_PIN_BAUD_INVALID;
}

enum wos_pin_baud_enum wos_pin_baud_parsei(char const *v)
{

    if (!X_strcmpi("2400", v))
    {
        return WOS_PIN_BAUD_2400;
    }
    if (!X_strcmpi("4800", v))
    {
        return WOS_PIN_BAUD_4800;
    }
    if (!X_strcmpi("9600", v))
    {
        return WOS_PIN_BAUD_9600;
    }
    if (!X_strcmpi("38400", v))
    {
        return WOS_PIN_BAUD_38400;
    }
    if (!X_strcmpi("56700", v))
    {
        return WOS_PIN_BAUD_56700;
    }
    if (!X_strcmpi("115200", v))
    {
        return WOS_PIN_BAUD_115200;
    }

    return WOS_PIN_BAUD_INVALID;
}

int wos_pin_baud_count()
{
    return WOS_PIN_BAUD_NUMBER_OF_ITEMS;
}

enum wos_pin_baud_enum wos_pin_baud_at(int index)
{
    switch (index)
    {

    case WOS_PIN_BAUD_INDEX_2400:
        return WOS_PIN_BAUD_2400;
    case WOS_PIN_BAUD_INDEX_4800:
        return WOS_PIN_BAUD_4800;
    case WOS_PIN_BAUD_INDEX_9600:
        return WOS_PIN_BAUD_9600;
    case WOS_PIN_BAUD_INDEX_38400:
        return WOS_PIN_BAUD_38400;
    case WOS_PIN_BAUD_INDEX_56700:
        return WOS_PIN_BAUD_56700;
    case WOS_PIN_BAUD_INDEX_115200:
        return WOS_PIN_BAUD_115200;

    default:
        return WOS_PIN_BAUD_INVALID;
    }
}

int wos_pin_baud_index_of(enum wos_pin_baud_enum item)
{
    switch (item)
    {

    case WOS_PIN_BAUD_2400:
        return WOS_PIN_BAUD_INDEX_2400;
    case WOS_PIN_BAUD_4800:
        return WOS_PIN_BAUD_INDEX_4800;
    case WOS_PIN_BAUD_9600:
        return WOS_PIN_BAUD_INDEX_9600;
    case WOS_PIN_BAUD_38400:
        return WOS_PIN_BAUD_INDEX_38400;
    case WOS_PIN_BAUD_56700:
        return WOS_PIN_BAUD_INDEX_56700;
    case WOS_PIN_BAUD_115200:
        return WOS_PIN_BAUD_INDEX_115200;

    default:
        return WOS_PIN_BAUD_INDEX_INVALID;
    }
}
# 160 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_uart_meta_enum
{

    WOS_PIN_UART_INDEX_UART_LIDAR,

    WOS_PIN_UART_NUMBER_OF_ITEMS,
    WOS_PIN_UART_INDEX_INVALID = WOS_PIN_UART_NUMBER_OF_ITEMS,

    WOS_PIN_UART_INVALID = 0,

    _WOS_PIN_UART_UART_LIDAR = 0,

    _WOS_PIN_UART_NEXT,
    _WOS_PIN_UART_MAX = _WOS_PIN_UART_NEXT - 1,

    WOS_PIN_UART_FLAG_UART_LIDAR = 1 << WOS_PIN_UART_INDEX_UART_LIDAR,
};

enum wos_pin_uart_enum
{

    WOS_PIN_UART_UART_LIDAR = _WOS_PIN_UART_UART_LIDAR,
};

int wos_pin_uart_is_valid(enum wos_pin_uart_enum value);
char const *wos_pin_uart_to_string(enum wos_pin_uart_enum item);
enum wos_pin_uart_enum wos_pin_uart_parse(char const *v);
enum wos_pin_uart_enum wos_pin_uart_parsei(char const *v);
int wos_pin_uart_count();
enum wos_pin_uart_enum wos_pin_uart_at(int index);
int wos_pin_uart_index_of(enum wos_pin_uart_enum item);
enum wos_pin_uart_enum wos_pin_uart_clamp(int value);

unsigned int wos_pin_uart_flag_of(enum wos_pin_uart_enum item);
unsigned int wos_pin_uart_test_flag(unsigned int data,
                                    enum wos_pin_uart_enum item);
unsigned int wos_pin_uart_set_flag(unsigned int data,
                                   enum wos_pin_uart_enum item);
unsigned int wos_pin_uart_clear_flag(unsigned int data,
                                     enum wos_pin_uart_enum item);

void wos_pin_uart_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_uart_is_valid(enum wos_pin_uart_enum value)
{
    switch (value)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_uart_enum wos_pin_uart_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return WOS_PIN_UART_UART_LIDAR;
    }

    return value > _WOS_PIN_UART_MAX ? _WOS_PIN_UART_MAX : wos_pin_uart_at(0);
}

unsigned int wos_pin_uart_flag_of(enum wos_pin_uart_enum item)
{
    switch (item)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return WOS_PIN_UART_FLAG_UART_LIDAR;

    default:
        return 0;
    }
}

unsigned int wos_pin_uart_test_flag(unsigned int data,
                                    enum wos_pin_uart_enum item)
{
    switch (item)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return (data & WOS_PIN_UART_FLAG_UART_LIDAR) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_uart_set_flag(unsigned int data,
                                   enum wos_pin_uart_enum item)
{
    switch (item)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return data | WOS_PIN_UART_FLAG_UART_LIDAR;

    default:
        return data;
    }
}

unsigned int wos_pin_uart_clear_flag(unsigned int data,
                                     enum wos_pin_uart_enum item)
{
    switch (item)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return data & ~(WOS_PIN_UART_FLAG_UART_LIDAR);

    default:
        return data;
    }
}

char const *wos_pin_uart_to_string(enum wos_pin_uart_enum item)
{
    switch (item)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return "UART_LIDAR";

    default:
        return "WOS_PIN_UART_INVALID";
    }
}

enum wos_pin_uart_enum wos_pin_uart_parse(char const *v)
{

    if (!X_strcmp("UART_LIDAR", v))
    {
        return WOS_PIN_UART_UART_LIDAR;
    }

    return WOS_PIN_UART_INVALID;
}

enum wos_pin_uart_enum wos_pin_uart_parsei(char const *v)
{

    if (!X_strcmpi("UART_LIDAR", v))
    {
        return WOS_PIN_UART_UART_LIDAR;
    }

    return WOS_PIN_UART_INVALID;
}

int wos_pin_uart_count()
{
    return WOS_PIN_UART_NUMBER_OF_ITEMS;
}

enum wos_pin_uart_enum wos_pin_uart_at(int index)
{
    switch (index)
    {

    case WOS_PIN_UART_INDEX_UART_LIDAR:
        return WOS_PIN_UART_UART_LIDAR;

    default:
        return WOS_PIN_UART_INVALID;
    }
}

int wos_pin_uart_index_of(enum wos_pin_uart_enum item)
{
    switch (item)
    {

    case WOS_PIN_UART_UART_LIDAR:
        return WOS_PIN_UART_INDEX_UART_LIDAR;

    default:
        return WOS_PIN_UART_INDEX_INVALID;
    }
}
# 166 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

WOS_PIN_STATUS wos_pin_init_uart(void)

{
    int rv = WOS_PIN_STATUS_OK;

    rv += wos_pin_bsp_init_uart(
        WOS_PIN_UART_UART_LIDAR, WOS_PIN_BAUD_9600,
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_LIDAR_RX),
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_LIDAR_TX));

    return rv;
}

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 186 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_i2c_speed_meta_enum
{

    WOS_PIN_I2C_SPEED_INDEX_100K,
    WOS_PIN_I2C_SPEED_INDEX_400K,

    WOS_PIN_I2C_SPEED_NUMBER_OF_ITEMS,
    WOS_PIN_I2C_SPEED_INDEX_INVALID = WOS_PIN_I2C_SPEED_NUMBER_OF_ITEMS,

    WOS_PIN_I2C_SPEED_INVALID = 0,

    _WOS_PIN_I2C_SPEED_100K,
    _WOS_PIN_I2C_SPEED_400K,

    _WOS_PIN_I2C_SPEED_NEXT,
    _WOS_PIN_I2C_SPEED_MAX = _WOS_PIN_I2C_SPEED_NEXT - 1,

    WOS_PIN_I2C_SPEED_FLAG_100K = 1 << WOS_PIN_I2C_SPEED_INDEX_100K,
    WOS_PIN_I2C_SPEED_FLAG_400K = 1 << WOS_PIN_I2C_SPEED_INDEX_400K,
};

enum wos_pin_i2c_speed_enum
{

    WOS_PIN_I2C_SPEED_100K = _WOS_PIN_I2C_SPEED_100K,
    WOS_PIN_I2C_SPEED_400K = _WOS_PIN_I2C_SPEED_400K,
};

int wos_pin_i2c_speed_is_valid(enum wos_pin_i2c_speed_enum value);
char const *wos_pin_i2c_speed_to_string(enum wos_pin_i2c_speed_enum item);
enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_parse(char const *v);
enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_parsei(char const *v);
int wos_pin_i2c_speed_count();
enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_at(int index);
int wos_pin_i2c_speed_index_of(enum wos_pin_i2c_speed_enum item);
enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_clamp(int value);

unsigned int wos_pin_i2c_speed_flag_of(enum wos_pin_i2c_speed_enum item);
unsigned int wos_pin_i2c_speed_test_flag(unsigned int data,
                                         enum wos_pin_i2c_speed_enum item);
unsigned int wos_pin_i2c_speed_set_flag(unsigned int data,
                                        enum wos_pin_i2c_speed_enum item);
unsigned int wos_pin_i2c_speed_clear_flag(unsigned int data,
                                          enum wos_pin_i2c_speed_enum item);

void wos_pin_i2c_speed_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_i2c_speed_is_valid(enum wos_pin_i2c_speed_enum value)
{
    switch (value)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return 1;
    case WOS_PIN_I2C_SPEED_400K:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return WOS_PIN_I2C_SPEED_100K;
    case WOS_PIN_I2C_SPEED_400K:
        return WOS_PIN_I2C_SPEED_400K;
    }

    return value > _WOS_PIN_I2C_SPEED_MAX ? _WOS_PIN_I2C_SPEED_MAX
                                          : wos_pin_i2c_speed_at(0);
}

unsigned int wos_pin_i2c_speed_flag_of(enum wos_pin_i2c_speed_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return WOS_PIN_I2C_SPEED_FLAG_100K;
    case WOS_PIN_I2C_SPEED_400K:
        return WOS_PIN_I2C_SPEED_FLAG_400K;

    default:
        return 0;
    }
}

unsigned int wos_pin_i2c_speed_test_flag(unsigned int data,
                                         enum wos_pin_i2c_speed_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return (data & WOS_PIN_I2C_SPEED_FLAG_100K) ? 1 : 0;
    case WOS_PIN_I2C_SPEED_400K:
        return (data & WOS_PIN_I2C_SPEED_FLAG_400K) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_i2c_speed_set_flag(unsigned int data,
                                        enum wos_pin_i2c_speed_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return data | WOS_PIN_I2C_SPEED_FLAG_100K;
    case WOS_PIN_I2C_SPEED_400K:
        return data | WOS_PIN_I2C_SPEED_FLAG_400K;

    default:
        return data;
    }
}

unsigned int wos_pin_i2c_speed_clear_flag(unsigned int data,
                                          enum wos_pin_i2c_speed_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return data & ~(WOS_PIN_I2C_SPEED_FLAG_100K);
    case WOS_PIN_I2C_SPEED_400K:
        return data & ~(WOS_PIN_I2C_SPEED_FLAG_400K);

    default:
        return data;
    }
}

char const *wos_pin_i2c_speed_to_string(enum wos_pin_i2c_speed_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return "100K";
    case WOS_PIN_I2C_SPEED_400K:
        return "400K";

    default:
        return "WOS_PIN_I2C_SPEED_INVALID";
    }
}

enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_parse(char const *v)
{

    if (!X_strcmp("100K", v))
    {
        return WOS_PIN_I2C_SPEED_100K;
    }
    if (!X_strcmp("400K", v))
    {
        return WOS_PIN_I2C_SPEED_400K;
    }

    return WOS_PIN_I2C_SPEED_INVALID;
}

enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_parsei(char const *v)
{

    if (!X_strcmpi("100K", v))
    {
        return WOS_PIN_I2C_SPEED_100K;
    }
    if (!X_strcmpi("400K", v))
    {
        return WOS_PIN_I2C_SPEED_400K;
    }

    return WOS_PIN_I2C_SPEED_INVALID;
}

int wos_pin_i2c_speed_count()
{
    return WOS_PIN_I2C_SPEED_NUMBER_OF_ITEMS;
}

enum wos_pin_i2c_speed_enum wos_pin_i2c_speed_at(int index)
{
    switch (index)
    {

    case WOS_PIN_I2C_SPEED_INDEX_100K:
        return WOS_PIN_I2C_SPEED_100K;
    case WOS_PIN_I2C_SPEED_INDEX_400K:
        return WOS_PIN_I2C_SPEED_400K;

    default:
        return WOS_PIN_I2C_SPEED_INVALID;
    }
}

int wos_pin_i2c_speed_index_of(enum wos_pin_i2c_speed_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_SPEED_100K:
        return WOS_PIN_I2C_SPEED_INDEX_100K;
    case WOS_PIN_I2C_SPEED_400K:
        return WOS_PIN_I2C_SPEED_INDEX_400K;

    default:
        return WOS_PIN_I2C_SPEED_INDEX_INVALID;
    }
}
# 193 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 63 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
enum _wos_pin_i2c_bus_meta_enum
{

    WOS_PIN_I2C_BUS_INDEX_I2C_IMU,

    WOS_PIN_I2C_BUS_NUMBER_OF_ITEMS,
    WOS_PIN_I2C_BUS_INDEX_INVALID = WOS_PIN_I2C_BUS_NUMBER_OF_ITEMS,

    WOS_PIN_I2C_BUS_INVALID = 0,

    _WOS_PIN_I2C_BUS_I2C_IMU = 1,

    _WOS_PIN_I2C_BUS_NEXT,
    _WOS_PIN_I2C_BUS_MAX = _WOS_PIN_I2C_BUS_NEXT - 1,

    WOS_PIN_I2C_BUS_FLAG_I2C_IMU = 1 << WOS_PIN_I2C_BUS_INDEX_I2C_IMU,
};

enum wos_pin_i2c_bus_enum
{

    WOS_PIN_I2C_BUS_I2C_IMU = _WOS_PIN_I2C_BUS_I2C_IMU,
};

int wos_pin_i2c_bus_is_valid(enum wos_pin_i2c_bus_enum value);
char const *wos_pin_i2c_bus_to_string(enum wos_pin_i2c_bus_enum item);
enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_parse(char const *v);
enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_parsei(char const *v);
int wos_pin_i2c_bus_count();
enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_at(int index);
int wos_pin_i2c_bus_index_of(enum wos_pin_i2c_bus_enum item);
enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_clamp(int value);

unsigned int wos_pin_i2c_bus_flag_of(enum wos_pin_i2c_bus_enum item);
unsigned int wos_pin_i2c_bus_test_flag(unsigned int data,
                                       enum wos_pin_i2c_bus_enum item);
unsigned int wos_pin_i2c_bus_set_flag(unsigned int data,
                                      enum wos_pin_i2c_bus_enum item);
unsigned int wos_pin_i2c_bus_clear_flag(unsigned int data,
                                        enum wos_pin_i2c_bus_enum item);

void wos_pin_i2c_bus_print_all(void *context);
# 146 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h"
int wos_pin_i2c_bus_is_valid(enum wos_pin_i2c_bus_enum value)
{
    switch (value)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return 1;

    default:
        return 0;
    }
}

enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_clamp(int value)
{
    switch (value)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return WOS_PIN_I2C_BUS_I2C_IMU;
    }

    return value > _WOS_PIN_I2C_BUS_MAX ? _WOS_PIN_I2C_BUS_MAX
                                        : wos_pin_i2c_bus_at(0);
}

unsigned int wos_pin_i2c_bus_flag_of(enum wos_pin_i2c_bus_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return WOS_PIN_I2C_BUS_FLAG_I2C_IMU;

    default:
        return 0;
    }
}

unsigned int wos_pin_i2c_bus_test_flag(unsigned int data,
                                       enum wos_pin_i2c_bus_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return (data & WOS_PIN_I2C_BUS_FLAG_I2C_IMU) ? 1 : 0;

    default:
        return 0;
    }
}

unsigned int wos_pin_i2c_bus_set_flag(unsigned int data,
                                      enum wos_pin_i2c_bus_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return data | WOS_PIN_I2C_BUS_FLAG_I2C_IMU;

    default:
        return data;
    }
}

unsigned int wos_pin_i2c_bus_clear_flag(unsigned int data,
                                        enum wos_pin_i2c_bus_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return data & ~(WOS_PIN_I2C_BUS_FLAG_I2C_IMU);

    default:
        return data;
    }
}

char const *wos_pin_i2c_bus_to_string(enum wos_pin_i2c_bus_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return "I2C_IMU";

    default:
        return "WOS_PIN_I2C_BUS_INVALID";
    }
}

enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_parse(char const *v)
{

    if (!X_strcmp("I2C_IMU", v))
    {
        return WOS_PIN_I2C_BUS_I2C_IMU;
    }

    return WOS_PIN_I2C_BUS_INVALID;
}

enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_parsei(char const *v)
{

    if (!X_strcmpi("I2C_IMU", v))
    {
        return WOS_PIN_I2C_BUS_I2C_IMU;
    }

    return WOS_PIN_I2C_BUS_INVALID;
}

int wos_pin_i2c_bus_count()
{
    return WOS_PIN_I2C_BUS_NUMBER_OF_ITEMS;
}

enum wos_pin_i2c_bus_enum wos_pin_i2c_bus_at(int index)
{
    switch (index)
    {

    case WOS_PIN_I2C_BUS_INDEX_I2C_IMU:
        return WOS_PIN_I2C_BUS_I2C_IMU;

    default:
        return WOS_PIN_I2C_BUS_INVALID;
    }
}

int wos_pin_i2c_bus_index_of(enum wos_pin_i2c_bus_enum item)
{
    switch (item)
    {

    case WOS_PIN_I2C_BUS_I2C_IMU:
        return WOS_PIN_I2C_BUS_INDEX_I2C_IMU;

    default:
        return WOS_PIN_I2C_BUS_INDEX_INVALID;
    }
}
# 199 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2

WOS_PIN_STATUS wos_pin_init_i2c_bus(void)

{
    int rv = WOS_PIN_STATUS_OK;

    rv += wos_pin_bsp_init_i2c_bus(
        WOS_PIN_I2C_BUS_I2C_IMU, WOS_PIN_I2C_SPEED_400K,
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_SDA),
        wos_pin_assignment_get_pad(WOS_PIN_ASSIGNMENT_SCL));

    return rv;
}

# 1 "/home/duo/wos/repos/wos_pin/wos/oneletter-src/X_enum.h" 1
# 219 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.h" 2
# 8 "/home/duo/wos/repos/wos_pin/src/wos_pin_enums.c" 2
