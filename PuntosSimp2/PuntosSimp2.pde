// Pasar el string de lectura a int lectura

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
ArrayList <SkeletonData> bodies;

PImage[] bg = new PImage[10];


Kinect kinect;
Log log;

PImage back;
int rond = -1, time = 0, bod = 0;
int[] pose=new int[15];
boolean next = false;

void settings() {
    size(1024, 768);
    //fullScreen(2);
}

void setup() {
  //kinect = new Kinect(this);
  log= new Log("/Posiciones/","Poses.txt",false);  //Crea un nuevo log
  smooth(3);
  bodies = new ArrayList<SkeletonData>();
  
  ellipseMode(RADIUS);
  
  bg[0] = loadImage("Posiciones/posini.jpg");
  bg[0].resize(width, height);
  
  back = bg[0];
  if (rond == -1){pose[3] = 0;}
  
  for(int i = 1; i < 3; i++) {
    bg[i] = loadImage("Posiciones/pos" + i + ".jpg");
    bg[i].resize(width, height); background(0,0,255);
  }
  //pose = randomizer();
  
  poses();                        // Pruebas de coso
  //while(true){poseunica();}
}

void drawer() {
  if (rond != -1) {
    background(bg[rond]);
    image(kinect.GetMask(), 0, 0, width, height);
  } else {background(0);}
  switch (rond) {
    case -1 : desarrollador(); break;
    case 0 : case 1 : pose1(); break;
    case 2 : pose2(); break;
  }
  //for (int i=0; i<bodies.size (); i++) {
  //  SkeletonData _s = bodies.get(i);
  //  fill(0);
  //  println("X = " + pos(_s, Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'x') + " & Y = " + pos(_s, Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'y'));
  //}
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
  if (key == ENTER) {loop();}
  if (key == ' '  && rond == -1) {
    if (time == 0) {time = millis();} else {time = 0;}
  }
}

void mouseClicked() {
  if(pose[0] >= mouseX-10 && pose[0] <= mouseX+10) {
    if (pose[1] >= mouseY-10 && pose[1] <= mouseY+10) {
      log.write(pose[2] + "," + pose[0] + "," + pose[1] + ",");
      pose[3]++;pose[0]=0;pose[1]=0;pose[2]=0;
      if(pose[3]==5){
        log.close();
        log= new Log("/Posiciones/","Poses.txt",false);
        pose[3]=0;
        time=0;
      }
    }
  }
}

int[] poses() {
  String[] file = loadStrings(sketchPath()+"/Posiciones/Poses" +pose[rond]+ ".txt");
  String[] file2=new String[15];
  int[] rta=new int[15];
  for (int i=0; i < file.length; i++) {
    if (file[0] != file[i]){
      file[0] = file[0] + file[i];
    }
  }
  file2=split(file[0],",");
  for (int i=0;i<file2.length;i++) {
    rta[i] = Integer.parseInt(file2[i]);
  }
  return rta;
}

int[] randomizer() {
  randomSeed(hour()*10000+minute()*100+second());
  int num=0,id=log.id;
  int[] rounds = new int[3];
  while(num!=3){
    int next = (int)random(id + 1);
    boolean yes = true;
    for(int x = 0;x < num;x++) {
      if(next == rounds[x]) {yes=false;x=num + 1;}
    }
    if(yes){rounds[num]=next;num++;}
  }
  return rounds;
}