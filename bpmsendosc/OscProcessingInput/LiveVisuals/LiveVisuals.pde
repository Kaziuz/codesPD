import oscP5.*;
import netP5.*;
int pd;

Linea linea;
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup()
{
  size(1280, 800);
  linea = new Linea(int(random(width/2)), int(random(height/2)));
  oscP5 = new OscP5(this, 8000);
  //  dirección IP computadora
  myRemoteLocation = new NetAddress("192.168.1.1", 8000);
  smooth();
  frameRate(30);
}

void draw()
{
  background(0);
  linea.dibujar();
  linea.caminar(pd);
  println("pd: " + pd);
}

void oscEvent(OscMessage theOscMessage)
{
  if (theOscMessage.checkAddrPattern("/processing")==true) {
    int firstValue = theOscMessage.get(0).intValue();
    pd = firstValue;

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

