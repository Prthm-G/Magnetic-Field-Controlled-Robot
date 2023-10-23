;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Mon Apr 03 23:43:21 2023
;--------------------------------------------------------
$name Tone_gen
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _Timer2_ISR
	public _delay_ms
	public _Timer4_ISR
	public _T4CON
	public _left
	public _right
	public _backward
	public _forward
	public _track
	public _counter
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
	rbank1 segment data overlay
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	rseg BIT_BANK
bits:
	ds 1
	b0 equ  bits.0 
	b1 equ  bits.1 
	b2 equ  bits.2 
	b3 equ  bits.3 
	b4 equ  bits.4 
	b5 equ  bits.5 
	b6 equ  bits.6 
	b7 equ  bits.7 
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_counter:
	ds 2
_track:
	ds 2
_forward:
	ds 2
_backward:
	ds 2
_right:
	ds 2
_left:
	ds 2
_T4CON:
	ds 2
_main_rbuf_1_70:
	ds 6
_main_f_1_70:
	ds 4
_main_joy_x_1_70:
	ds 2
_main_joy_y_1_70:
	ds 2
_main_off_x_1_70:
	ds 2
_main_off_y_1_70:
	ds 2
_main_acc_y_1_70:
	ds 2
_main_acc_z_1_70:
	ds 2
_main_sloc0_1_0:
	ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_main_but1_1_70:
	DBIT	1
_main_but2_1_70:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
	CSEG at 0x0083
	ljmp	_Timer4_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	Tone_gen.c:14: volatile int counter = 0;
	clr	a
	mov	_counter,a
	mov	(_counter + 1),a
;	Tone_gen.c:15: volatile int track = 0;
	clr	a
	mov	_track,a
	mov	(_track + 1),a
;	Tone_gen.c:16: volatile int forward = 0;
	clr	a
	mov	_forward,a
	mov	(_forward + 1),a
;	Tone_gen.c:17: volatile int backward = 0;
	clr	a
	mov	_backward,a
	mov	(_backward + 1),a
;	Tone_gen.c:18: volatile int right = 0;
	clr	a
	mov	_right,a
	mov	(_right + 1),a
