# 0 "test/test_uart.c"
# 1 "/home/lighthouse/xzr/oskernel2023-x2w//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "test/test_uart.c"
# 11 "test/test_uart.c"
# 1 "include/test/test_uart.h" 1
# 18 "include/test/test_uart.h"
int test_uart(void);
# 12 "test/test_uart.c" 2



extern void uart_put(char);
extern char uart_get(void);
extern void uart_puts(const char*);

int test_uart(void){

    uart_puts("=> test_uart:\n");
    char charset[] = "01234567890ABCDEFGHI./?\"'";
    for (int i = 0; i < sizeof(charset)/sizeof(char); i++)
        uart_put(charset[i]);
    uart_put('\n');


    char *str = "Hello UART!\n";
    uart_puts(str);
# 38 "test/test_uart.c"
    return 0;
}
