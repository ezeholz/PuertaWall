void pose1() {
  if (rond != 1) {back = bg[0]; rond = 1;}
  
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
  if (left && right && foot && head && knee) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg");next = true; time=millis(); while(time >= millis()-5000){}; return;}
  }
}

void pose2() {
  
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
  if (lefth && righth && head && leftk && rightk) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg"); time=millis(); while(time >= millis()-5000){}; return;}
  }
}



void poseunica() {
  if (rond != 1) {back = bg[0]; rond = 1;}
  
  String[] file = poses();
  int[] pos1 = new int[10];
  
  for (int i = 0 ; i <= file.length; i++) {
    pos1[i] = Integer.parseInt(file[i]);
  }
  
  //pos1[0] = width/4*3; pos1[1] = height/4; //right hand
  //pos1[2] = width/4; pos1[3] = height/4; //left hand
  //pos1[4] = width/4; pos1[5] = height/4*3; //left foot
  //pos1[6] = width/2+20; pos1[7] = height/4; //head
  //pos1[8] = width/2+20; pos1[9] = height/6*5; //knee
  
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
  if (left && right && foot && head && knee) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg");next = true; time=millis(); while(time >= millis()-5000){}; return;}
  }
}

void desarrollador() {
  float[] points = new float[40];
  image(kinect.GetImage(), 0, 0, width, height);
  stroke(255);textSize(40);
  text(time,20,40);
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    drawSkeleton(_s);
    if (time <= millis()-5000  && _s.dwTrackingID == bod && time > 0) {
      points[0] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HEAD, 'x'); points[1] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HEAD, 'y');                                //CENTER
      points[2] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 'x'); points[3] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 'y');
      points[4] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SPINE, 'x'); points[5] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SPINE, 'y');
      points[6] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 'x'); points[7] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 'y');
      points[8] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 'x'); points[9] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 'y');            //RIGHT ARM
      points[10] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 'x'); points[11] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 'y');
      points[12] = pos(_s ,Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 'x'); points[13] = pos(_s ,Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 'y');
      points[14] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'x'); points[15] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'y');
      points[16] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 'x'); points[17] = pos(_s ,Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 'y');            //LEFT ARM
      points[18] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 'x'); points[19] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 'y');
      points[20] = pos(_s ,Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 'x'); points[21] = pos(_s ,Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 'y');
      points[22] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 'x'); points[23] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 'y');
      points[24] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 'x'); points[25] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 'y');                    //RIGHT FOOT
      points[26] = pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 'x'); points[27] = pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 'y');
      points[28] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 'x'); points[29] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 'y');
      points[30] = pos(_s ,Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT, 'x'); points[31] = pos(_s ,Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT, 'y');
      points[32] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 'x'); points[33] = pos(_s ,Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 'y');                      //LEFT FOOT
      points[34] = pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 'x'); points[35] = pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 'y');
      points[36] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 'x'); points[37] = pos(_s ,Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 'y');
      points[38] = pos(_s ,Kinect.NUI_SKELETON_POSITION_FOOT_LEFT, 'x'); points[39] = pos(_s ,Kinect.NUI_SKELETON_POSITION_FOOT_LEFT, 'y');
        //log.write(str(Kinect.NUI_SKELETON_POSITION_HEAD) + " x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HEAD, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HEAD, 'y'));
        //log.write(str(Kinect.NUI_SKELETON_POSITION_HAND_RIGHT) + " x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'y'));
        //log.write(str(Kinect.NUI_SKELETON_POSITION_HAND_LEFT) + " x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 'y'));
        //log.write(str(Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT) + " x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 'y'));
        //log.write(str(Kinect.NUI_SKELETON_POSITION_KNEE_LEFT) + " x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 'y'));
        //log.close();
      time = -1;
    }
    if (time < 0) {
    DrawPoints(points);
    }
  }
}

void drawSkeleton(SkeletonData _s) 
{
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

void DrawPoints(float[] points) {
  stroke(255,0,0);
  for(int one = 0; one<40; one = one + 2){
    ellipse(points[one],points[one+1],10,10);
    if (points[one] >= mouseX-10 && points[one] <= mouseX+10) {
      if (points[one+1] >= mouseY-10 && points[one+1] <= mouseY+10) {
        pose[0] = int(points[one]); pose[1] = int(points[one+1]);
        switch(one) {
          case 0 : pose[2] = Kinect.NUI_SKELETON_POSITION_HEAD; break;
          case 2 : pose[2] = Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER; break;
          case 4 : pose[2] = Kinect.NUI_SKELETON_POSITION_SPINE; break;
          case 6 : pose[2] = Kinect.NUI_SKELETON_POSITION_HIP_CENTER; break;
          case 8 : pose[2] = Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT; break;
          case 10 : pose[2] = Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT; break;
          case 12 : pose[2] = Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT; break;
          case 14 : pose[2] = Kinect.NUI_SKELETON_POSITION_HAND_RIGHT; break;
          case 16 : pose[2] = Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT; break;
          case 18 : pose[2] = Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT; break;
          case 20 : pose[2] = Kinect.NUI_SKELETON_POSITION_WRIST_LEFT; break;
          case 22 : pose[2] = Kinect.NUI_SKELETON_POSITION_HAND_LEFT; break;
          case 24 : pose[2] = Kinect.NUI_SKELETON_POSITION_HIP_RIGHT; break;
          case 26 : pose[2] = Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT; break;
          case 28 : pose[2] = Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT; break;
          case 30 : pose[2] = Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT; break;
          case 32 : pose[2] = Kinect.NUI_SKELETON_POSITION_HIP_LEFT; break;
          case 34 : pose[2] = Kinect.NUI_SKELETON_POSITION_KNEE_LEFT; break;
          case 36 : pose[2] = Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT; break;
          case 38 : pose[2] = Kinect.NUI_SKELETON_POSITION_FOOT_LEFT; break;
        }
      }
    }
  }
}