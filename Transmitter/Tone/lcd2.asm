;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Sat Apr 01 03:51:17 2023
;--------------------------------------------------------
$name lcd2
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
	public _LCDprint_PARM_3
	public _nunchuck_init_PARM_1
	public _LCDprint_PARM_2
	public _Timer4ms
	public _I2C_write
	public _I2C_read
	public _I2C_start
	public _I2C_stop
	public _nunchuck_init
	public _nunchuck_getdata
	public _LCD_pulse
	public _LCD_byte
	public _WriteData
	public _WriteCommand
	public _LCD_4BIT
	public _LCDprint
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
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_nunchuck_init_buf_1_49:
	ds 6
_nunchuck_init_sloc0_1_0:
	ds 2
_nunchuck_init_sloc1_1_0:
	ds 2
_nunchuck_init_sloc2_1_0:
	ds 2
_LCDprint_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
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
_nunchuck_init_PARM_1:
	DBIT	1
_LCDprint_PARM_3:
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
; Interrupt vectors
;--------------------------------------------------------
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer4ms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 
;i                         Allocated to registers r4 
;k                         Allocated to registers r3 
;------------------------------------------------------------
;	lcd2.c:9: void Timer4ms(unsigned char ms)
;	-----------------------------------------
;	 function Timer4ms
;	-----------------------------------------
_Timer4ms:
	using	0
	mov	r2,dpl
;	lcd2.c:14: k=SFRPAGE;
	mov	r3,_SFRPAGE
;	lcd2.c:15: SFRPAGE=0x10;
	mov	_SFRPAGE,#0x10
;	lcd2.c:17: CKCON1|=0b_0000_0001;
	orl	_CKCON1,#0x01
;	lcd2.c:19: TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	mov	_TMR4RL,#0xC0
	mov	(_TMR4RL >> 8),#0xE6
;	lcd2.c:20: TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	mov	_TMR4,_TMR4RL
	mov	(_TMR4 >> 8),(_TMR4RL >> 8)
;	lcd2.c:22: TF4H=0; // Clear overflow flag
	clr	_TF4H
;	lcd2.c:23: TR4=1;  // Start Timer4
	setb	_TR4
;	lcd2.c:24: for (i = 0; i < ms; i++)       // Count <ms> overflows
	mov	r4,#0x00
L002004?:
	clr	c
	mov	a,r4
	subb	a,r2
	jnc	L002007?
;	lcd2.c:26: while (!TF4H);  // Wait for overflow
L002001?:
;	lcd2.c:27: TF4H=0;         // Clear overflow indicator
	jbc	_TF4H,L002015?
	sjmp	L002001?
L002015?:
;	lcd2.c:24: for (i = 0; i < ms; i++)       // Count <ms> overflows
	inc	r4
	sjmp	L002004?
L002007?:
;	lcd2.c:29: TR4=0; // Stop Timer4
	clr	_TR4
;	lcd2.c:30: SFRPAGE=k;	
	mov	_SFRPAGE,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_write'
