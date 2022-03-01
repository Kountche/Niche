
  // LCD module connections
  sbit LCD_RS at RD1_bit;
  sbit LCD_EN at RD2_bit;
  sbit LCD_D4 at RD3_bit;
  sbit LCD_D5 at RD4_bit;
  sbit LCD_D6 at RD5_bit;
  sbit LCD_D7 at RD6_bit;

  sbit LCD_RS_Direction at TRISD1_bit;
  sbit LCD_EN_Direction at TRISD2_bit;
  sbit LCD_D4_Direction at TRISD3_bit;
  sbit LCD_D5_Direction at TRISD4_bit;
  sbit LCD_D6_Direction at TRISD5_bit;
  sbit LCD_D7_Direction at TRISD6_bit;
  // End LCD module connections

  //SMS
  char AT[]="AT";   // To initialize mode
  char noecho[]="ATE0";   // To stop echo
  char mode_text[]="AT+CMGF=1";   // to set text mode
  char char_mode[]="AT+CSCS=GSM";   // to set character mode
  char param[]="AT+CSMP=17,167,0,0";   // set the parameter of character
  char mobile_n[]="21695128049";   //use to set receinpent number and mesg
  char terminator=0x1A;     // chartacter form of control + z terminator character
  char wat[]=  "I need water";
  char ala[]=  "Alarm Someone is here";
  char fod[]=   "food please";
  void sms(char mesg[])
  {

              UART1_Write_Text(AT);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(noecho);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mesg);
              delay_ms(400);
              UART1_Write(13);
              delay_ms(100);


  }

  int adc;
  int adc1;
  unsigned int adc2;
  unsigned int adc3;
  char lcd[15];
  char num[]="Need Water";
  char num1[]="temp";
  char num2[]="C";
  char aaa[]="   ";
  char jihed[5];
  int a,b;
  int food=0;
  int water =0;
  int alarm =0;

  void interrupt() //Arreter le systeme d'alarme
  {

      INTCON.INTF = 0;
      portc.f0=0;
      a=0;
      b=0;
      INTCON.INTF = 0;
  }




  void main()
  {


      Lcd_Init();
      Lcd_Cmd(_LCD_CURSOR_OFF);
      Lcd_Cmd(_LCD_CLEAR);
      delay_ms(100);

      UART1_INIT(9600);
      TRISB=0x00000001;
      TRISC=0x10001110;
      TRISC.F2=1;
      TRISB.F0=1;

      INTCON.INTE=1;
      INTCON.GIE=1;
      intcon=0x10010000;
      PORTC.F5=0;
      PORTC.F0=0;
      a=0;
      b=0;
      while(1)
      {

          //Lcd_Cmd(_LCD_CLEAR);
          adc = 0.49*ADC_Read(0);
          adc2= (unsigned int)adc ;

          WordToStr(adc, lcd);
          Lcd_out(2,1,num1);
          Lcd_out(2,5,lcd);
          Lcd_out(2,10,num2);
          Delay_ms(100);





          if(1)
          {
              adc1=ADC_Read(1);
              adc3= (unsigned int)adc1 ;

              if(adc1>600)    //s'il y a un aboiements
              {
                  a++;b=0;
              }
              else
              {
                  b++;
              }
              if(b>40)//||(portb.f0==1))
              {
                  a=0;alarm =0;
              }
              if(a>50  )
              {
               if(a==51)
               {

              UART1_Write_Text(AT);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(noecho);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mode_text);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(char_mode);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(param);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mobile_n);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(ala);
              delay_ms(400);
              UART1_Write(13);
              delay_ms(100);

               }


                  portc.f0=1;delay_ms(4000);portc.f0=0;a=52;alarm=1;

              }
          }
          else
          {
              a=0;b=0;portc.f0=0;
          }



          if(PORTC.F2==1)        //  Rotation du moteur de remplissage de la nourriture
          {
              PORTB = 0b00000110;
              Delay_ms(50);
              PORTB = 0b00001100;
              Delay_ms(200);
              PORTB = 0b00011000;
              Delay_ms(50);
              PORTB = 0b00010010;
          }
          if(PORTC.F4==1) //Alerte Manque de Nourriture dans le reservoire
          {
              if(food==0){

              UART1_Write_Text(AT);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(noecho);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mode_text);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(char_mode);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(param);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mobile_n);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(fod);
              delay_ms(400);
              UART1_Write(13);
              delay_ms(100);

                PORTC.F5=1;
          }
          PORTC.F5=1;
          food=1;
          }
          else
          {
           food=0;
           PORTC.F5=0;
          }
          if(PORTC.F3==1 )    //afficher un message en cas ou le chien ne dispose pas d'eau
          {
              if (!water)
              {

              UART1_Write_Text(AT);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(noecho);
              delay_ms(100);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mode_text);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(char_mode);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(100);
              UART1_Write_Text(param);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(mobile_n);
              delay_ms(200);
              UART1_Write(13);
              delay_ms(200);
              UART1_Write_Text(wat);
              delay_ms(400);
              UART1_Write(13);
              delay_ms(100);

              }
              Lcd_out(1,1,num);
              delay_ms(150);
              }
          else
              {
              Lcd_out(1,1,"                 ");
              }
          water = PORTC.F3;
      }

  }