//  LCD in 4-bit interface mode
#include <EFM8LB1.h>
#include <stdio.h>
#include "lcd.h"
#include "globals.h"

// Uses Timer4 to delay <ms> mili-seconds. 

void Timer4ms(unsigned char ms)
{
	unsigned char i;// usec counter
	unsigned char k;
	
	k=SFRPAGE;
	SFRPAGE=0x10;
	// The input for Timer 4 is selected as SYSCLK by setting bit 0 of CKCON1:
	CKCON1|=0b_0000_0001;
	
	TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	
	TF4H=0; // Clear overflow flag
	TR4=1;  // Start Timer4
	for (i = 0; i < ms; i++)       // Count <ms> overflows
	{
		while (!TF4H);  // Wait for overflow
		TF4H=0;         // Clear overflow indicator
	}
	TR4=0; // Stop Timer4
	SFRPAGE=k;	
}


void I2C_write (unsigned char output_data)
{
	SMB0DAT = output_data; // Put data into buffer
	SI = 0;
	while (!SI); // Wait until done with send
}

unsigned char I2C_read (void)
{
	unsigned char input_data;

	SI = 0;
	while (!SI); // Wait until we have data to read
	input_data = SMB0DAT; // Read the data

	return input_data;
}

void I2C_start (void)
{
	ACK = 1;
	STA = 1;     // Send I2C start
	STO = 0;
	SI = 0;
	while (!SI); // Wait until start sent
	STA = 0;     // Reset I2C start
}

void I2C_stop(void)
{
	STO = 1;  	// Perform I2C stop
	SI = 0;	// Clear SI
	//while (!SI);	   // Wait until stop complete (Doesn't work???)
}

void nunchuck_init(bit print_extension_type)
{
	unsigned char i, buf[6];
	
	// Newer initialization format that works for all nunchucks
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xF0);
	I2C_write(0x55);
	I2C_stop();
	Timer4ms(1);
	
	 
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xFB);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);
	

	// Read the extension type from the register block.  For the original Nunchuk it should be
	// 00 00 a4 20 00 00.
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xFA); // extension type register
	I2C_stop();
	Timer4ms(3); // 3 ms required to complete acquisition
	
	I2C_start();
	I2C_write(0xA5);
	
	// Receive values
	for(i=0; i<6; i++)
	{
		buf[i]=I2C_read();
	}
	ACK=0;
	I2C_stop();
	Timer4ms(3);
	
	
	if(print_extension_type)
	{
		printf("Extension type: %02x  %02x  %02x  %02x  %02x  %02x\n", 
			buf[0],  buf[1], buf[2], buf[3], buf[4], buf[5]);
	}

	// Send the crypto key (zeros), in 3 blocks of 6, 6 & 4.

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xF0);
	I2C_write(0xAA);
	I2C_stop();
	Timer4ms(1);
	

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);
	

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);
	

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);
	
}

void nunchuck_getdata(unsigned char * s)
{
	unsigned char i;

	// Start measurement
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(3); 	// 3 ms required to complete acquisition
	

	// Request values
	I2C_start();
	I2C_write(0xA5);
	
	// Receive values
	for(i=0; i<6; i++)
	{
		s[i]=(I2C_read()^0x17)+0x17; // Read and decrypt
	}
	ACK=0;
	I2C_stop();
}




void LCD_pulse (void)
{
	LCD_E=1;
	Timer4ms(1);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	Timer4ms(1);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	Timer4ms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	Timer4ms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	//LCD_RW=0; // We are only writing to the LCD in this program
	Timer4ms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	Timer4ms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	Timer4ms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}
