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
  if (left && right && foot && head && knee) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg");next = true; noLoop();}
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
  if (lefth && righth && head && leftk && rightk) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg"); noLoop();}
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
  if (left && right && foot && head && knee) {image(kinect.GetImage(), 0, 0, width, height); saveFrame("Ganadores/####.jpg");next = true; noLoop();}
  }
}

void desarrollador() {
  image(kinect.GetImage(), 0, 0, width, height);
  stroke(255);textSize(40);
  text(time,20,40);
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    drawSkeleton(_s);
    if (time <= millis()-5000  && _s.dwTrackingID == bod) {
        log.write("HEAD x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HEAD, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HEAD, 'y'));
        log.write("HAND RIGHT x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_RIGHT, 'y'));
        log.write("HAND LEFT x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_HAND_LEFT, 'y'));
        log.write("KNEE RIGHT x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 'y'));
        log.write("KNEE LEFT x = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 'x') + " y = " + pos(_s ,Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 'y'));
        log.close();
        time = 0;
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