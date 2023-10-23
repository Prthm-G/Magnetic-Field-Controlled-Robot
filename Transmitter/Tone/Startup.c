#include <EFM8LB1.h>
#include "globals.h"
#include <stdio.h>

char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN |= 0x80;
	RSTSRC = 0x02;

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif
	
	// Configure the pins used for square output
	P2MDOUT|=0b_0000_0011;
	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	//CHANGED XBR0 (0x01 ?) AND XBR1 (0x10 ?)================
	XBR0     = 0b_0000_0101; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X00; // Enable T0 on P0.0
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	//CHANGED FROM 0xFFL to 0x100=============
	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0x100)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	
	// Configure and enable SMBus
	SMB0CF = 0b_0101_1100; //INH | EXTHOLD | SMBTOE | SMBFTE ;
	SMB0CF |= 0b_1000_0000;  // Enable SMBus
	// Configure Timer 0 as the I2C clock source

	CKCON0 |= 0b_0000_0100; // Timer0 clock source = SYSCLK
	TMOD &= 0xf0;  // Mask out timer 1 bits
	TMOD |= 0x02;  // Timer0 in 8-bit auto-reload mode
	// Timer 0 configured to overflow at 1/3 the rate defined by SMB_FREQUENCY
	TL0 = TH0 = 256-(SYSCLK/SMB_FREQUENCY/3);
	TR0 = 1; // Enable timer 0


	

	

	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2
	
	
	
	/*
	// Initialize timer 3 for periodic interrupts
	TMR3CN0=0x00;   // Stop Timer3; Clear TF3;
	CKCON0|=0b_0100_0000; // Timer 3 uses the system clock
	TMR3RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
	TMR3=0xffff;   // Set to reload immediately
	EIE1|=0b_1000_0000;     // Enable Timer3 interrupts
	TMR3CN0|=0b_0000_0100;  // Start Timer3 (TMR3CN0 is not bit addressable)

	// Initialize timer 5 for periodic interrupts
	SFRPAGE=0x10;
	TMR5CN0=0x00;   // Stop Timer5; Clear TF5; WARNING: lives in SFR page 0x10
	CKCON1|=0b_0000_0100; // Timer 5 uses the system clock
	TMR5RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
	TMR5=0xffff;   // Set to reload immediately
	EIE2|=0b_0000_1000; // Enable Timer5 interrupts
	     // Start Timer5 (TMR5CN0 is bit addressable)
	
	*/
	EA=1; // Global interrupt enable

	return 0;
}

