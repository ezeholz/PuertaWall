void pose1() {
  if (next) {back = bg("/Posiciones/pos1.jpg");next = false;}
  
  int[] pos1 = new int[10];
  
  pos1[0] = width/4*3; pos1[1] = height/4; //right hand
  pos1[2] = width/4; pos1[3] = height/4; //left hand
  pos1[4] = width/4; pos1[5] = height/4*3; //left foot
  pos1[6] = width/2+20; pos1[7] = height/4; //head
  pos1[8] = width/2+20; pos1[9] = height/6*5; //knee
  
  boolean left = false, right = false, foot = false, head = false, knee = false;
  
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    if (track(_s)) {
      head = det(_s, Kinect.NUI_SKELETON_POSITION_HEAD, pos1[6], pos1[7], 30);
      right = det(_s, Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, pos1[0], pos1[1], 30);
      left = det(_s, Kinect.NUI_SKELETON_POSITION_HAND_LEFT, pos1[2], pos1[3], 30);
      foot = det(_s, Kinect.NUI_SKELETON_POSITION_FOOT_LEFT, pos1[4], pos1[5], 35);
      knee = det(_s, Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, pos1[8], pos1[9], 35);
    }
  if (left) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[2], pos1[3], 30, 30);
  if (right) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[0], pos1[1], 30, 30);
  if (foot) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[4], pos1[5], 35, 35);
  if (head) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[6], pos1[7], 30, 30);
  if (knee) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[8], pos1[9], 35, 35);
  if (left && right && foot && head && knee) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg");next = true; rond++; time=millis(); while(time >= millis()-5000){}; return;}
  }
}

void pose2() {
  if (next) {back = bg("/Posiciones/pos2.jpg");next = false;}
  
  int[] pos1 = new int[10];
  
  pos1[0] = width/2+70; pos1[1] = height/16; //right hand
  pos1[2] = width/2-50; pos1[3] = height/16; //left hand
  pos1[4] = width/2+20; pos1[5] = height/4; //head
  pos1[6] = width/2-50; pos1[7] = height/6*5+10; //left knee
  pos1[8] = width/2+70; pos1[9] = height/6*5+10; //right knee
  
  boolean lefth = false, righth = false, leftk = false, head = false, rightk = false;
  
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    if (track(_s)) {
      head = det(_s, Kinect.NUI_SKELETON_POSITION_HEAD, pos1[4], pos1[5], 30);
      righth = det(_s, Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, pos1[0], pos1[1], 30);
      lefth = det(_s, Kinect.NUI_SKELETON_POSITION_HAND_LEFT, pos1[2], pos1[3], 30);
      leftk = det(_s, Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, pos1[6], pos1[7], 35);
      rightk = det(_s, Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, pos1[8], pos1[9], 35);
    }
  if (lefth) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[2], pos1[3], 60, 60);
  if (righth) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[0], pos1[1], 60, 60);
  if (head) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[4], pos1[5], 60, 60);
  if (leftk) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[6], pos1[7], 70, 70);
  if (rightk) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[8], pos1[9], 70, 70);
  if (lefth && righth && head && leftk && rightk) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg"); next=true; rond++; time=millis(); while(time >= millis()-5000){}; return;}
  }
}



void poseunica() {
  if (next) {back = bg("/Posiciones/pos" + pose[rond] + ".jpg");next = false;}
  
  int[] pos1 = poses();
  
  // 0 3 6 9 12
  
  boolean left = false, right = false, foot = false, head = false, knee = false;
  
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    if (track(_s)) {
      head = det(_s, pos1[0], pos1[1], pos1[2], 30);
      right = det(_s, pos1[3], pos1[4], pos1[5], 30);
      left = det(_s, pos1[6], pos1[7], pos1[8], 30);
      foot = det(_s, pos1[9], pos1[10], pos1[11], 30);
      knee = det(_s, pos1[12], pos1[13], pos1[14], 30);
    }
  if (left) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[1], pos1[2], 30, 30);
  if (right) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[4], pos1[5], 30, 30);
  if (foot) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[7], pos1[8], 30, 30);
  if (head) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[10], pos1[11], 30, 30);
  if (knee) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[13], pos1[14], 30, 30);
  if (left && right && foot && head && knee) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg");next = true; rond++; time=millis(); while(time >= millis()-5000){}; return;}
  }
}

void desarrollador() {
  if (time < 0) {
    DrawPoints(posc);
    return;
  }
  image(kinect.GetImage(), 0, 0, width, height);
  stroke(255);textSize(40);
  text(time,20,40);
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    drawSkeleton(_s);
    if (time <= millis()-5000  && _s.dwTrackingID == bod && time > 0) {
      saveFrame("Development/####.jpg");
      for(int y = 0;y<20;y++){
        posc[y] = _s.skeletonPositions[y].copy();
      }
      time = -1;
    }
  }
}

