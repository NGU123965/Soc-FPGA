//Pingpong_template_v3_summer2021.c
//8-15-2021
//HUST Summer 2021
//Version 3
//This is a template for Lab #6 Pingpong Game with Zybo
//you are free to revise it to make your own solution.
//you are also free to write your own code from scratch
//lab6pingpong_jjs2020
//Use typedef
//check player actions in the timer overflow checking loop
#include "xparameters.h"
#include "xgpio.h"
#include "led_ip.h"
// Include scutimer header file
#include "XScuTimer.h"
//====================================================
XScuTimer Timer;		/* Cortex A9 SCU Private Timer Instance */

#define ONE_TENTH 32500000 // half of the CPU clock speed/10

typedef enum {OVER, START} GameStatus;
typedef enum {LEFT, RIGHT} Direction;

typedef enum {LATEHIT, EARLYHIT, HIT, RESET, CONTINUOUS} PlayStatus;

//push buttons
#define RESETBUTTON 0b0100
#define STARTBUTTON 0b0010
#define LEFTPADDLE  0b1000
#define RIGHTPADDLE 0b0001
//ball at serve
#define LEFT_SERVE 0b1000
#define RIGHT_SERVE 0b0001
#define NO_BALL 0b0000

void setTimer(void);
void RightPlay(PlayStatus *RightPlayerResult);
void LeftPlay(PlayStatus *LeftPlayerResult);

int psb_check, dip_check, Status;
XGpio dip, push;
// PS Timer related definitions
XScuTimer_Config *ConfigPtr;
XScuTimer *TimerInstancePtr = &Timer;

int scoreright, scoreleft;

int main (void)
{
	unsigned int i;
	PlayStatus LeftPlayerResult, RightPlayerResult;
	GameStatus Game;
	Direction BallDirection;
//configure push buttons and slide switches


// Initialize the timer

   xil_printf("-- Start of the Ping Pong Program --\r\n");
   scoreright = 0; scoreleft = 0;
   xil_printf("Score Left = %d   Score Right = %d\r\n", scoreright, scoreleft);
   BallDirection = RIGHT; Game=OVER;
   //turn off LEDs
   LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, NO_BALL);

   while (1)
   {
// check reset or start buttons
	  while(1) {
	  psb_check = XGpio_DiscreteRead(&push, 1);
	  switch (psb_check) {
	  	  case RESETBUTTON:	//reset game
	    	 xil_printf("\n\rNew Game - Scores Reset\r\n");
	    	 Game=OVER;
	    	 scoreright = 0; scoreleft = 0;
	    	 xil_printf("Score Left = %d   Score Right = %d\r\n", scoreright, scoreleft);
//turn on all LEDs
	    	 LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, ~NO_BALL);
	    	 for(i=0;i<30000000;i++);
	    	 while(psb_check == RESETBUTTON)
			  psb_check = XGpio_DiscreteRead(&push, 1);

//turn off all LEDs
	    	 LED_IP_mWriteReg(XPAR_LED_IP_0_S_AXI_BASEADDR, 0, NO_BALL);
	    	 for(i=0;i<30000000;i++);
	    	 break;
	  	  case STARTBUTTON:
			  Game=START;	//start game
			  if(BallDirection==RIGHT) BallDirection=LEFT; else BallDirection = RIGHT;
			  break;
	  	  default: Game=OVER; break;
	  }
	  if(Game==START) break;
   } //end  inner while(1) to exit when Game == START
//play pingong game
	  	  while(Game==START)
	  	  {
	  			if(BallDirection==RIGHT) {
	  				RightPlayerResult = CONTINUOUS;
	  				RightPlay(& RightPlayerResult);
	  				if(RightPlayerResult==HIT) BallDirection=LEFT;
	  				else Game=OVER;
	  			}
	  			else {
	  				LeftPlayerResult = CONTINUOUS;
	  				LeftPlay(& LeftPlayerResult);
	  				if(LeftPlayerResult==HIT) BallDirection=RIGHT;
	  				else Game=OVER;
	  			}
	  	  }//end while(Game==START)

	  //update score after the game
	  switch(BallDirection) {
	  case RIGHT:
		  scoreleft++;
	//display how the game was played on Terminal
		  break;
	  case LEFT:
		  scoreright++;
   //display on Terminal how the game was lost.
	  }
	 xil_printf(" Left Score = %d   Right Score = %d\r\n", scoreleft, scoreright);
   }	//while(1)
} //main()

//ball moves to the right
void RightPlay(PlayStatus *RightPlayerStatus)
{
char ball;
	ball = LEFT_SERVE;
	while(*RightPlayerStatus == CONTINUOUS)
	{
//The ball moves from left to right

	}//end while(*RightPlayerStatus == CONTINUOUS)
}//end RightPlay()

//ball moves to the left
//symmetric to RightPlay()
void LeftPlay(PlayStatus *LeftPlayerStatus)
{
char ball;
	ball = RIGHT_SERVE;
	while(*	LeftPlayerStatus == CONTINUOUS)
	{

	}//end while(*LeftPlayerStatus == CONTINUOUS)

}//end LeftPlay(

void setTimer(void){
  // Read dip switch values

 // Load timer with delay in multiple of ONE_TENTH
//start timer
}//end setTimer(void)

