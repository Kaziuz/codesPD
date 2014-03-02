import oscP5.*;
import netP5.*;

int   pdInt;
float noise = random(20);

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() 
{
  size(400, 400);
  frameRate(75);
  smooth();
  oscP5 = new OscP5(this, 8000);
  //  dirección IP computadora
  myRemoteLocation = new NetAddress("192.168.1.1", 8000);
  smooth();
}

void draw() 
{
  background(0); 
  noFill();
  strokeWeight(2);

  println("PUREDATA:" + pdInt);

  if ( pdInt == 1 )
  {
    background(255);
    fill(255, 0, 0);
    ellipse(width/2, height/2, 100, 100);
  }   

  if ( pdInt == 2 )
  {
    background(255, 255, 0);
    fill(255, 25, 100);
    rect(width/2, height/2, 100, 100);
  }   

  if ( pdInt == 3 )
  {
    background(0, 0, 56);
    fill(255, 0, 0);
    for (int i = 0; i < width; i += 10)
    {
      stroke(2, 255, 12);  
      line(i, 0, i, height);
    }
  }
  
    if ( pdInt == 4 )
  {
    background(0, 255, 56);
    fill(255, 0, 0);
    for (int i = 0; i < width; i += 10)
    {
      stroke(2, 255, 12);  
      ellipse(i, i, random(78), random(66));
    }
  }
}

void oscEvent(OscMessage theOscMessage)
{
  if (theOscMessage.checkAddrPattern("/metronomo")==true) {
    int firstValue = theOscMessage.get(0).intValue();
    pdInt = firstValue;

    /*  NO BORRAR
     float secondValue = theOscMessage.get(1).floatValue();
     String thirdValue = theOscMessage.get(2).stringValue();
     print("### received an osc message /test with typetag ifs.");
     println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
     */
    return;
    //}
  } 
  println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}