void drawSkeleton(SkeletonData _s) {
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(_s.skeletonPositions[_j1].x*width, 
    _s.skeletonPositions[_j1].y*height, 
    _s.skeletonPositions[_j2].x*width, 
    _s.skeletonPositions[_j2].y*height);
    stroke(255,0,0);fill(255,0,0);
    ellipse(_s.skeletonPositions[_j1].x*width,_s.skeletonPositions[_j1].y*height,10,10);
    ellipse(_s.skeletonPositions[_j2].x*width,_s.skeletonPositions[_j2].y*height,10,10);
  }
}

void DrawPoints(PVector[] vector) {
  float[] points = new float[2];
  stroke(255,0,0);
  for(int one = 0; one<20; one++){
    points[0] = vector[one].x*width;points[1] = vector[one].y*height;
    fill(255,0,0);
    ellipse(points[0],points[1],10,10);
    if (points[0] >= mouseX-10 && points[0] <= mouseX+10) {
      if (points[1] >= mouseY-10 && points[1] <= mouseY+10) {
        switch(one) {
          case 0 : pose[0] = Kinect.NUI_SKELETON_POSITION_HEAD; break;
          case 1 : pose[0] = Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER; break;
          case 2 : pose[0] = Kinect.NUI_SKELETON_POSITION_SPINE; break;
          case 3 : pose[0] = Kinect.NUI_SKELETON_POSITION_HIP_CENTER; break;
          case 4 : pose[0] = Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT; break;
          case 5 : pose[0] = Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT; break;
          case 6 : pose[0] = Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT; break;
          case 7 : pose[0] = Kinect.NUI_SKELETON_POSITION_HAND_RIGHT; break;
          case 8 : pose[0] = Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT; break;
          case 9 : pose[0] = Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT; break;
          case 10 : pose[0] = Kinect.NUI_SKELETON_POSITION_WRIST_LEFT; break;
          case 11 : pose[0] = Kinect.NUI_SKELETON_POSITION_HAND_LEFT; break;
          case 12 : pose[0] = Kinect.NUI_SKELETON_POSITION_HIP_RIGHT; break;
          case 13 : pose[0] = Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT; break;
          case 14 : pose[0] = Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT; break;
          case 15 : pose[0] = Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT; break;
          case 16 : pose[0] = Kinect.NUI_SKELETON_POSITION_HIP_LEFT; break;
          case 17 : pose[0] = Kinect.NUI_SKELETON_POSITION_KNEE_LEFT; break;
          case 18 : pose[0] = Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT; break;
          case 19 : pose[0] = Kinect.NUI_SKELETON_POSITION_FOOT_LEFT; break;
        }
        fill(0,255,0);
        ellipse(points[0],points[1],10,10);
        if (mousePressed && mouseButton == LEFT) {
          log.write(pose[0] + ":" + vector[one].x + ":" + vector[one].y + ":");
          pose[0]=0;pose[1]++;
          if(pose[1]==5){
            log.close();
            log= new Log("/Posiciones/","Poses.txt",false);
            pose[1]=0;
            time=0;
          }
        }
      }
    }
  }
}/*
#    Proyecto con la Kinect
#          Puerta 18
#
#    Ezequiel G. Holzweissig
#    
#    www.puerta18.org.ar
*/

import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
ArrayList <SkeletonData> bodies;

PImage back;
PVector[] posc = new PVector[20];

Kinect kinect;
Log log;

//PImage back;
int rond = -1, time = 0, bod = 0;
int[] pose=new int[15];
boolean next = true;

void settings() {
    size(1024, 768);
    //fullScreen(2);
}

void setup() {
  kinect = new Kinect(this);
  log= new Log("/Posiciones/","Poses.txt",false);  //Crea un nuevo log
  smooth(3);
  bodies = new ArrayList<SkeletonData>();
  
  ellipseMode(RADIUS);
  
  if (rond == -1){pose[1] = 0;}
  back = bg("/Posiciones/posini.jpg");
  
  pose = randomizer();
  
  poses();                        // Pruebas de coso
}

void draw() {
  if (rond != -1) {
    background(back);
    image(kinect.GetMask(), 0, 0, width, height);
  } else {background(0);}
  switch (rond) {
    case -1 : desarrollador(); break;
    case 1 : pose1(); break;
    case 2 : pose2(); break;
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
  if (key == ' '  && rond == -1) {
    if (time == 0) {time = millis();} else {time = 0;}
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
  file2=split(file[0],":");
  for (int i=0;i<file2.length;i++) {
    switch(i){
    case 0:case 3:case 6:case 9:case 12:rta[i] = int(file2[i]); break;
    case 1:case 4:case 7:case 10:case 13:rta[i] = (int)float(file2[i])*width;break;
    case 2:case 5:case 8:case 11:case 14:rta[i] = (int)float(file2[i])*height;break;
    }
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