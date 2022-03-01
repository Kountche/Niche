
_sms:

;Niche.c,29 :: 		void sms(char mesg[])
;Niche.c,32 :: 		UART1_Write_Text(AT);
	MOVLW      _AT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,33 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_sms0:
	DECFSZ     R13+0, 1
	GOTO       L_sms0
	DECFSZ     R12+0, 1
	GOTO       L_sms0
	DECFSZ     R11+0, 1
	GOTO       L_sms0
	NOP
;Niche.c,34 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,35 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_sms1:
	DECFSZ     R13+0, 1
	GOTO       L_sms1
	DECFSZ     R12+0, 1
	GOTO       L_sms1
	DECFSZ     R11+0, 1
	GOTO       L_sms1
	NOP
;Niche.c,36 :: 		UART1_Write_Text(noecho);
	MOVLW      _noecho+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,37 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_sms2:
	DECFSZ     R13+0, 1
	GOTO       L_sms2
	DECFSZ     R12+0, 1
	GOTO       L_sms2
	DECFSZ     R11+0, 1
	GOTO       L_sms2
;Niche.c,38 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,39 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_sms3:
	DECFSZ     R13+0, 1
	GOTO       L_sms3
	DECFSZ     R12+0, 1
	GOTO       L_sms3
	DECFSZ     R11+0, 1
	GOTO       L_sms3
;Niche.c,40 :: 		UART1_Write_Text(mesg);
	MOVF       FARG_sms_mesg+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,41 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_sms4:
	DECFSZ     R13+0, 1
	GOTO       L_sms4
	DECFSZ     R12+0, 1
	GOTO       L_sms4
	DECFSZ     R11+0, 1
	GOTO       L_sms4
;Niche.c,42 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,43 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_sms5:
	DECFSZ     R13+0, 1
	GOTO       L_sms5
	DECFSZ     R12+0, 1
	GOTO       L_sms5
	DECFSZ     R11+0, 1
	GOTO       L_sms5
	NOP
;Niche.c,46 :: 		}
L_end_sms:
	RETURN
; end of _sms

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Niche.c,63 :: 		void interrupt() //Arreter le systeme d'alarme
;Niche.c,66 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Niche.c,67 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Niche.c,68 :: 		a=0;
	CLRF       _a+0
	CLRF       _a+1
;Niche.c,69 :: 		b=0;
	CLRF       _b+0
	CLRF       _b+1
;Niche.c,70 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Niche.c,71 :: 		}
L_end_interrupt:
L__interrupt73:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Niche.c,76 :: 		void main()
;Niche.c,80 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Niche.c,81 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Niche.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Niche.c,83 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;Niche.c,85 :: 		UART1_INIT(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Niche.c,86 :: 		TRISB=0x00000001;
	MOVLW      1
	MOVWF      TRISB+0
;Niche.c,87 :: 		TRISC=0x10001110;
	MOVLW      16
	MOVWF      TRISC+0
;Niche.c,88 :: 		TRISC.F2=1;
	BSF        TRISC+0, 2
;Niche.c,89 :: 		TRISB.F0=1;
	BSF        TRISB+0, 0
;Niche.c,91 :: 		INTCON.INTE=1;
	BSF        INTCON+0, 4
;Niche.c,92 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;Niche.c,93 :: 		intcon=0x10010000;
	MOVLW      0
	MOVWF      INTCON+0
;Niche.c,94 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Niche.c,95 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;Niche.c,96 :: 		a=0;
	CLRF       _a+0
	CLRF       _a+1
;Niche.c,97 :: 		b=0;
	CLRF       _b+0
	CLRF       _b+1
;Niche.c,98 :: 		while(1)
L_main7:
;Niche.c,102 :: 		adc = 0.49*ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      72
	MOVWF      R4+0
	MOVLW      225
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _adc+0
	MOVF       R0+1, 0
	MOVWF      _adc+1
;Niche.c,103 :: 		adc2= (unsigned int)adc ;
	MOVF       R0+0, 0
	MOVWF      _adc2+0
	MOVF       R0+1, 0
	MOVWF      _adc2+1
;Niche.c,105 :: 		WordToStr(adc, lcd);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _lcd+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;Niche.c,106 :: 		Lcd_out(2,1,num1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _num1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Niche.c,107 :: 		Lcd_out(2,5,lcd);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _lcd+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Niche.c,108 :: 		Lcd_out(2,10,num2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _num2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Niche.c,109 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;Niche.c,117 :: 		adc1=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc1+0
	MOVF       R0+1, 0
	MOVWF      _adc1+1
;Niche.c,118 :: 		adc3= (unsigned int)adc1 ;
	MOVF       R0+0, 0
	MOVWF      _adc3+0
	MOVF       R0+1, 0
	MOVWF      _adc3+1
;Niche.c,120 :: 		if(adc1>600)    //s'il y a un aboiements
	MOVLW      128
	XORLW      2
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVF       R0+0, 0
	SUBLW      88
L__main75:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;Niche.c,122 :: 		a++;b=0;
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
	CLRF       _b+0
	CLRF       _b+1
;Niche.c,123 :: 		}
	GOTO       L_main12
L_main11:
;Niche.c,126 :: 		b++;
	INCF       _b+0, 1
	BTFSC      STATUS+0, 2
	INCF       _b+1, 1
;Niche.c,127 :: 		}
L_main12:
;Niche.c,128 :: 		if(b>40)//||(portb.f0==1))
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _b+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVF       _b+0, 0
	SUBLW      40
L__main76:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;Niche.c,130 :: 		a=0;alarm =0;
	CLRF       _a+0
	CLRF       _a+1
	CLRF       _alarm+0
	CLRF       _alarm+1
;Niche.c,131 :: 		}
L_main13:
;Niche.c,132 :: 		if(a>50  )
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _a+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVF       _a+0, 0
	SUBLW      50
