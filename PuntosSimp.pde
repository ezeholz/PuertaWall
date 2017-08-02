import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
ArrayList <SkeletonData> bodies;

PImage[] bg = new PImage[9];
PImage back;

Kinect kinect;

void setup() {
  fullScreen(2);
  //size(640, 480);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
  
  bg[0] = loadImage("pos1.jpg");
  bg[0].resize(width, height);
  
  for (int i = 1; i++ == 9; i++) {
    bg[i] = loadImage("pos" + i + ".jpg");
    bg[i].resize(width, height);
  }
  back = bg[0];
}

void draw() {
  background(bg[0]);
  image(kinect.GetMask(), 0, 0, width, height);
  pose1();
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

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
}

void pose1() {
  if (back != bg[1]) {back = bg[1];}
  
  int[] pos1 = new int[6];
  
  pos1[0] = width/4*3; pos1[1] = height/4; //right hand
  pos1[2] = width/4; pos1[3] = height/4; //left hand
  pos1[4] = width/4; pos1[5] = height/4*3; //left foot
  
  boolean left = false, right = false, foot = false;
  
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    if (track(_s)) {
      right = det(_s, Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, pos1[0], pos1[1], 30);
      left = det(_s, Kinect.NUI_SKELETON_POSITION_HAND_LEFT, pos1[2], pos1[3], 30);
      foot = det(_s, Kinect.NUI_SKELETON_POSITION_FOOT_LEFT, pos1[4], pos1[5], 35);
    }
  if (left) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[2], pos1[3], 60, 60);
  if (right) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[0], pos1[1], 60, 60);
  if (foot) {fill(0,255,0);} else {fill(255,0,0);} ellipse(pos1[4], pos1[5], 70, 70);
  if (left && right && foot) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg"); noLoop();}
  }
}