;------------------------------------------------------------
;output_data               Allocated to registers 
;------------------------------------------------------------
;	lcd2.c:34: void I2C_write (unsigned char output_data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
	mov	_SMB0DAT,dpl
;	lcd2.c:37: SI = 0;
	clr	_SI
;	lcd2.c:38: while (!SI); // Wait until done with send
L003001?:
	jnb	_SI,L003001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_read'
;------------------------------------------------------------
;input_data                Allocated to registers 
;------------------------------------------------------------
;	lcd2.c:41: unsigned char I2C_read (void)
;	-----------------------------------------
;	 function I2C_read
;	-----------------------------------------
_I2C_read:
;	lcd2.c:45: SI = 0;
	clr	_SI
;	lcd2.c:46: while (!SI); // Wait until we have data to read
L004001?:
	jnb	_SI,L004001?
;	lcd2.c:47: input_data = SMB0DAT; // Read the data
	mov	dpl,_SMB0DAT
;	lcd2.c:49: return input_data;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_start'
;------------------------------------------------------------
;------------------------------------------------------------
;	lcd2.c:52: void I2C_start (void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	lcd2.c:54: ACK = 1;
	setb	_ACK
;	lcd2.c:55: STA = 1;     // Send I2C start
	setb	_STA
;	lcd2.c:56: STO = 0;
	clr	_STO
;	lcd2.c:57: SI = 0;
	clr	_SI
;	lcd2.c:58: while (!SI); // Wait until start sent
L005001?:
	jnb	_SI,L005001?
;	lcd2.c:59: STA = 0;     // Reset I2C start
	clr	_STA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	lcd2.c:62: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	lcd2.c:64: STO = 1;  	// Perform I2C stop
	setb	_STO
;	lcd2.c:65: SI = 0;	// Clear SI
	clr	_SI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'nunchuck_init'
;------------------------------------------------------------
;i                         Allocated to registers r2 
;buf                       Allocated with name '_nunchuck_init_buf_1_49'
;sloc0                     Allocated with name '_nunchuck_init_sloc0_1_0'
;sloc1                     Allocated with name '_nunchuck_init_sloc1_1_0'
;sloc2                     Allocated with name '_nunchuck_init_sloc2_1_0'
;------------------------------------------------------------
;	lcd2.c:69: void nunchuck_init(bit print_extension_type)
;	-----------------------------------------
;	 function nunchuck_init
;	-----------------------------------------
_nunchuck_init:
;	lcd2.c:74: I2C_start();
	lcall	_I2C_start
;	lcd2.c:75: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:76: I2C_write(0xF0);
	mov	dpl,#0xF0
	lcall	_I2C_write
;	lcd2.c:77: I2C_write(0x55);
	mov	dpl,#0x55
	lcall	_I2C_write
;	lcd2.c:78: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:79: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	lcd2.c:82: I2C_start();
	lcall	_I2C_start
;	lcd2.c:83: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:84: I2C_write(0xFB);
	mov	dpl,#0xFB
	lcall	_I2C_write
;	lcd2.c:85: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:86: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:87: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	lcd2.c:92: I2C_start();
	lcall	_I2C_start
;	lcd2.c:93: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:94: I2C_write(0xFA); // extension type register
	mov	dpl,#0xFA
	lcall	_I2C_write
;	lcd2.c:95: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:96: Timer4ms(3); // 3 ms required to complete acquisition
	mov	dpl,#0x03
	lcall	_Timer4ms
;	lcd2.c:98: I2C_start();
	lcall	_I2C_start
;	lcd2.c:99: I2C_write(0xA5);
	mov	dpl,#0xA5
	lcall	_I2C_write
;	lcd2.c:102: for(i=0; i<6; i++)
	mov	r2,#0x00
L007003?:
	cjne	r2,#0x06,L007013?
L007013?:
	jnc	L007006?
;	lcd2.c:104: buf[i]=I2C_read();
	mov	a,r2
	add	a,#_nunchuck_init_buf_1_49
	mov	r0,a
	push	ar2
	push	ar0
	lcall	_I2C_read
	mov	a,dpl
	pop	ar0
	pop	ar2
	mov	@r0,a
;	lcd2.c:102: for(i=0; i<6; i++)
	inc	r2
	sjmp	L007003?
L007006?:
;	lcd2.c:106: ACK=0;
	clr	_ACK
;	lcd2.c:107: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:108: Timer4ms(3);
	mov	dpl,#0x03
	lcall	_Timer4ms
;	lcd2.c:111: if(print_extension_type)
	jnb	_nunchuck_init_PARM_1,L007002?
;	lcd2.c:114: buf[0],  buf[1], buf[2], buf[3], buf[4], buf[5]);
	mov	r2,(_nunchuck_init_buf_1_49 + 0x0005)
	mov	r3,#0x00
	mov	r4,(_nunchuck_init_buf_1_49 + 0x0004)
	mov	r5,#0x00
	mov	_nunchuck_init_sloc0_1_0,(_nunchuck_init_buf_1_49 + 0x0003)
	mov	(_nunchuck_init_sloc0_1_0 + 1),#0x00
	mov	_nunchuck_init_sloc1_1_0,(_nunchuck_init_buf_1_49 + 0x0002)
	mov	(_nunchuck_init_sloc1_1_0 + 1),#0x00
	mov	_nunchuck_init_sloc2_1_0,(_nunchuck_init_buf_1_49 + 0x0001)
	mov	(_nunchuck_init_sloc2_1_0 + 1),#0x00
	mov	r6,_nunchuck_init_buf_1_49
	mov	r7,#0x00
;	lcd2.c:113: printf("Extension type: %02x  %02x  %02x  %02x  %02x  %02x\n", 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_nunchuck_init_sloc0_1_0
	push	(_nunchuck_init_sloc0_1_0 + 1)
	push	_nunchuck_init_sloc1_1_0
	push	(_nunchuck_init_sloc1_1_0 + 1)
	push	_nunchuck_init_sloc2_1_0
	push	(_nunchuck_init_sloc2_1_0 + 1)
	push	ar6
	push	ar7
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
L007002?:
;	lcd2.c:119: I2C_start();
	lcall	_I2C_start
;	lcd2.c:120: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:121: I2C_write(0xF0);
	mov	dpl,#0xF0
	lcall	_I2C_write
;	lcd2.c:122: I2C_write(0xAA);
	mov	dpl,#0xAA
	lcall	_I2C_write
;	lcd2.c:123: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:124: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	lcd2.c:127: I2C_start();
	lcall	_I2C_start
;	lcd2.c:128: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:129: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	lcd2.c:130: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:131: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:132: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:133: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:134: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:135: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:136: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:137: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	lcd2.c:140: I2C_start();
	lcall	_I2C_start
;	lcd2.c:141: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:142: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	lcd2.c:143: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:144: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:145: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:146: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:147: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:148: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:149: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:150: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	lcd2.c:153: I2C_start();
	lcall	_I2C_start
;	lcd2.c:154: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:155: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	lcd2.c:156: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:157: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:158: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:159: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:160: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:161: Timer4ms(1);
	mov	dpl,#0x01
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'nunchuck_getdata'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	lcd2.c:165: void nunchuck_getdata(unsigned char * s)
;	-----------------------------------------
;	 function nunchuck_getdata
;	-----------------------------------------
_nunchuck_getdata:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	lcd2.c:170: I2C_start();
	push	ar2
	push	ar3
	push	ar4
	lcall	_I2C_start
;	lcd2.c:171: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	lcd2.c:172: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	lcd2.c:173: I2C_stop();
	lcall	_I2C_stop
;	lcd2.c:174: Timer4ms(3); 	// 3 ms required to complete acquisition
	mov	dpl,#0x03
	lcall	_Timer4ms
;	lcd2.c:178: I2C_start();
	lcall	_I2C_start
;	lcd2.c:179: I2C_write(0xA5);
	mov	dpl,#0xA5
	lcall	_I2C_write
	pop	ar4
	pop	ar3
	pop	ar2
;	lcd2.c:182: for(i=0; i<6; i++)
	mov	r5,#0x00
L008001?:
	cjne	r5,#0x06,L008010?
L008010?:
	jnc	L008004?
;	lcd2.c:184: s[i]=(I2C_read()^0x17)+0x17; // Read and decrypt
	mov	a,r5
	add	a,r2
	mov	r6,a
	clr	a
	addc	a,r3
	mov	r7,a
	mov	ar0,r4
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	_I2C_read
	mov	a,dpl
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	xrl	a,#0x17
	add	a,#0x17
	mov	r1,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	lcall	__gptrput
;	lcd2.c:182: for(i=0; i<6; i++)
	inc	r5
	sjmp	L008001?
L008004?:
;	lcd2.c:186: ACK=0;
	clr	_ACK
;	lcd2.c:187: I2C_stop();
	ljmp	_I2C_stop
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	lcd2.c:193: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	lcd2.c:195: LCD_E=1;
	setb	_P2_5
;	lcd2.c:196: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	lcd2.c:197: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	lcd2.c:200: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	lcd2.c:203: ACC=x; //Send high nible
	mov	_ACC,r2
;	lcd2.c:204: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P2_1,c
;	lcd2.c:205: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P2_2,c
;	lcd2.c:206: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P2_3,c
;	lcd2.c:207: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_4,c
;	lcd2.c:208: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	lcd2.c:209: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
	pop	ar2
;	lcd2.c:210: ACC=x; //Send low nible
	mov	_ACC,r2
;	lcd2.c:211: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	lcd2.c:212: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	lcd2.c:213: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	lcd2.c:214: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	lcd2.c:215: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	lcd2.c:218: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
;	lcd2.c:220: LCD_RS=1;
	setb	_P2_6
;	lcd2.c:221: LCD_byte(x);
	lcall	_LCD_byte
;	lcd2.c:222: Timer4ms(2);
	mov	dpl,#0x02
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	lcd2.c:225: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
;	lcd2.c:227: LCD_RS=0;
	clr	_P2_6
;	lcd2.c:228: LCD_byte(x);
	lcall	_LCD_byte
;	lcd2.c:229: Timer4ms(5);
	mov	dpl,#0x05
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	lcd2.c:232: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	lcd2.c:234: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_5
;	lcd2.c:236: Timer4ms(20);
	mov	dpl,#0x14
	lcall	_Timer4ms
;	lcd2.c:238: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	lcd2.c:239: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	lcd2.c:240: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	lcd2.c:243: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	lcd2.c:244: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	lcd2.c:245: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	lcd2.c:246: Timer4ms(20); // Wait for clear screen command to finsih.
	mov	dpl,#0x14
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	lcd2.c:249: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	lcd2.c:253: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L014013?
	mov	r5,#0xC0
	sjmp	L014014?
L014013?:
	mov	r5,#0x80
L014014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	lcd2.c:254: Timer4ms(5);
	mov	dpl,#0x05
	lcall	_Timer4ms
	pop	ar4
	pop	ar3
	pop	ar2
;	lcd2.c:255: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L014003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L014006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L014003?
	inc	r6
	sjmp	L014003?
L014006?:
;	lcd2.c:256: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L014011?
	mov	ar2,r5
	mov	ar3,r6
L014007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L014011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L014007?
	inc	r3
	sjmp	L014007?
L014011?:
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Extension type: %02x  %02x  %02x  %02x  %02x  %02x'
	db 0x0A
	db 0x00

	CSEG

end