L__main77:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;Niche.c,134 :: 		if(a==51)
	MOVLW      0
	XORWF      _a+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVLW      51
	XORWF      _a+0, 0
L__main78:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;Niche.c,137 :: 		UART1_Write_Text(AT);
	MOVLW      _AT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,138 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;Niche.c,139 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,140 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
;Niche.c,141 :: 		UART1_Write_Text(noecho);
	MOVLW      _noecho+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,142 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;Niche.c,143 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,144 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
;Niche.c,145 :: 		UART1_Write_Text(mode_text);
	MOVLW      _mode_text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,146 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
;Niche.c,147 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,148 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
;Niche.c,149 :: 		UART1_Write_Text(char_mode);
	MOVLW      _char_mode+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,150 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
;Niche.c,151 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,152 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
;Niche.c,153 :: 		UART1_Write_Text(param);
	MOVLW      _param+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,154 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
;Niche.c,155 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,156 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	DECFSZ     R12+0, 1
	GOTO       L_main25
	DECFSZ     R11+0, 1
	GOTO       L_main25
;Niche.c,157 :: 		UART1_Write_Text(mobile_n);
	MOVLW      _mobile_n+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,158 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
;Niche.c,159 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,160 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
;Niche.c,161 :: 		UART1_Write_Text(ala);
	MOVLW      _ala+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,162 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
;Niche.c,163 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,164 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
;Niche.c,166 :: 		}
L_main15:
;Niche.c,169 :: 		portc.f0=1;delay_ms(4000);portc.f0=0;a=52;alarm=1;
	BSF        PORTC+0, 0
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	BCF        PORTC+0, 0
	MOVLW      52
	MOVWF      _a+0
	MOVLW      0
	MOVWF      _a+1
	MOVLW      1
	MOVWF      _alarm+0
	MOVLW      0
	MOVWF      _alarm+1
;Niche.c,171 :: 		}
L_main14:
;Niche.c,176 :: 		}
L_main31:
;Niche.c,180 :: 		if(PORTC.F2==1)        //  Rotation du moteur de remplissage de la nourriture
	BTFSS      PORTC+0, 2
	GOTO       L_main32
;Niche.c,182 :: 		PORTB = 0b00000110;
	MOVLW      6
	MOVWF      PORTB+0
;Niche.c,183 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	NOP
	NOP
;Niche.c,184 :: 		PORTB = 0b00001100;
	MOVLW      12
	MOVWF      PORTB+0
;Niche.c,185 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
;Niche.c,186 :: 		PORTB = 0b00011000;
	MOVLW      24
	MOVWF      PORTB+0
