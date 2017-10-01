/*
#    Proyecto con la Kinect
#          Puerta 18
#
#    Ezequiel G. Holzweissig
#    
#    www.puerta18.org.ar
*/

import processing.opengl.*;
import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
ArrayList <SkeletonData> bodies;

PImage back;

Kinect kinect;
Log log;

final int totalrond = 5;

int rond = -1, time = 0, bod = 0, sec = 5, sec2 = 0, est = 0;
int[] pose=new int[totalrond + 1];
boolean next = false;

void settings() {
    size(1024, 768, OPENGL);
    //fullScreen(OPENGL, 2);
}

void setup() {
  kinect = new Kinect(this);
  log= new Log("/Posiciones/","Poses.txt",false, false);
  smooth(3);
  bodies = new ArrayList<SkeletonData>();
  
  ellipseMode(RADIUS);
  
  back = bg("/Posiciones/posini.jpg");
  background(back);
  
  est = hour()*10000 + minute()*100 + second();
  
  thread("randomizer");
}

void draw() {
  if (rond > 0) {
    background(back);
    image(kinect.GetMask(), 0, 0, width, height);
  } else if (time != -1) {background(0);}
  switch (rond) {
    case -1 : ganador(); break;
    case 0 : calibracion(); break;
    default : poseunica(); break;
  }
}

PImage bg(String a) {
  PImage rta = loadImage(a);
  rta.resize(width,height);
  return rta;
}

void appearEvent(SkeletonData _s) 
{if (bod == 0){
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
    bod = _s.dwTrackingID;
  }
}}

void disappearEvent(SkeletonData _s) 
{if (bod != 0){
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID || 0 == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
        bod = 0;
      }
    }
  }
}}

void moveEvent(SkeletonData _b, SkeletonData _a)
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}

boolean track(SkeletonData _s) {
  int b = Kinect.NUI_SKELETON_POSITION_HEAD;
  if (_s.skeletonPositionTrackingState[b] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {return true;} else {return false;}
}

float pos(SkeletonData _s, int b, char c) {
  //a = "Kinect.NUI_SKELETON_POSITION_" + a;
  //int b = a.substring(0);
  if (c == 'x') {return _s.skeletonPositions[b].x*width;}
  if (c == 'y') {return _s.skeletonPositions[b].y*height;}
  if (c == 'z') {return _s.skeletonPositions[b].z*-8000;}
  else return Kinect.NUI_SKELETON_POSITION_NOT_TRACKED;
}

boolean det(SkeletonData _s, int s, int x, int y, int d) {
  if (pos(_s, s, 'x') >= x-d && pos(_s, s, 'x') <= x+d) {
        if (pos(_s, s, 'y') >= y-d && pos(_s, s, 'y') <= y+d) {
          return true;
        } else {return false;}
      } else {return false;}
}

void keyPressed() {
  if (key=='*' && rond == -1) {
    thread("randomizer");
    time=0;
    rond=0;
    next = false;
    est = hour()*10000 + minute()*100 + second();
    back = bg("/Posiciones/posini.jpg");
  }
}

int[] poses() {
  String[] file = loadStrings(sketchPath()+"/Posiciones/Poses" +pose[rond]+ ".txt");
  String[] file2=new String[15];
  int[] rta=new int[15];
  float[] floats=new float[16];
  for (int i=0; i < file.length; i++) {
    if (file[0] != file[i]){
      file[0] = file[0] + file[i];
    }
  }
  file2=split(file[0],":");
  for (int i=0;i<file2.length;i++) {
      floats[i] = float(file2[i]);
  }
  for (int i=0;i<floats.length;i++) {
    switch(i){
    case 0:case 3:case 6:case 9:case 12:rta[i] = int(file2[i]); break;
    case 1:case 4:case 7:case 10:case 13:rta[i] = int(floats[i]*width);break;
    case 2:case 5:case 8:case 11:case 14:rta[i] = int(floats[i]*height);break;
    }
  }
  return rta;
}

void randomizer() {
  randomSeed(hour()*10000+minute()*100+second());
  int num=1,id=log.id;
  int[] rounds = new int[totalrond+1];
  rounds[0] = 0;
  while(num!=totalrond+1){
    int prox = (int)random(id);
    boolean yes = true;
    for(int x = 0;x < num;x++) {
      if(prox == rounds[x] || prox == 0) {yes=false; x=num + 1;}
    }
    if(yes){rounds[num]=prox;num++;}
  }
  pose = rounds;
}