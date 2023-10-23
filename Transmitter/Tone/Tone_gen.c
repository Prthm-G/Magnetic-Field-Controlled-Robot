//  freq_gen.c: Uses timer 2 interrupt to generate a square wave at pins
//  P2.0 and P2.1.  The program allows the user to enter a frequency.
//  Copyright (c) 2010-2018 Jesus Calvino-Fraga
//  ~C51~


#include <EFM8LB1.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include "globals.h"
#include "lcd.h"

volatile int counter = 0;
volatile int track = 0;
volatile int forward = 0;
volatile int backward = 0;
volatile int right = 0;
volatile int left = 0;
volatile int T4CON;
#define T4CON_VALUE 0x04       // Timer 4 enabled, no auto-reload

void Timer4_ISR (void) interrupt 16 using 1
{
    TF4H = 0;   // Clear Timer4 interrupt flag
}

// Delay function using Timer4ms
void delay_ms (int ms)
{
    while (ms--)
    {
        T4CON &= ~0x10;     // Stop Timer4
        TMR4CN0 = 0x00;     // Clear Timer4 register
        TMR4RL = -2000;     // Load Timer4 with -2000 for a 1ms delay
        T4CON |= 0x04;      // Start Timer4
        while (!(T4CON & 0x80));    // Wait for Timer4 overflow
    }
}

void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{	
	//counter =0;
	/*if(forward){
		if(counter==0){
			TF2H=0;
			OUT0=1;
			OUT1=0;
			counter++;
		}
		if(counter==1){
			TF2H=0;
			counter++;
		}
		if(counter==2){
			TF2H=0;
			OUT0=!OUT0;
			OUT1=!OUT0;
			counter=0;
		}
	}*/
	/*if(forward){

		if(counter<5){
			TF2H=0;
			OUT0=1;
			OUT1=!OUT0;
			counter++;
		}

		else{
			TF2H=0;
			OUT0=!OUT0;
			OUT1=!OUT0;
			counter=0;
		}
	
	}

	

	else if(backward){

		if(counter<10){
			TF2H=0;
			OUT0=1;
			OUT1=!OUT0;
			counter++;
		}

		else{
			TF2H=0;
			OUT0=!OUT0;
			OUT1=!OUT0;
			counter=0;
		}
	
	}

	else if(left){
		if(counter==0){
			TF2H=0;
			OUT0=1;
			OUT1=0;
			counter++;
		}
		if(counter==1){
			TF2H=0;
			OUT0=!OUT0;
			OUT1=!OUT0;
			counter++;	
		}
		if(counter==2){
			TF2H=0;
			counter=0;		
		}
	}
	else if(right){
		if(counter==0){
			TF2H=0;
			OUT0=0;
			OUT1=1;
			counter++; 
		}
		if(counter==1){
			TF2H=0;
			OUT0=!OUT0;
			OUT1=!OUT0;
			counter++;			
		}
		if(counter==2){
			TF2H=0;
			counter=0;		
		}			
	}
	*/
	if(track){
		if(counter ==1){ //forward//
			TF2H=0;
			OUT0=!OUT0;
			delay_ms(700);
			OUT1=!OUT0;
			//counter++;			
		}
		else if(counter==2){ //backward//
			TF2H=0;
			OUT0=!OUT0;
			delay_ms(300);
			OUT1=!OUT0;
			delay_ms(250);
			//counter++;				
		}

		else if(counter==3){//left//
			TF2H=0;
			OUT0=!OUT0;
			delay_ms(250);
			OUT1=!OUT0;
			delay_ms(250);
			//counter =0;		
		}
		else if(counter==4){//right//
			TF2H=0;
			OUT0=!OUT0;
			delay_ms(62);
			OUT1=!OUT0;
			delay_ms(250);
			//counter =0;		
		}
	}

	else{
	TF2H = 0; // Clear Timer2 interrupt flag
	OUT0=!OUT0;
	OUT1=!OUT0;
	}

	

}


/*void Timer5_ISR (void) interrupt INTERRUPT_TIMER5{
	TF5H = 0;
	OUT0=!OUT0;
	OUT1=!OUT0;
}*/