;Niche.c,187 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	NOP
	NOP
;Niche.c,188 :: 		PORTB = 0b00010010;
	MOVLW      18
	MOVWF      PORTB+0
;Niche.c,189 :: 		}
L_main32:
;Niche.c,190 :: 		if(PORTC.F4==1) //Alerte Manque de Nourriture dans le reservoire
	BTFSS      PORTC+0, 4
	GOTO       L_main36
;Niche.c,192 :: 		if(food==0){
	MOVLW      0
	XORWF      _food+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      0
	XORWF      _food+0, 0
L__main79:
	BTFSS      STATUS+0, 2
	GOTO       L_main37
;Niche.c,194 :: 		UART1_Write_Text(AT);
	MOVLW      _AT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,195 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
;Niche.c,196 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,197 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
	NOP
;Niche.c,198 :: 		UART1_Write_Text(noecho);
	MOVLW      _noecho+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,199 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
;Niche.c,200 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,201 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
;Niche.c,202 :: 		UART1_Write_Text(mode_text);
	MOVLW      _mode_text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,203 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	DECFSZ     R11+0, 1
	GOTO       L_main42
;Niche.c,204 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,205 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main43:
	DECFSZ     R13+0, 1
	GOTO       L_main43
	DECFSZ     R12+0, 1
	GOTO       L_main43
	DECFSZ     R11+0, 1
	GOTO       L_main43
	NOP
;Niche.c,206 :: 		UART1_Write_Text(char_mode);
	MOVLW      _char_mode+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,207 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main44:
	DECFSZ     R13+0, 1
	GOTO       L_main44
	DECFSZ     R12+0, 1
	GOTO       L_main44
	DECFSZ     R11+0, 1
	GOTO       L_main44
;Niche.c,208 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,209 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main45:
	DECFSZ     R13+0, 1
	GOTO       L_main45
	DECFSZ     R12+0, 1
	GOTO       L_main45
	DECFSZ     R11+0, 1
	GOTO       L_main45
	NOP
;Niche.c,210 :: 		UART1_Write_Text(param);
	MOVLW      _param+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,211 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	DECFSZ     R11+0, 1
	GOTO       L_main46
;Niche.c,212 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,213 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
;Niche.c,214 :: 		UART1_Write_Text(mobile_n);
	MOVLW      _mobile_n+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,215 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
;Niche.c,216 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,217 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main49:
	DECFSZ     R13+0, 1
	GOTO       L_main49
	DECFSZ     R12+0, 1
	GOTO       L_main49
	DECFSZ     R11+0, 1
	GOTO       L_main49
;Niche.c,218 :: 		UART1_Write_Text(fod);
	MOVLW      _fod+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,219 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
;Niche.c,220 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,221 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	DECFSZ     R11+0, 1
	GOTO       L_main51
	NOP
;Niche.c,223 :: 		PORTC.F5=1;
	BSF        PORTC+0, 5
;Niche.c,224 :: 		}
L_main37:
;Niche.c,225 :: 		PORTC.F5=1;
	BSF        PORTC+0, 5
;Niche.c,226 :: 		food=1;
	MOVLW      1
	MOVWF      _food+0
	MOVLW      0
	MOVWF      _food+1
;Niche.c,227 :: 		}
	GOTO       L_main52
L_main36:
;Niche.c,230 :: 		food=0;
	CLRF       _food+0
	CLRF       _food+1
;Niche.c,231 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Niche.c,232 :: 		}
L_main52:
;Niche.c,233 :: 		if(PORTC.F3==1 )    //afficher un message en cas ou le chien ne dispose pas d'eau
	BTFSS      PORTC+0, 3
	GOTO       L_main53
;Niche.c,235 :: 		if (!water)
	MOVF       _water+0, 0
	IORWF      _water+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main54
;Niche.c,238 :: 		UART1_Write_Text(AT);
	MOVLW      _AT+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,239 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	DECFSZ     R11+0, 1
	GOTO       L_main55
	NOP
;Niche.c,240 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,241 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	DECFSZ     R11+0, 1
	GOTO       L_main56
	NOP
