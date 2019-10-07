import peasy.*;
import processing.serial.*;

int len;
PVector hip,ankle,knee,end,angle,angOffset;

Serial myPort;  
String val;      
int[] hipA={48, 48, 48, 47, 47, 46, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 35, 34, 33, 31, 30, 28, 27, 25, 23, 22, 20, 19, 17, 16, 15, 14, 12, 11, 10, 9, 8, 7, 6, 5, 5, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 11, 13, 14, 16, 18, 21, 23, 25, 27, 30, 32, 34, 36, 38, 39, 41, 42, 43, 45, 46, 47, 47, 48, 48, 48, 49, 49, 49, 49, 49, 49, 49, 49, 48, 48, 48, 48, 48, 48};
int[] kneeA={4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 15, 16, 16, 15, 15, 14, 13, 12, 11, 10, 9, 8, 7, 5, 4, 3, 2, 1, 1, 0, 0, 0, -1, -1, -1, -1, 0, 0, 0, 1, 2, 3, 3, 4, 5, 7, 8, 9, 11, 12, 14, 16, 18, 20, 22, 24, 26, 28, 31, 33, 36, 38, 40, 42, 44, 46, 47, 47, 48, 48, 48, 47, 47, 46, 45, 44, 42, 41, 39, 37, 34, 31, 28, 25, 21, 18, 15, 12, 10, 8, 6, 5, 4, 3, 2, 2, 2, 3};
int[] ankleA={40, 39, 38, 37, 36, 36, 35, 35, 35, 35, 36, 36, 37, 38, 39, 39, 40, 40, 41, 41, 42, 42, 42, 42, 42, 43, 43, 43, 43, 44, 44, 44, 44, 45, 45, 46, 46, 46, 47, 47, 47, 47, 47, 47, 46, 46, 45, 44, 42, 40, 37, 35, 32, 28, 26, 23, 21, 19, 18, 17, 16, 16, 16, 17, 18, 20, 21, 23, 25, 26, 28, 30, 31, 32, 34, 35, 36, 37, 38, 39, 40, 40, 41, 42, 42, 43, 43, 44, 44, 45, 45, 45, 46, 46, 46, 46, 45, 45, 44, 42};
int ind;