void main (void)
{
	unsigned char rbuf[6];
	unsigned long int x, f;

 	int joy_x, joy_y, off_x, off_y, acc_x, acc_y, acc_z;
 	bit but1, but2;
	//int width_new;
	//int reload_new;
	int tmr2_origin = TMR2RL;

	
	//Timer4ms(1000);
	//char buff [17];
	//Configure LCd
	LCD_4BIT();
	LCDprint("thisworking", 1, 1);


	
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

	printf("New frequency=");
	scanf("%lu", &f);
	x=(SYSCLK/(2L*f));
	if(x>0xffff)
		{
			printf("Sorry %lu Hz is out of range.\n", f);
		}
	else
		{
			TR2=0; // Stop timer 2
			TMR2RL=0x10000L-x; // Change reload value for new frequency
			TMR3RL = TMR2RL*2;
			TR2=1; // Start timer 2
			tmr2_origin = TMR2RL;  //store TMR2RL
			f=SYSCLK/(2L*(0x10000L-TMR2RL));
			printf("\nActual frequency: %lu\n", f);
		
		} 
		

	printf("\n\nEFM8LB1 WII Nunchuck I2C Reader\n");
	printf("Variable frequency generator for the EFM8LB1.\r\n"
	       "Check pins P2.0 and P1.7 with the oscilloscope.\r\n");
	

	Timer4ms(200);
	
	nunchuck_init(1);
	Timer4ms(100);
	

	nunchuck_getdata(rbuf);

	off_x=(int)rbuf[0]-128;
	off_y=(int)rbuf[1]-128;
	printf("Offset_X:%4d Offset_Y:%4d\n\n", off_x, off_y);

	while(1)
	{
	 /* PWM CONFIGURATION tentative
	  50% duty cycle = control mode
	  40% duty cycle = track mode
	  60% duty cycle = move forward
	  70% duty cycle = move backward
	  80% duty cycle = move right
	  90% duty cycle = move left
	  */

	  //NESTED WHILE LOOPS. outer while loop is remote control state
	  // and inner loop is tracking state
		nunchuck_getdata(rbuf);

		joy_x=(int)rbuf[0]-128-off_x;
		joy_y=(int)rbuf[1]-128-off_y;
		acc_x=rbuf[2]*4; 
		acc_y=rbuf[3]*4;
		acc_z=rbuf[4]*4;

		but1=(rbuf[5] & 0x01)?1:0;
		but2=(rbuf[5] & 0x02)?1:0;
		if (rbuf[5] & 0x04) acc_x+=2;
		if (rbuf[5] & 0x08) acc_x+=1;
		if (rbuf[5] & 0x10) acc_y+=2;
		if (rbuf[5] & 0x20) acc_y+=1;
		if (rbuf[5] & 0x40) acc_z+=2;
		if (rbuf[5] & 0x80) acc_z+=1;

		//DEFAULT REMOTE CONTROL STATE
		
		LCDprint("mode:remote", 1, 1);
		if(joy_x >= 80){
			LCDprint("right", 2, 1);
			right=1;
			while(joy_x>=80){
				nunchuck_getdata(rbuf);

				joy_x=(int)rbuf[0]-128-off_x;
				joy_y=(int)rbuf[1]-128-off_y;
				acc_x=rbuf[2]*4; 
				acc_y=rbuf[3]*4;
				acc_z=rbuf[4]*4;

				but1=(rbuf[5] & 0x01)?1:0;
				but2=(rbuf[5] & 0x02)?1:0;
				if (rbuf[5] & 0x04) acc_x+=2;
				if (rbuf[5] & 0x08) acc_x+=1;
				if (rbuf[5] & 0x10) acc_y+=2;
				if (rbuf[5] & 0x20) acc_y+=1;
				if (rbuf[5] & 0x40) acc_z+=2;
				if (rbuf[5] & 0x80) acc_z+=1;

				printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
					but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
				
				Timer4ms(100);
				counter =4;
			}
		}
		right=0;
		counter = 0;

		if(joy_x <= -80){
			LCDprint("left", 2, 1);
			//90% duty cycle
			left=1;
			while(joy_x <=-80){
				nunchuck_getdata(rbuf);

				joy_x=(int)rbuf[0]-128-off_x;
				joy_y=(int)rbuf[1]-128-off_y;
				acc_x=rbuf[2]*4; 
				acc_y=rbuf[3]*4;
				acc_z=rbuf[4]*4;

				but1=(rbuf[5] & 0x01)?1:0;
				but2=(rbuf[5] & 0x02)?1:0;
				if (rbuf[5] & 0x04) acc_x+=2;
				if (rbuf[5] & 0x08) acc_x+=1;
				if (rbuf[5] & 0x10) acc_y+=2;
				if (rbuf[5] & 0x20) acc_y+=1;
				if (rbuf[5] & 0x40) acc_z+=2;
				if (rbuf[5] & 0x80) acc_z+=1;

				printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
					 but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	
				Timer4ms(100);
				counter =3;
			}
		}
		left=0;
		counter=0;


		if(joy_y >= 80){
			LCDprint("forward", 2, 1);
			//60% duty cycle
			forward=1;
			while(joy_y>80){
				nunchuck_getdata(rbuf);

				joy_x=(int)rbuf[0]-128-off_x;
				joy_y=(int)rbuf[1]-128-off_y;
				acc_x=rbuf[2]*4; 
				acc_y=rbuf[3]*4;
				acc_z=rbuf[4]*4;

				but1=(rbuf[5] & 0x01)?1:0;
				but2=(rbuf[5] & 0x02)?1:0;
				if (rbuf[5] & 0x04) acc_x+=2;
				if (rbuf[5] & 0x08) acc_x+=1;
				if (rbuf[5] & 0x10) acc_y+=2;
				if (rbuf[5] & 0x20) acc_y+=1;
				if (rbuf[5] & 0x40) acc_z+=2;
				if (rbuf[5] & 0x80) acc_z+=1;

				printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
					but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
				
				Timer4ms(100);
				counter =1;

			}
		}
		forward=0;
		counter = 0;

		if(joy_y <= -80){
			LCDprint("backward", 2, 1);
			//70% duty cycle
			backward=1;
			while(joy_y <= -80){
				nunchuck_getdata(rbuf);

				joy_x=(int)rbuf[0]-128-off_x;
				joy_y=(int)rbuf[1]-128-off_y;
				acc_x=rbuf[2]*4; 
				acc_y=rbuf[3]*4;
				acc_z=rbuf[4]*4;

				but1=(rbuf[5] & 0x01)?1:0;
				but2=(rbuf[5] & 0x02)?1:0;
				if (rbuf[5] & 0x04) acc_x+=2;
				if (rbuf[5] & 0x08) acc_x+=1;
				if (rbuf[5] & 0x10) acc_y+=2;
				if (rbuf[5] & 0x20) acc_y+=1;
				if (rbuf[5] & 0x40) acc_z+=2;
				if (rbuf[5] & 0x80) acc_z+=1;

				printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
					but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
				
				Timer4ms(100);
				counter = 2;

			}
		}
		backward=0;
		counter = 0;
		
		printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
			   but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	
		Timer4ms(100);
		
		if(but1==0){
			LCDprint("mode:track", 1, 1);
			Timer4ms(100);
			track = 1;

			while(but2!=0){
				
				nunchuck_getdata(rbuf);

				joy_x=(int)rbuf[0]-128-off_x;
				joy_y=(int)rbuf[1]-128-off_y;
				acc_x=rbuf[2]*4; 
				acc_y=rbuf[3]*4;
				acc_z=rbuf[4]*4;

				but1=(rbuf[5] & 0x01)?1:0;
				but2=(rbuf[5] & 0x02)?1:0;
				if (rbuf[5] & 0x04) acc_x+=2;
				if (rbuf[5] & 0x08) acc_x+=1;
				if (rbuf[5] & 0x10) acc_y+=2;
				if (rbuf[5] & 0x20) acc_y+=1;
				if (rbuf[5] & 0x40) acc_z+=2;
				if (rbuf[5] & 0x80) acc_z+=1;

				printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
					but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
				
				Timer4ms(100);
			}
			track = 0;
			counter = 0;
		}
		


	}
}
