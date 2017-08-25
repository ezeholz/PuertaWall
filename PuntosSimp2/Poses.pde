void calibracion() {

}

void poseunica() {
  //if (next) {back = bg("/Posiciones/pos" + pose[rond] + ".jpg");next = false;}
  if (next) {back = bg("/Development/0686.jpg");next = false;}
  
  int[] pos1 = poses();
  println(pos1);
  
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
        pose[0] = one;
        fill(0,255,0);
        ellipse(points[0],points[1],10,10);
        if (mousePressed && mouseButton == LEFT) {
            if (pose[2] != pose[0]) {
            log.write(pose[0] + ":" + vector[one].x + ":" + vector[one].y + ":");
            pose[2] = pose[0];pose[0]=0;pose[1] = pose [1] + 1;
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
  }
}