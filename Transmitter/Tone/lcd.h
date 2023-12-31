#define LCD_RS P2_6
//#define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_5
#define LCD_D4 P2_4
#define LCD_D5 P2_3
#define LCD_D6 P2_2
#define LCD_D7 P2_1
#define CHARS_PER_LINE 16

void Timer3us(unsigned char us);

void Timer4ms(unsigned char ms);
void I2C_write (unsigned char output_data);
unsigned char I2C_read (void);
void I2C_start (void);
void I2C_stop(void);
void nunchuck_init(bit print_etension_type);
void nunchuck_getdata(unsigned char * s);

//void waitms (unsigned int ms);
void LCD_pulse (void);
void LCD_byte (unsigned char x);
void WriteData (unsigned char x);
void WriteCommand (unsigned char x);
void LCD_4BIT (void);
void LCDprint(char * string, unsigned char line, bit clear);
