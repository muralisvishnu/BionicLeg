#include <stdio.h>
#include <io.h>
#include <unistd.h>
#include <stdlib.h>
#include "system.h"

int hip[]={49, 49, 49, 48, 48, 48, 48, 48, 48,48, 48, 48, 47, 47, 46, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 35, 34, 33, 31, 30, 28, 27, 25, 23, 22, 20, 19, 17, 16, 15, 14, 12, 11, 10, 9, 8, 7, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 11, 13, 14, 16, 18, 21, 23, 25, 27, 30, 32, 34, 36, 38, 39, 41, 42, 43, 45, 46, 47, 47, 48, 48, 48, 49, 49, 49, 49, 49};
int knee[]={ 8, 6, 5, 4, 3, 2, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 16, 16, 15, 15, 14, 13, 12, 11, 10, 9, 8, 7, 5, 4, 3, 2, 1, 1, 0, 0, 0, -1, -1, -1, -1, 0, 0, 0, 1, 2, 3, 3, 4, 5, 7, 8, 9, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 31, 33, 36, 38, 40, 42, 44, 46, 47, 47, 48, 48, 48, 47, 47, 46, 45, 44, 42, 41, 39, 37, 34, 31, 28, 25, 21, 18, 15, 12, 10};
int ankle[]={45, 46, 46, 46, 46, 45, 45, 44, 42, 40, 39, 38, 37, 36, 36, 35, 35, 35, 35, 36, 36, 37, 38, 39, 39, 40, 40, 41, 41, 42, 42, 42, 42, 42, 43, 43, 43, 43, 44, 44, 44, 44, 45, 45, 46, 46, 46, 47, 47, 47, 47, 47, 47, 46, 46, 45, 44, 42, 40, 37, 35, 32, 28, 26, 23, 21, 19, 18, 17, 16, 16, 16, 17, 18, 20, 21, 23, 25, 26, 28, 30, 31, 32, 34, 35, 36, 37, 38, 39, 40, 40, 41, 42, 42, 43, 43, 44, 44, 45, 45};

int hist[5]={0,0,0,0,0};
int sf[5]={21,23,25,27,30};
int sb[5]={20,22,23,25,27};

int n;
int indexX,indexY;

int find(int x, int min , int max)
{
	for(int i=min;i<max;i++)
	{
		if(hip[i]==x)
			return i;
	}
	return 0;
}

int f1(int m)
{
	if(find(m,0,59)!=0)
	{
		return find(m,0,59);
	}
	else if(find(m-1,0,59)!=0)
	{
		return find(m-1,0,59);
	}
	else if(find(m-2,0,59)!=0)
	{
		return find(m-2,0,59);
	}
	else
	{
		return find(m-3,0,59);
	}
}

int f2(int x)
{
	if(find(x,58,100)!=0)
	{
		return find(x,58,100);
	}
	else if(find(x+1,58,100)!=0)
	{
		return find(x+1,58,100);
	}
	else if(find(x+2,58,100)!=0)
	{
		return find(x+2,58,100);
	}
	else
	{
		return find(x+3,58,100);
	}
}

int getPos(int m)
{
	int ind=0;
	if(m>=49)
	{
		m=49;
	}
	indexX=f1(m);
	indexY=f2(m);
	//printf("%d  %d ",indexX,indexY);

	if( hist[0]>=56 && n<=2)
	{
		if(abs(hist[0]-indexX)<abs(hist[0]-indexY))
		{
			ind=indexY+5;
			ind=ind%95;
			hist[5]=hist[4];
			hist[4]=hist[3];
			hist[3]=hist[2];
			hist[2]=hist[1];
			hist[1]=hist[0];
			hist[0]=ind;
		}
		if(abs(hist[0]-indexX)>abs(hist[0]-indexY))
		{
			ind=indexY;
			ind=ind%95;
			hist[5]=hist[4];
			hist[4]=hist[3];
			hist[3]=hist[2];
			hist[2]=hist[1];
			hist[1]=hist[0];
			hist[0]=ind;
		}

	}
	else
	{
		if(abs(hist[0]-indexX)<abs(hist[0]-indexY))
		{
			ind=indexX;
			ind=ind%95;
			hist[5]=hist[4];
			hist[4]=hist[3];
			hist[3]=hist[2];
			hist[2]=hist[1];
			hist[1]=hist[0];
			hist[0]=ind;
		}
		if(abs(hist[0]-indexX)>abs(hist[0]-indexY))
		{
			ind=indexY;
			ind=ind%95;
			hist[5]=hist[4];
			hist[4]=hist[3];
			hist[3]=hist[2];
			hist[2]=hist[1];
			hist[1]=hist[0];
			hist[0]=ind;
		}

	}

	return ind;
}

int GetAngle(int pin){
	int ch=pin;
	float Value;
	int ang;

	IOWR(ADC_LTC2308_BASE, 0x01, 10);
	IOWR(ADC_LTC2308_BASE, 0x00, (ch << 1) | 0x00);
	IOWR(ADC_LTC2308_BASE, 0x00, (ch << 1) | 0x01);
	IOWR(ADC_LTC2308_BASE, 0x00, (ch << 1) | 0x00);
	usleep(1);

	while ((IORD(ADC_LTC2308_BASE,0x00) & 0x01) == 0x00);
	Value = IORD(ADC_LTC2308_BASE, 0x01);

	Value=Value/3850;
	Value=Value*180;
	ang=Value/1;
	if(ch==0)ang=ang-4;
	if(ang<=0)ang=1;
	return ang;
}

void SetMotorPosition(int a,int b){
	int x=GetAngle(2);
	int y=GetAngle(1);
	x=(x/9)*9;
	y=(y/12)*12;
	a=(a/9)*9;
	b=(b/12)*12;
	if(x<a){
		if(y<b){
			IOWR(MOTOR_BASE, 0x00, 10);
		}
		if(y>b){
			IOWR(MOTOR_BASE, 0x00, 9);
		}
		if(y==b){
			IOWR(MOTOR_BASE, 0x00, 8);
		}
	}
	if(x>a){
		if(y<b){
			IOWR(MOTOR_BASE, 0x00, 6);
		}
		if(y>b){
			IOWR(MOTOR_BASE, 0x00, 5);
		}
		if(y==b){
			IOWR(MOTOR_BASE, 0x00, 4);
		}
	}
	if(x==a){
		if(y<b){
			IOWR(MOTOR_BASE, 0x00, 2);
		}
		if(y>b){
			IOWR(MOTOR_BASE, 0x00, 1);
		}
		if(y==b){
			IOWR(MOTOR_BASE, 0x00, 0);
		}
	}
	usleep(19000);
	IOWR(MOTOR_BASE, 0x00, 0);
}


int main()
{
	int index=0;

	for(int i=0;i<100;i++){
		ankle[i]=180-47-ankle[i];
	}

	//printf("start");
	n=GetAngle(0);
	indexX=f1(n);
	indexY=f2(n);
	//initialization
	if(n>=sf[0])
	{
	    for(int i=0;i<5;i++)
	    {
	    	hist[i]=find(sf[i],57,100);
	    }
	}
	if(n<=sb[0])
	{
	    for(int i=0;i<5;i++)
	    {
	    	hist[i]=find(sb[i],0,57);
	    }
	}
	//printf("\n\nStart \n\n");
	while(1){
		n=GetAngle(0);
		index=getPos(n);
		SetMotorPosition(knee[index],ankle[index]);
		printf("%d\n",index);
		usleep(20000);
	}
	return 0;
}