;Niche.c,242 :: 		UART1_Write_Text(noecho);
	MOVLW      _noecho+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,243 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main57:
	DECFSZ     R13+0, 1
	GOTO       L_main57
	DECFSZ     R12+0, 1
	GOTO       L_main57
	DECFSZ     R11+0, 1
	GOTO       L_main57
	NOP
;Niche.c,244 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,245 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main58:
	DECFSZ     R13+0, 1
	GOTO       L_main58
	DECFSZ     R12+0, 1
	GOTO       L_main58
	DECFSZ     R11+0, 1
	GOTO       L_main58
;Niche.c,246 :: 		UART1_Write_Text(mode_text);
	MOVLW      _mode_text+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,247 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main59:
	DECFSZ     R13+0, 1
	GOTO       L_main59
	DECFSZ     R12+0, 1
	GOTO       L_main59
	DECFSZ     R11+0, 1
	GOTO       L_main59
;Niche.c,248 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,249 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main60:
	DECFSZ     R13+0, 1
	GOTO       L_main60
	DECFSZ     R12+0, 1
	GOTO       L_main60
	DECFSZ     R11+0, 1
	GOTO       L_main60
	NOP
;Niche.c,250 :: 		UART1_Write_Text(char_mode);
	MOVLW      _char_mode+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,251 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	DECFSZ     R11+0, 1
	GOTO       L_main61
;Niche.c,252 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,253 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main62:
	DECFSZ     R13+0, 1
	GOTO       L_main62
	DECFSZ     R12+0, 1
	GOTO       L_main62
	DECFSZ     R11+0, 1
	GOTO       L_main62
	NOP
;Niche.c,254 :: 		UART1_Write_Text(param);
	MOVLW      _param+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,255 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main63:
	DECFSZ     R13+0, 1
	GOTO       L_main63
	DECFSZ     R12+0, 1
	GOTO       L_main63
	DECFSZ     R11+0, 1
	GOTO       L_main63
;Niche.c,256 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,257 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main64:
	DECFSZ     R13+0, 1
	GOTO       L_main64
	DECFSZ     R12+0, 1
	GOTO       L_main64
	DECFSZ     R11+0, 1
	GOTO       L_main64
;Niche.c,258 :: 		UART1_Write_Text(mobile_n);
	MOVLW      _mobile_n+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,259 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main65:
	DECFSZ     R13+0, 1
	GOTO       L_main65
	DECFSZ     R12+0, 1
	GOTO       L_main65
	DECFSZ     R11+0, 1
	GOTO       L_main65
;Niche.c,260 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,261 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main66:
	DECFSZ     R13+0, 1
	GOTO       L_main66
	DECFSZ     R12+0, 1
	GOTO       L_main66
	DECFSZ     R11+0, 1
	GOTO       L_main66
;Niche.c,262 :: 		UART1_Write_Text(wat);
	MOVLW      _wat+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Niche.c,263 :: 		delay_ms(400);
	MOVLW      5
	MOVWF      R11+0
	MOVLW      15
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main67:
	DECFSZ     R13+0, 1
	GOTO       L_main67
	DECFSZ     R12+0, 1
	GOTO       L_main67
	DECFSZ     R11+0, 1
	GOTO       L_main67
;Niche.c,264 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Niche.c,265 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main68:
	DECFSZ     R13+0, 1
	GOTO       L_main68
	DECFSZ     R12+0, 1
	GOTO       L_main68
	DECFSZ     R11+0, 1
	GOTO       L_main68
	NOP
;Niche.c,267 :: 		}
L_main54:
;Niche.c,268 :: 		Lcd_out(1,1,num);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _num+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Niche.c,269 :: 		delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main69:
	DECFSZ     R13+0, 1
	GOTO       L_main69
	DECFSZ     R12+0, 1
	GOTO       L_main69
	DECFSZ     R11+0, 1
	GOTO       L_main69
;Niche.c,270 :: 		}
	GOTO       L_main70
L_main53:
;Niche.c,273 :: 		Lcd_out(1,1,"                 ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Niche+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Niche.c,274 :: 		}
L_main70:
;Niche.c,275 :: 		water = PORTC.F3;
	MOVLW      0
	BTFSC      PORTC+0, 3
	MOVLW      1
	MOVWF      _water+0
	CLRF       _water+1
;Niche.c,276 :: 		}
	GOTO       L_main7
;Niche.c,278 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