void setup()
{
  size(1800,1000);
  hip=new PVector();
  ankle=new PVector();
  knee=new PVector();
  angle=new PVector();
  angOffset=new PVector();
  end=new PVector();
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void hipp()
{
  stroke(0,0,255);
  strokeWeight(2);
  for(int i=0;i<99;i++)
  {
    line(i*3+800,600-(hipA[i]*5)-300,(i+1)*3+800,600-(hipA[i+1])*5-300);
    
  }
  fill(0,0,255);
  circle(ind*3+800,600-(hipA[ind]*5)-300,20);
  textSize(40);
  text("Hip Curve",850,400);
  stroke(255);
  strokeWeight(2);
  noFill();
  noFill();
  rect(800,10,300,450);
}
void kneee()
{
  stroke(0,255,0);
  strokeWeight(2);
  for(int i=0;i<99;i++)
  {
    line(i*3+800+300,600-(kneeA[i]*5)-300,(i+1)*3+800+300,600-(kneeA[i+1])*5-300);
    
  }
  fill(0,255,0);
  circle(ind*3+800+300,600-(kneeA[ind]*5)-300,20);
  textSize(40);
  text("knee Curve",850+300,400);
  stroke(255);
  strokeWeight(2);
  noFill();
  noFill();
  rect(1100,10,300,450);
}
void ank()
{
  stroke(255,0,0);
  strokeWeight(2);
  for(int i=0;i<99;i++)
  {
    line(i*3+800+600,600-(ankleA[i]*5)-300,(i+1)*3+800+600,600-(ankleA[i+1])*5-300);
    
  }
  fill(255,0,0);
  circle(ind*3+800+600,600-(ankleA[ind]*5)-300,20);
  textSize(40);
  text("ankle Curve",850+600,400);
  stroke(255);
  strokeWeight(2);
  noFill();
  rect(1400,10,300,450);
}


void hist1()
{
  stroke(0,0,0);
  fill(0,0,255);
  if(ind<90){
    rect(50,900,50,(-hipA[ind]+2)*5);
    rect(110,900,50,(-hipA[ind+2]+2)*5);
    rect(170,900,50,(-hipA[ind+4]+2)*5);
    rect(230,900,50,(-hipA[ind+6]+2)*5);
    rect(290,900,50,(-hipA[ind+8]+2)*5);
    //rect(350,900,50,(-hipA[ind+9]+2)*5);
  }
  else{
    rect(50,900,50,(-hipA[ind-10]+2)*5);
    rect(110,900,50,(-hipA[ind-10+2]+2)*5);
    rect(170,900,50,(-hipA[ind+4-10]+2)*5);
    rect(230,900,50,(-hipA[ind+6-10]+2)*5);
    rect(290,900,50,(-hipA[ind+8-10]+2)*5);
    //rect(350,900,50,(-hipA[ind+9-10]+2)*5);
  }
}

void hist2()
{
  stroke(0,0,0);
  fill(0,255,0);
  if(ind<90){
    rect(50+600,900,50,(-kneeA[ind]+2)*5);
    rect(110+600,900,50,(-kneeA[ind+2]+2)*5);
    rect(170+600,900,50,(-kneeA[ind+4]+2)*5);
    rect(230+600,900,50,(-kneeA[ind+6]+2)*5);
    rect(290+600,900,50,(-kneeA[ind+8]+2)*5);
    //rect(350+600,900,50,(-hipA[ind+9-10]+2)*5);

  }
  else{
    rect(50+600,900,50,(-kneeA[ind-10]+2)*5);
    rect(110+600,900,50,(-kneeA[ind-10+2]+2)*5);
    rect(170+600,900,50,(-kneeA[ind+4-10]+2)*5);
    rect(230+600,900,50,(-kneeA[ind+6-10]+2)*5);
    rect(290+600,900,50,(-kneeA[ind+8-10]+2)*5);
    //rect(350+600,900,50,(-hipA[ind+9-10]+2)*5);
  }
}

void hist3()
{
  stroke(0,0,0);
  fill(255,0,0);
  if(ind<90){
    rect(50+1300,900,50,(-ankleA[ind]+2)*5);
    rect(110+1300,900,50,(-ankleA[ind+2]+2)*5);
    rect(170+1300,900,50,(-ankleA[ind+4]+2)*5);
    rect(230+1300,900,50,(-ankleA[ind+6]+2)*5);
    rect(290+1300,900,50,(-ankleA[ind+8]+2)*5);
    //rect(350+1300,900,50,(-hipA[ind+9-10]+2)*5);
  }
  else{
    rect(50+1300,900,50,(-ankleA[ind-10]+2)*5);
    rect(110+1300,900,50,(-ankleA[ind-10+2]+2)*5);
    rect(170+1300,900,50,(-ankleA[ind+4-10]+2)*5);
    rect(230+1300,900,50,(-ankleA[ind+6-10]+2)*5);
    rect(290+1300,900,50,(-ankleA[ind+8-10]+2)*5);
    //rect(350+1300,900,50,(-hipA[ind+9-10]+2)*5);
  }
}







void draw()
{
  background(51);
  stroke(255,51,180);
  strokeWeight(15);
  line(400,10,400,100);
  
  if(myPort.available() > 0) 
  {
    //println("HI");
    val = myPort.readString();
    println(val);
    if (val != null ) 
    {
      if(val!=""){
      //String strarray[]= val.split(" ", 1);
      for(int i=0;i<1;i++)
      {
        
        ind=Integer.parseInt(val.replaceAll("\n",""));
        ind=99-ind;
        println(ind);
        //leg(hipA[ind],kneeA[ind],ankleA[ind]);
      }}
    }
  }
    //int ind=99-mouseX/8;
    leg2(hipA[ind],kneeA[ind],ankleA[ind]);
    leg(hipA[(ind+50)%100],kneeA[(ind+50)%100],ankleA[(ind+50)%100]);
    hipp();
    kneee();
    ank();
    hist1();
    hist2();
    hist3();
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(5,5,790,520);
    fill(255);
    stroke(255);
    textSize(40);
    text("History Elements",100,600);
    textSize(40);
    text("Walk Simulation",10,50);
    //delay(1);
}

void leg(int a1,int a2,int a3)
{
  len=200;
  angOffset.set(70,0,-47);
  angle.set(a1+angOffset.x,a2+angOffset.y,360-a3+angOffset.z);
  
  angle.x=angle.x*0.0174;
  angle.y=angle.y*0.0174+angle.x;
  angle.z=angle.z*0.0174+angle.y;
  
  hip.set(400,100);
  knee.set(hip.x+cos(angle.x)*len,hip.y+sin(angle.x)*len);
  ankle.set(knee.x+cos(angle.y)*len,knee.y+sin(angle.y)*len);
  end.set(ankle.x+cos(ankle.z)*40,ankle.y+sin(angle.z)*40);
  
  stroke(0,0,255);
  strokeWeight(15);
  line(hip.x,hip.y,knee.x,knee.y);
  stroke(0,255,0);
  strokeWeight(15);
  line(knee.x,knee.y,ankle.x,ankle.y);
  stroke(255,0,0);
  strokeWeight(15);
  line(ankle.x,ankle.y,end.x,end.y);
}
void leg2(int a1,int a2,int a3)
{
  len=200;
  angOffset.set(70,0,-47);
  angle.set(a1+angOffset.x,a2+angOffset.y,360-a3+angOffset.z);
  
  angle.x=angle.x*0.0174;
  angle.y=angle.y*0.0174+angle.x;
  angle.z=angle.z*0.0174+angle.y;
  
  hip.set(400,100);
  knee.set(hip.x+cos(angle.x)*len,hip.y+sin(angle.x)*len);
  ankle.set(knee.x+cos(angle.y)*len,knee.y+sin(angle.y)*len);
  end.set(ankle.x+cos(ankle.z)*40,ankle.y+sin(angle.z)*40);
  
  stroke(100);
  strokeWeight(15);
  line(hip.x,hip.y,knee.x,knee.y);
  stroke(100);
  strokeWeight(15);
  line(knee.x,knee.y,ankle.x,ankle.y);
  stroke(100);
  strokeWeight(15);
  line(ankle.x,ankle.y,end.x,end.y);
}