;	Tone_gen.c:19: volatile int left = 0;
	clr	a
	mov	_left,a
	mov	(_left + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer4_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	Tone_gen.c:23: void Timer4_ISR (void) interrupt 16 using 1
;	-----------------------------------------
;	 function Timer4_ISR
;	-----------------------------------------
_Timer4_ISR:
	using	1
	push	psw
	mov	psw,#0x08
;	Tone_gen.c:25: TF4H = 0;   // Clear Timer4 interrupt flag
	clr	_TF4H
	pop	psw
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'delay_ms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;------------------------------------------------------------
;	Tone_gen.c:29: void delay_ms (int ms)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	using	0
	mov	r2,dpl
	mov	r3,dph
;	Tone_gen.c:31: while (ms--)
L003004?:
	mov	ar4,r2
	mov	ar5,r3
	dec	r2
	cjne	r2,#0xff,L003014?
	dec	r3
L003014?:
	mov	a,r4
	orl	a,r5
	jz	L003007?
;	Tone_gen.c:33: T4CON &= ~0x10;     // Stop Timer4
	anl	_T4CON,#0xEF
	mov	a,(_T4CON + 1)
;	Tone_gen.c:34: TMR4CN0 = 0x00;     // Clear Timer4 register
	mov	_TMR4CN0,#0x00
;	Tone_gen.c:35: TMR4RL = -2000;     // Load Timer4 with -2000 for a 1ms delay
	mov	_TMR4RL,#0x30
	mov	(_TMR4RL >> 8),#0xF8
;	Tone_gen.c:36: T4CON |= 0x04;      // Start Timer4
	orl	_T4CON,#0x04
	mov	a,(_T4CON + 1)
;	Tone_gen.c:37: while (!(T4CON & 0x80));    // Wait for Timer4 overflow
L003001?:
	mov	a,_T4CON
	jb	acc.7,L003004?
	sjmp	L003001?
L003007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	Tone_gen.c:41: void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	Tone_gen.c:137: if(track){
	mov	a,_track
	orl	a,(_track + 1)
	jnz	L004022?
	ljmp	L004013?
L004022?:
;	Tone_gen.c:138: if(counter ==1){ //forward//
	mov	a,#0x01
	cjne	a,_counter,L004023?
	clr	a
	cjne	a,(_counter + 1),L004023?
	sjmp	L004024?
L004023?:
	sjmp	L004010?
L004024?:
;	Tone_gen.c:139: TF2H=0;
	clr	_TF2H
;	Tone_gen.c:140: OUT0=!OUT0;
	cpl	_P2_0
;	Tone_gen.c:141: delay_ms(700);
	mov	dptr,#0x02BC
	lcall	_delay_ms
;	Tone_gen.c:142: OUT1=!OUT0;
	mov	c,_P2_0
	cpl	c
	mov	_P1_7,c
	ljmp	L004015?
L004010?:
;	Tone_gen.c:145: else if(counter==2){ //backward//
	mov	a,#0x02
	cjne	a,_counter,L004025?
	clr	a
	cjne	a,(_counter + 1),L004025?
	sjmp	L004026?
L004025?:
	sjmp	L004007?
L004026?:
;	Tone_gen.c:146: TF2H=0;
	clr	_TF2H
;	Tone_gen.c:147: OUT0=!OUT0;
	cpl	_P2_0
;	Tone_gen.c:148: delay_ms(300);
	mov	dptr,#0x012C
	lcall	_delay_ms
;	Tone_gen.c:149: OUT1=!OUT0;
	mov	c,_P2_0
	cpl	c
	mov	_P1_7,c
;	Tone_gen.c:150: delay_ms(250);
	mov	dptr,#0x00FA
	lcall	_delay_ms
	sjmp	L004015?
L004007?:
;	Tone_gen.c:154: else if(counter==3){//left//
	mov	a,#0x03
	cjne	a,_counter,L004027?
	clr	a
	cjne	a,(_counter + 1),L004027?
	sjmp	L004028?
L004027?:
	sjmp	L004004?
L004028?:
;	Tone_gen.c:155: TF2H=0;
	clr	_TF2H
;	Tone_gen.c:156: OUT0=!OUT0;
	cpl	_P2_0
;	Tone_gen.c:157: delay_ms(250);
	mov	dptr,#0x00FA
	lcall	_delay_ms
;	Tone_gen.c:158: OUT1=!OUT0;
	mov	c,_P2_0
	cpl	c
	mov	_P1_7,c
;	Tone_gen.c:159: delay_ms(250);
	mov	dptr,#0x00FA
	lcall	_delay_ms
	sjmp	L004015?
L004004?:
;	Tone_gen.c:162: else if(counter==4){//right//
	mov	a,#0x04
	cjne	a,_counter,L004029?
	clr	a
	cjne	a,(_counter + 1),L004029?
	sjmp	L004030?
L004029?:
	sjmp	L004015?
L004030?:
;	Tone_gen.c:163: TF2H=0;
	clr	_TF2H
;	Tone_gen.c:164: OUT0=!OUT0;
	cpl	_P2_0
;	Tone_gen.c:165: delay_ms(62);
	mov	dptr,#0x003E
	lcall	_delay_ms
;	Tone_gen.c:166: OUT1=!OUT0;
	mov	c,_P2_0
	cpl	c
	mov	_P1_7,c
;	Tone_gen.c:167: delay_ms(250);
	mov	dptr,#0x00FA
	lcall	_delay_ms
	sjmp	L004015?
L004013?:
;	Tone_gen.c:173: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	Tone_gen.c:174: OUT0=!OUT0;
	cpl	_P2_0
;	Tone_gen.c:175: OUT1=!OUT0;
	mov	c,_P2_0
	cpl	c
	mov	_P1_7,c
L004015?:
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;rbuf                      Allocated with name '_main_rbuf_1_70'
;x                         Allocated to registers r2 r3 r4 r5 
;f                         Allocated with name '_main_f_1_70'
;joy_x                     Allocated with name '_main_joy_x_1_70'
;joy_y                     Allocated with name '_main_joy_y_1_70'
;off_x                     Allocated with name '_main_off_x_1_70'
;off_y                     Allocated with name '_main_off_y_1_70'
;acc_x                     Allocated to registers r2 r3 
;acc_y                     Allocated with name '_main_acc_y_1_70'
;acc_z                     Allocated with name '_main_acc_z_1_70'
;tmr2_origin               Allocated to registers 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	Tone_gen.c:190: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	Tone_gen.c:199: int tmr2_origin = TMR2RL;
	mov	a,_TMR2RL
	mov	a,(_TMR2RL >> 8)
;	Tone_gen.c:205: LCD_4BIT();
	lcall	_LCD_4BIT
;	Tone_gen.c:206: LCDprint("thisworking", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_LCDprint
;	Tone_gen.c:210: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	Tone_gen.c:212: printf("New frequency=");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	Tone_gen.c:213: scanf("%lu", &f);
	mov	a,#_main_f_1_70
	push	acc
	mov	a,#(_main_f_1_70 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	Tone_gen.c:214: x=(SYSCLK/(2L*f));
	mov	a,_main_f_1_70
	add	a,_main_f_1_70
	mov	__divulong_PARM_2,a
	mov	a,(_main_f_1_70 + 1)
	rlc	a
	mov	(__divulong_PARM_2 + 1),a
	mov	a,(_main_f_1_70 + 2)
	rlc	a
	mov	(__divulong_PARM_2 + 2),a
	mov	a,(_main_f_1_70 + 3)
	rlc	a
	mov	(__divulong_PARM_2 + 3),a
	mov	dptr,#0xA200
	mov	b,#0x4A
	mov	a,#0x04
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	Tone_gen.c:215: if(x>0xffff)
	clr	c
	mov	a,#0xFF
	subb	a,r2
	mov	a,#0xFF
	subb	a,r3
	clr	a
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	L005002?
;	Tone_gen.c:217: printf("Sorry %lu Hz is out of range.\n", f);
	push	_main_f_1_70
	push	(_main_f_1_70 + 1)
	push	(_main_f_1_70 + 2)
	push	(_main_f_1_70 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	ljmp	L005003?
L005002?:
;	Tone_gen.c:221: TR2=0; // Stop timer 2
	clr	_TR2
;	Tone_gen.c:222: TMR2RL=0x10000L-x; // Change reload value for new frequency
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	clr	a
	subb	a,r5
	mov	_TMR2RL,r2
	mov	(_TMR2RL >> 8),r3
;	Tone_gen.c:223: TMR3RL = TMR2RL*2;
	mov	_TMR3RL,_TMR2RL
	mov	a,(_TMR2RL >> 8)
	xch	a,_TMR3RL
	add	a,acc
	xch	a,_TMR3RL
	rlc	a
	mov	(_TMR3RL >> 8),a
;	Tone_gen.c:224: TR2=1; // Start timer 2
	setb	_TR2
;	Tone_gen.c:225: tmr2_origin = TMR2RL;  //store TMR2RL
	mov	a,_TMR2RL
	mov	a,(_TMR2RL >> 8)
;	Tone_gen.c:226: f=SYSCLK/(2L*(0x10000L-TMR2RL));
	mov	r2,_TMR2RL
	mov	r3,(_TMR2RL >> 8)
	clr	a
	mov	r4,a
	mov	r5,a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	r5,a
	mov	a,r2
	add	a,r2
	mov	__divslong_PARM_2,a
	mov	a,r3
	rlc	a
	mov	(__divslong_PARM_2 + 1),a
	mov	a,r4
	rlc	a
	mov	(__divslong_PARM_2 + 2),a
	mov	a,r5
	rlc	a
	mov	(__divslong_PARM_2 + 3),a
	mov	dptr,#0xA200
	mov	b,#0x4A
	mov	a,#0x04
	lcall	__divslong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	_main_f_1_70,r2
	mov	(_main_f_1_70 + 1),r3
	mov	(_main_f_1_70 + 2),r4
	mov	(_main_f_1_70 + 3),r5
;	Tone_gen.c:227: printf("\nActual frequency: %lu\n", f);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
L005003?:
;	Tone_gen.c:232: printf("\n\nEFM8LB1 WII Nunchuck I2C Reader\n");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	Tone_gen.c:234: "Check pins P2.0 and P1.7 with the oscilloscope.\r\n");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	Tone_gen.c:237: Timer4ms(200);
	mov	dpl,#0xC8
	lcall	_Timer4ms
;	Tone_gen.c:239: nunchuck_init(1);
	setb	_nunchuck_init_PARM_1
	lcall	_nunchuck_init
;	Tone_gen.c:240: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
;	Tone_gen.c:243: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:245: off_x=(int)rbuf[0]-128;
	mov	r2,_main_rbuf_1_70
	mov	r3,#0x00
	mov	a,r2
	add	a,#0x80
	mov	_main_off_x_1_70,a
	mov	a,r3
	addc	a,#0xff
	mov	(_main_off_x_1_70 + 1),a
;	Tone_gen.c:246: off_y=(int)rbuf[1]-128;
	mov	r4,(_main_rbuf_1_70 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	_main_off_y_1_70,a
	mov	a,r5
	addc	a,#0xff
	mov	(_main_off_y_1_70 + 1),a
;	Tone_gen.c:247: printf("Offset_X:%4d Offset_Y:%4d\n\n", off_x, off_y);
	push	_main_off_y_1_70
	push	(_main_off_y_1_70 + 1)
	push	_main_off_x_1_70
	push	(_main_off_x_1_70 + 1)
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	Tone_gen.c:249: while(1)
L005102?:
;	Tone_gen.c:262: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:264: joy_x=(int)rbuf[0]-128-off_x;
	mov	r6,_main_rbuf_1_70
	mov	r7,#0x00
	mov	a,r6
	add	a,#0x80
	mov	r6,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	a,r6
	clr	c
	subb	a,_main_off_x_1_70
	mov	_main_joy_x_1_70,a
	mov	a,r7
	subb	a,(_main_off_x_1_70 + 1)
	mov	(_main_joy_x_1_70 + 1),a
;	Tone_gen.c:265: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_70 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_70
	mov	_main_joy_y_1_70,a
	mov	a,r5
	subb	a,(_main_off_y_1_70 + 1)
	mov	(_main_joy_y_1_70 + 1),a
;	Tone_gen.c:266: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_70 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r2,a
	mov	r3,b
;	Tone_gen.c:267: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_70 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_70,a
	mov	(_main_acc_y_1_70 + 1),b
;	Tone_gen.c:268: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_70 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_70,a
	mov	(_main_acc_z_1_70 + 1),b
;	Tone_gen.c:270: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	rrc	a
	mov	_main_but1_1_70,c
;	Tone_gen.c:271: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_70,c
;	Tone_gen.c:272: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.2,L005005?
	mov	a,#0x02
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
L005005?:
;	Tone_gen.c:273: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.3,L005007?
	inc	r2
	cjne	r2,#0x00,L005198?
	inc	r3
L005198?:
L005007?:
;	Tone_gen.c:274: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.4,L005009?
	mov	a,#0x02
	add	a,_main_acc_y_1_70
	mov	_main_acc_y_1_70,a
	clr	a
	addc	a,(_main_acc_y_1_70 + 1)
	mov	(_main_acc_y_1_70 + 1),a
L005009?:
;	Tone_gen.c:275: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.5,L005011?
	inc	_main_acc_y_1_70
	clr	a
	cjne	a,_main_acc_y_1_70,L005201?
	inc	(_main_acc_y_1_70 + 1)
L005201?:
L005011?:
;	Tone_gen.c:276: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.6,L005013?
	mov	a,#0x02
	add	a,_main_acc_z_1_70
	mov	_main_acc_z_1_70,a
	clr	a
	addc	a,(_main_acc_z_1_70 + 1)
	mov	(_main_acc_z_1_70 + 1),a
L005013?:
;	Tone_gen.c:277: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.7,L005015?
	inc	_main_acc_z_1_70
	clr	a
	cjne	a,_main_acc_z_1_70,L005204?
	inc	(_main_acc_z_1_70 + 1)
L005204?:
L005015?:
;	Tone_gen.c:281: LCDprint("mode:remote", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_9
	mov	b,#0x80
	push	ar2
	push	ar3
	lcall	_LCDprint
	pop	ar3
	pop	ar2
;	Tone_gen.c:282: if(joy_x >= 80){
	clr	c
	mov	a,_main_joy_x_1_70
	subb	a,#0x50
	mov	a,(_main_joy_x_1_70 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L005205?
	ljmp	L005032?
L005205?:
;	Tone_gen.c:283: LCDprint("right", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_10
	mov	b,#0x80
	push	ar2
	push	ar3
	lcall	_LCDprint
	pop	ar3
	pop	ar2
;	Tone_gen.c:284: right=1;
	mov	_right,#0x01
	clr	a
	mov	(_right + 1),a
;	Tone_gen.c:285: while(joy_x>=80){
L005028?:
	clr	c
	mov	a,_main_joy_x_1_70
	subb	a,#0x50
	mov	a,(_main_joy_x_1_70 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L005206?
	ljmp	L005032?
L005206?:
;	Tone_gen.c:286: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:288: joy_x=(int)rbuf[0]-128-off_x;
	mov	_main_sloc0_1_0,_main_rbuf_1_70
	mov	(_main_sloc0_1_0 + 1),#0x00
	mov	a,_main_sloc0_1_0
	add	a,#0x80
	mov	_main_sloc0_1_0,a
	mov	a,(_main_sloc0_1_0 + 1)
	addc	a,#0xff
	mov	(_main_sloc0_1_0 + 1),a
	mov	a,_main_sloc0_1_0
	clr	c
	subb	a,_main_off_x_1_70
	mov	_main_joy_x_1_70,a
	mov	a,(_main_sloc0_1_0 + 1)
	subb	a,(_main_off_x_1_70 + 1)
	mov	(_main_joy_x_1_70 + 1),a
;	Tone_gen.c:289: joy_y=(int)rbuf[1]-128-off_y;
	mov	_main_sloc0_1_0,(_main_rbuf_1_70 + 0x0001)
	mov	(_main_sloc0_1_0 + 1),#0x00
	mov	a,_main_sloc0_1_0
	add	a,#0x80
	mov	_main_sloc0_1_0,a
	mov	a,(_main_sloc0_1_0 + 1)
	addc	a,#0xff
	mov	(_main_sloc0_1_0 + 1),a
	mov	a,_main_sloc0_1_0
	clr	c
	subb	a,_main_off_y_1_70
	mov	_main_joy_y_1_70,a
	mov	a,(_main_sloc0_1_0 + 1)
	subb	a,(_main_off_y_1_70 + 1)
	mov	(_main_joy_y_1_70 + 1),a
;	Tone_gen.c:290: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_70 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r2,a
	mov	r3,b
;	Tone_gen.c:291: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_70 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_70,a
	mov	(_main_acc_y_1_70 + 1),b
;	Tone_gen.c:292: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_70 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_70,a
	mov	(_main_acc_z_1_70 + 1),b
;	Tone_gen.c:294: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	rrc	a
	mov	_main_but1_1_70,c
;	Tone_gen.c:295: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_70,c
;	Tone_gen.c:296: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.2,L005017?
	mov	a,#0x02
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
L005017?:
;	Tone_gen.c:297: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.3,L005019?
	inc	r2
	cjne	r2,#0x00,L005209?
	inc	r3
L005209?:
L005019?:
;	Tone_gen.c:298: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.4,L005021?
	mov	a,#0x02
	add	a,_main_acc_y_1_70
	mov	_main_acc_y_1_70,a
	clr	a
	addc	a,(_main_acc_y_1_70 + 1)
	mov	(_main_acc_y_1_70 + 1),a
L005021?:
;	Tone_gen.c:299: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.5,L005023?
	inc	_main_acc_y_1_70
	clr	a
	cjne	a,_main_acc_y_1_70,L005212?
	inc	(_main_acc_y_1_70 + 1)
L005212?:
L005023?:
;	Tone_gen.c:300: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.6,L005025?
	mov	a,#0x02
	add	a,_main_acc_z_1_70
	mov	_main_acc_z_1_70,a
	clr	a
	addc	a,(_main_acc_z_1_70 + 1)
	mov	(_main_acc_z_1_70 + 1),a
L005025?:
;	Tone_gen.c:301: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.7,L005027?
	inc	_main_acc_z_1_70
	clr	a
	cjne	a,_main_acc_z_1_70,L005215?
	inc	(_main_acc_z_1_70 + 1)
L005215?:
L005027?:
;	Tone_gen.c:304: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_70,L005106?
	mov	r6,#0x31
	sjmp	L005107?
L005106?:
	mov	r6,#0x30
L005107?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
	jnb	_main_but1_1_70,L005108?
	mov	_main_sloc0_1_0,#0x31
	sjmp	L005109?
L005108?:
	mov	_main_sloc0_1_0,#0x30
L005109?:
	mov	a,_main_sloc0_1_0
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r5,a
;	Tone_gen.c:303: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	ar2
	push	ar3
	push	_main_acc_z_1_70
	push	(_main_acc_z_1_70 + 1)
	push	_main_acc_y_1_70
	push	(_main_acc_y_1_70 + 1)
	push	ar2
	push	ar3
	push	_main_joy_y_1_70
	push	(_main_joy_y_1_70 + 1)
	push	_main_joy_x_1_70
	push	(_main_joy_x_1_70 + 1)
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	Tone_gen.c:306: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	pop	ar3
	pop	ar2
;	Tone_gen.c:307: counter =4;
	mov	_counter,#0x04
	clr	a
	mov	(_counter + 1),a
	ljmp	L005028?
L005032?:
;	Tone_gen.c:310: right=0;
;	Tone_gen.c:311: counter = 0;
	clr	a
	mov	_right,a
	mov	(_right + 1),a
	mov	_counter,a
	mov	(_counter + 1),a
;	Tone_gen.c:313: if(joy_x <= -80){
	clr	c
	mov	a,#0xB0
	subb	a,_main_joy_x_1_70
	mov	a,#(0xFF ^ 0x80)
	mov	b,(_main_joy_x_1_70 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L005218?
	ljmp	L005049?
L005218?:
;	Tone_gen.c:314: LCDprint("left", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_12
	mov	b,#0x80
	push	ar2
	push	ar3
	lcall	_LCDprint
	pop	ar3
	pop	ar2
;	Tone_gen.c:316: left=1;
	mov	_left,#0x01
	clr	a
	mov	(_left + 1),a
;	Tone_gen.c:317: while(joy_x <=-80){
L005045?:
	clr	c
	mov	a,#0xB0
	subb	a,_main_joy_x_1_70
	mov	a,#(0xFF ^ 0x80)
	mov	b,(_main_joy_x_1_70 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L005219?
	ljmp	L005049?
L005219?:
;	Tone_gen.c:318: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:320: joy_x=(int)rbuf[0]-128-off_x;
	mov	r4,_main_rbuf_1_70
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_x_1_70
	mov	_main_joy_x_1_70,a
	mov	a,r5
	subb	a,(_main_off_x_1_70 + 1)
	mov	(_main_joy_x_1_70 + 1),a
;	Tone_gen.c:321: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_70 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_70
	mov	_main_joy_y_1_70,a
	mov	a,r5
	subb	a,(_main_off_y_1_70 + 1)
	mov	(_main_joy_y_1_70 + 1),a
;	Tone_gen.c:322: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_70 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r2,a
	mov	r3,b
;	Tone_gen.c:323: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_70 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_70,a
	mov	(_main_acc_y_1_70 + 1),b
;	Tone_gen.c:324: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_70 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_70,a
	mov	(_main_acc_z_1_70 + 1),b
;	Tone_gen.c:326: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	rrc	a
	mov	_main_but1_1_70,c
;	Tone_gen.c:327: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_70,c
;	Tone_gen.c:328: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.2,L005034?
	mov	a,#0x02
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
L005034?:
;	Tone_gen.c:329: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.3,L005036?
	inc	r2
	cjne	r2,#0x00,L005222?
	inc	r3
L005222?:
L005036?:
;	Tone_gen.c:330: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.4,L005038?
	mov	a,#0x02
	add	a,_main_acc_y_1_70
	mov	_main_acc_y_1_70,a
	clr	a
	addc	a,(_main_acc_y_1_70 + 1)
	mov	(_main_acc_y_1_70 + 1),a
L005038?:
;	Tone_gen.c:331: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.5,L005040?
	inc	_main_acc_y_1_70
	clr	a
	cjne	a,_main_acc_y_1_70,L005225?
	inc	(_main_acc_y_1_70 + 1)
L005225?:
L005040?:
;	Tone_gen.c:332: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.6,L005042?
	mov	a,#0x02
	add	a,_main_acc_z_1_70
	mov	_main_acc_z_1_70,a
	clr	a
	addc	a,(_main_acc_z_1_70 + 1)
	mov	(_main_acc_z_1_70 + 1),a
L005042?:
;	Tone_gen.c:333: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.7,L005044?
	inc	_main_acc_z_1_70
	clr	a
	cjne	a,_main_acc_z_1_70,L005228?
	inc	(_main_acc_z_1_70 + 1)
L005228?:
L005044?:
;	Tone_gen.c:336: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_70,L005110?
	mov	r4,#0x31
	sjmp	L005111?
L005110?:
	mov	r4,#0x30
L005111?:
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
	jnb	_main_but1_1_70,L005112?
	mov	r6,#0x31
	sjmp	L005113?
L005112?:
	mov	r6,#0x30
L005113?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
;	Tone_gen.c:335: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	ar2
	push	ar3
	push	_main_acc_z_1_70
	push	(_main_acc_z_1_70 + 1)
	push	_main_acc_y_1_70
	push	(_main_acc_y_1_70 + 1)
	push	ar2
	push	ar3
	push	_main_joy_y_1_70
	push	(_main_joy_y_1_70 + 1)
	push	_main_joy_x_1_70
	push	(_main_joy_x_1_70 + 1)
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	Tone_gen.c:338: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	pop	ar3
	pop	ar2
;	Tone_gen.c:339: counter =3;
	mov	_counter,#0x03
	clr	a
	mov	(_counter + 1),a
	ljmp	L005045?
L005049?:
;	Tone_gen.c:342: left=0;
;	Tone_gen.c:343: counter=0;
	clr	a
	mov	_left,a
	mov	(_left + 1),a
	mov	_counter,a
	mov	(_counter + 1),a
;	Tone_gen.c:346: if(joy_y >= 80){
	clr	c
	mov	a,_main_joy_y_1_70
	subb	a,#0x50
	mov	a,(_main_joy_y_1_70 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L005231?
	ljmp	L005066?
L005231?:
;	Tone_gen.c:347: LCDprint("forward", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_13
	mov	b,#0x80
	push	ar2
	push	ar3
	lcall	_LCDprint
	pop	ar3
	pop	ar2
;	Tone_gen.c:349: forward=1;
	mov	_forward,#0x01
	clr	a
	mov	(_forward + 1),a
;	Tone_gen.c:350: while(joy_y>80){
L005062?:
	clr	c
	mov	a,#0x50
	subb	a,_main_joy_y_1_70
	clr	a
	xrl	a,#0x80
	mov	b,(_main_joy_y_1_70 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L005232?
	ljmp	L005066?
L005232?:
;	Tone_gen.c:351: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:353: joy_x=(int)rbuf[0]-128-off_x;
	mov	r4,_main_rbuf_1_70
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_x_1_70
	mov	_main_joy_x_1_70,a
	mov	a,r5
	subb	a,(_main_off_x_1_70 + 1)
	mov	(_main_joy_x_1_70 + 1),a
;	Tone_gen.c:354: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_70 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_70
	mov	_main_joy_y_1_70,a
	mov	a,r5
	subb	a,(_main_off_y_1_70 + 1)
	mov	(_main_joy_y_1_70 + 1),a
;	Tone_gen.c:355: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_70 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r2,a
	mov	r3,b
;	Tone_gen.c:356: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_70 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_70,a
	mov	(_main_acc_y_1_70 + 1),b
;	Tone_gen.c:357: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_70 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_70,a
	mov	(_main_acc_z_1_70 + 1),b
;	Tone_gen.c:359: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	rrc	a
	mov	_main_but1_1_70,c
;	Tone_gen.c:360: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_70,c
;	Tone_gen.c:361: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.2,L005051?
	mov	a,#0x02
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
L005051?:
;	Tone_gen.c:362: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.3,L005053?
	inc	r2
	cjne	r2,#0x00,L005235?
	inc	r3
L005235?:
L005053?:
;	Tone_gen.c:363: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.4,L005055?
	mov	a,#0x02
	add	a,_main_acc_y_1_70
	mov	_main_acc_y_1_70,a
	clr	a
	addc	a,(_main_acc_y_1_70 + 1)
	mov	(_main_acc_y_1_70 + 1),a
L005055?:
;	Tone_gen.c:364: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.5,L005057?
	inc	_main_acc_y_1_70
	clr	a
	cjne	a,_main_acc_y_1_70,L005238?
	inc	(_main_acc_y_1_70 + 1)
L005238?:
L005057?:
;	Tone_gen.c:365: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.6,L005059?
	mov	a,#0x02
	add	a,_main_acc_z_1_70
	mov	_main_acc_z_1_70,a
	clr	a
	addc	a,(_main_acc_z_1_70 + 1)
	mov	(_main_acc_z_1_70 + 1),a
L005059?:
;	Tone_gen.c:366: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.7,L005061?
	inc	_main_acc_z_1_70
	clr	a
	cjne	a,_main_acc_z_1_70,L005241?
	inc	(_main_acc_z_1_70 + 1)
L005241?:
L005061?:
;	Tone_gen.c:369: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_70,L005114?
	mov	r4,#0x31
	sjmp	L005115?
L005114?:
	mov	r4,#0x30
L005115?:
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
	jnb	_main_but1_1_70,L005116?
	mov	r6,#0x31
	sjmp	L005117?
L005116?:
	mov	r6,#0x30
L005117?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
;	Tone_gen.c:368: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	ar2
	push	ar3
	push	_main_acc_z_1_70
	push	(_main_acc_z_1_70 + 1)
	push	_main_acc_y_1_70
	push	(_main_acc_y_1_70 + 1)
	push	ar2
	push	ar3
	push	_main_joy_y_1_70
	push	(_main_joy_y_1_70 + 1)
	push	_main_joy_x_1_70
	push	(_main_joy_x_1_70 + 1)
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	Tone_gen.c:371: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	pop	ar3
	pop	ar2
;	Tone_gen.c:372: counter =1;
	mov	_counter,#0x01
	clr	a
	mov	(_counter + 1),a
	ljmp	L005062?
L005066?:
;	Tone_gen.c:376: forward=0;
;	Tone_gen.c:377: counter = 0;
	clr	a
	mov	_forward,a
	mov	(_forward + 1),a
	mov	_counter,a
	mov	(_counter + 1),a
;	Tone_gen.c:379: if(joy_y <= -80){
	clr	c
	mov	a,#0xB0
	subb	a,_main_joy_y_1_70
	mov	a,#(0xFF ^ 0x80)
	mov	b,(_main_joy_y_1_70 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L005244?
	ljmp	L005083?
L005244?:
;	Tone_gen.c:380: LCDprint("backward", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_14
	mov	b,#0x80
	push	ar2
	push	ar3
	lcall	_LCDprint
	pop	ar3
	pop	ar2
;	Tone_gen.c:382: backward=1;
	mov	_backward,#0x01
	clr	a
	mov	(_backward + 1),a
;	Tone_gen.c:383: while(joy_y <= -80){
L005079?:
	clr	c
	mov	a,#0xB0
	subb	a,_main_joy_y_1_70
	mov	a,#(0xFF ^ 0x80)
	mov	b,(_main_joy_y_1_70 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L005245?
	ljmp	L005083?
L005245?:
;	Tone_gen.c:384: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:386: joy_x=(int)rbuf[0]-128-off_x;
	mov	r4,_main_rbuf_1_70
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_x_1_70
	mov	_main_joy_x_1_70,a
	mov	a,r5
	subb	a,(_main_off_x_1_70 + 1)
	mov	(_main_joy_x_1_70 + 1),a
;	Tone_gen.c:387: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_70 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_70
	mov	_main_joy_y_1_70,a
	mov	a,r5
	subb	a,(_main_off_y_1_70 + 1)
	mov	(_main_joy_y_1_70 + 1),a
;	Tone_gen.c:388: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_70 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r2,a
	mov	r3,b
;	Tone_gen.c:389: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_70 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_70,a
	mov	(_main_acc_y_1_70 + 1),b
;	Tone_gen.c:390: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_70 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_70,a
	mov	(_main_acc_z_1_70 + 1),b
;	Tone_gen.c:392: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	rrc	a
	mov	_main_but1_1_70,c
;	Tone_gen.c:393: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_70,c
;	Tone_gen.c:394: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.2,L005068?
	mov	a,#0x02
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
L005068?:
;	Tone_gen.c:395: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.3,L005070?
	inc	r2
	cjne	r2,#0x00,L005248?
	inc	r3
L005248?:
L005070?:
;	Tone_gen.c:396: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.4,L005072?
	mov	a,#0x02
	add	a,_main_acc_y_1_70
	mov	_main_acc_y_1_70,a
	clr	a
	addc	a,(_main_acc_y_1_70 + 1)
	mov	(_main_acc_y_1_70 + 1),a
L005072?:
;	Tone_gen.c:397: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.5,L005074?
	inc	_main_acc_y_1_70
	clr	a
	cjne	a,_main_acc_y_1_70,L005251?
	inc	(_main_acc_y_1_70 + 1)
L005251?:
L005074?:
;	Tone_gen.c:398: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.6,L005076?
	mov	a,#0x02
	add	a,_main_acc_z_1_70
	mov	_main_acc_z_1_70,a
	clr	a
	addc	a,(_main_acc_z_1_70 + 1)
	mov	(_main_acc_z_1_70 + 1),a
L005076?:
;	Tone_gen.c:399: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.7,L005078?
	inc	_main_acc_z_1_70
	clr	a
	cjne	a,_main_acc_z_1_70,L005254?
	inc	(_main_acc_z_1_70 + 1)
L005254?:
L005078?:
;	Tone_gen.c:402: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_70,L005118?
	mov	r4,#0x31
	sjmp	L005119?
L005118?:
	mov	r4,#0x30
L005119?:
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
	jnb	_main_but1_1_70,L005120?
	mov	r6,#0x31
	sjmp	L005121?
L005120?:
	mov	r6,#0x30
L005121?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
;	Tone_gen.c:401: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	ar2
	push	ar3
	push	_main_acc_z_1_70
	push	(_main_acc_z_1_70 + 1)
	push	_main_acc_y_1_70
	push	(_main_acc_y_1_70 + 1)
	push	ar2
	push	ar3
	push	_main_joy_y_1_70
	push	(_main_joy_y_1_70 + 1)
	push	_main_joy_x_1_70
	push	(_main_joy_x_1_70 + 1)
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	Tone_gen.c:404: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	pop	ar3
	pop	ar2
;	Tone_gen.c:405: counter = 2;
	mov	_counter,#0x02
	clr	a
	mov	(_counter + 1),a
	ljmp	L005079?
L005083?:
;	Tone_gen.c:409: backward=0;
;	Tone_gen.c:410: counter = 0;
	clr	a
	mov	_backward,a
	mov	(_backward + 1),a
	mov	_counter,a
	mov	(_counter + 1),a
;	Tone_gen.c:413: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_70,L005122?
	mov	r4,#0x31
	sjmp	L005123?
L005122?:
	mov	r4,#0x30
L005123?:
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
	jnb	_main_but1_1_70,L005124?
	mov	r6,#0x31
	sjmp	L005125?
L005124?:
	mov	r6,#0x30
L005125?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
;	Tone_gen.c:412: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	_main_acc_z_1_70
	push	(_main_acc_z_1_70 + 1)
	push	_main_acc_y_1_70
	push	(_main_acc_y_1_70 + 1)
	push	ar2
	push	ar3
	push	_main_joy_y_1_70
	push	(_main_joy_y_1_70 + 1)
	push	_main_joy_x_1_70
	push	(_main_joy_x_1_70 + 1)
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	Tone_gen.c:415: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
;	Tone_gen.c:417: if(but1==0){
	jnb	_main_but1_1_70,L005259?
	ljmp	L005102?
L005259?:
;	Tone_gen.c:418: LCDprint("mode:track", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_15
	mov	b,#0x80
	lcall	_LCDprint
;	Tone_gen.c:419: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
;	Tone_gen.c:420: track = 1;
	mov	_track,#0x01
	clr	a
	mov	(_track + 1),a
;	Tone_gen.c:422: while(but2!=0){
L005096?:
	jb	_main_but2_1_70,L005260?
	ljmp	L005098?
L005260?:
;	Tone_gen.c:424: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_70
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	Tone_gen.c:426: joy_x=(int)rbuf[0]-128-off_x;
	mov	r4,_main_rbuf_1_70
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_x_1_70
	mov	_main_joy_x_1_70,a
	mov	a,r5
	subb	a,(_main_off_x_1_70 + 1)
	mov	(_main_joy_x_1_70 + 1),a
;	Tone_gen.c:427: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_70 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_70
	mov	_main_joy_y_1_70,a
	mov	a,r5
	subb	a,(_main_off_y_1_70 + 1)
	mov	(_main_joy_y_1_70 + 1),a
;	Tone_gen.c:428: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_70 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r2,a
	mov	r3,b
;	Tone_gen.c:429: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_70 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_70,a
	mov	(_main_acc_y_1_70 + 1),b
;	Tone_gen.c:430: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_70 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_70,a
	mov	(_main_acc_z_1_70 + 1),b
;	Tone_gen.c:432: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	rrc	a
	mov	_main_but1_1_70,c
;	Tone_gen.c:433: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_70,c
;	Tone_gen.c:434: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.2,L005085?
	mov	a,#0x02
	add	a,r2
	mov	r2,a
	clr	a
	addc	a,r3
	mov	r3,a
L005085?:
;	Tone_gen.c:435: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.3,L005087?
	inc	r2
	cjne	r2,#0x00,L005263?
	inc	r3
L005263?:
L005087?:
;	Tone_gen.c:436: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.4,L005089?
	mov	a,#0x02
	add	a,_main_acc_y_1_70
	mov	_main_acc_y_1_70,a
	clr	a
	addc	a,(_main_acc_y_1_70 + 1)
	mov	(_main_acc_y_1_70 + 1),a
L005089?:
;	Tone_gen.c:437: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.5,L005091?
	inc	_main_acc_y_1_70
	clr	a
	cjne	a,_main_acc_y_1_70,L005266?
	inc	(_main_acc_y_1_70 + 1)
L005266?:
L005091?:
;	Tone_gen.c:438: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.6,L005093?
	mov	a,#0x02
	add	a,_main_acc_z_1_70
	mov	_main_acc_z_1_70,a
	clr	a
	addc	a,(_main_acc_z_1_70 + 1)
	mov	(_main_acc_z_1_70 + 1),a
L005093?:
;	Tone_gen.c:439: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_70 + 0x0005)
	jnb	acc.7,L005095?
	inc	_main_acc_z_1_70
	clr	a
	cjne	a,_main_acc_z_1_70,L005269?
	inc	(_main_acc_z_1_70 + 1)
L005269?:
L005095?:
;	Tone_gen.c:442: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_70,L005126?
	mov	r4,#0x31
	sjmp	L005127?
L005126?:
	mov	r4,#0x30
L005127?:
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
	jnb	_main_but1_1_70,L005128?
	mov	r6,#0x31
	sjmp	L005129?
L005128?:
	mov	r6,#0x30
L005129?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
;	Tone_gen.c:441: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	_main_acc_z_1_70
	push	(_main_acc_z_1_70 + 1)
	push	_main_acc_y_1_70
	push	(_main_acc_y_1_70 + 1)
	push	ar2
	push	ar3
	push	_main_joy_y_1_70
	push	(_main_joy_y_1_70 + 1)
	push	_main_joy_x_1_70
	push	(_main_joy_x_1_70 + 1)
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	Tone_gen.c:444: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	ljmp	L005096?
L005098?:
;	Tone_gen.c:446: track = 0;
;	Tone_gen.c:447: counter = 0;
	clr	a
	mov	_track,a
	mov	(_track + 1),a
	mov	_counter,a
	mov	(_counter + 1),a
	ljmp	L005102?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'thisworking'
	db 0x00
__str_1:
	db 0x1B
	db '[2J'
	db 0x00
__str_2:
	db 'New frequency='
	db 0x00
__str_3:
	db '%lu'
	db 0x00
__str_4:
	db 'Sorry %lu Hz is out of range.'
	db 0x0A
	db 0x00
__str_5:
	db 0x0A
	db 'Actual frequency: %lu'
	db 0x0A
	db 0x00
__str_6:
	db 0x0A
	db 0x0A
	db 'EFM8LB1 WII Nunchuck I2C Reader'
	db 0x0A
	db 0x00
__str_7:
	db 'Variable frequency generator for the EFM8LB1.'
	db 0x0D
	db 0x0A
	db 'Check pins P2'
	db '.0 and P1.7 with the oscilloscope.'
	db 0x0D
	db 0x0A
	db 0x00
__str_8:
	db 'Offset_X:%4d Offset_Y:%4d'
	db 0x0A
	db 0x0A
	db 0x00
__str_9:
	db 'mode:remote'
	db 0x00
__str_10:
	db 'right'
	db 0x00
__str_11:
	db 'Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3'
	db 'd, %3d)'
	db 0x1B
	db '[0J'
	db 0x0D
	db 0x00
__str_12:
	db 'left'
	db 0x00
__str_13:
	db 'forward'
	db 0x00
__str_14:
	db 'backward'
	db 0x00
__str_15:
	db 'mode:track'
	db 0x00

	CSEG

end
