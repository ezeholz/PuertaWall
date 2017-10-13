void calibracion() {
  if (pose[totalrond] != 0) {
    int[] pos1 = poses();
    boolean one = false, two = false, three = false, four = false, five = false;
    background(204,0,204);
    for (int i=0; i<bodies.size(); i++) {
      SkeletonData _s = bodies.get(i);
      background(255);
      image(kinect.GetMask(), 0, 0, width, height);
      texto();
      noStroke();
      if (!track(_s)) {sec2 = 0;} else {
        one = det(_s, pos1[0], pos1[1], pos1[2], 30);
        two = det(_s, pos1[3], pos1[4], pos1[5], 30);
        three = det(_s, pos1[6], pos1[7], pos1[8], 30);
        four = det(_s, pos1[9], pos1[10], pos1[11], 30);
        five = det(_s, pos1[12], pos1[13], pos1[14], 30);
        
        if (one) {fill(0,255,0,180);} else {fill(204,0,204,180);} ellipse(pos1[1], pos1[2], 30, 30);
        if (two) {fill(0,255,0,180);} else {fill(0,255,255,180);} ellipse(pos1[4], pos1[5], 30, 30);
        if (three) {fill(0,255,0,180);} else {fill(0,255,255,180);} ellipse(pos1[7], pos1[8], 30, 30);
        if (four) {fill(0,255,0,180);} else {fill(255,255,0,180);} ellipse(pos1[10], pos1[11], 30, 30);
        if (five) {fill(0,255,0,180);} else {fill(255,255,0,180);} ellipse(pos1[13], pos1[14], 30, 30);
        if (one && two && three && four && five) {conteo(true);} else {conteo(false);}
      }
      if (sec == sec2 && !next) {time = 0; rond = 1; sec = 10; sec2 = 0; next=true; escr = new String[5];
      } else if (sec == sec2 && next) {pose[1] = 0; time = millis(); rond = -1;}
    }
  } else {background(back);}
}

void poseunica() {
  tint(255,120);
  image(bg("/Posiciones/pos" + pose[rond] + ".jpg"),0,0,width,height);
  tint(255);
  texto();
  
  int[] pos1 = poses();
  
  // 0 3 6 9 12
  
  boolean one = false, two = false, three = false, four = false, five = false;
  
  for (int i=0; i<bodies.size (); i++) {
    SkeletonData _s = bodies.get(i);
    if (track(_s)) {
      one = det(_s, pos1[0], pos1[1], pos1[2], 30);
      two = det(_s, pos1[3], pos1[4], pos1[5], 30);
      three = det(_s, pos1[6], pos1[7], pos1[8], 30);
      four = det(_s, pos1[9], pos1[10], pos1[11], 30);
      five = det(_s, pos1[12], pos1[13], pos1[14], 30);
    }
  if (one) {fill(0,255,0,180);} else {fill(255,0,0,180);} ellipse(pos1[1], pos1[2], 30, 30);
  if (two) {fill(0,255,0,180);} else {fill(255,0,0,180);} ellipse(pos1[4], pos1[5], 30, 30);
  if (three) {fill(0,255,0,180);} else {fill(255,0,0,180);} ellipse(pos1[7], pos1[8], 30, 30);
  if (four) {fill(0,255,0,180);} else {fill(255,0,0,180);} ellipse(pos1[10], pos1[11], 30, 30);
  if (five) {fill(0,255,0,180);} else {fill(255,0,0,180);} ellipse(pos1[13], pos1[14], 30, 30);
  if (one && two && three && four && five) {
    tint(255,255);
    image(kinect.GetImage(), 0, 0, width, height);
    for (int p = millis(); p > millis()-500;) {saveFrame("Ganadores/" + est +"/" + pose[rond] + ".jpg");}
    for (int p = millis(); p > millis()-3000;) {image(bg("Ganadores/" + est +"/" + pose[rond] + ".jpg"),0,0,width,height);}
    if (rond != totalrond) {rond++;} else {
      rond = 0; next = true;
      table.set(name,millis()-time); table.sortValues();
      if (table.size() >= 6) table.remove(table.keyArray()[table.size()-1]);
    }
    return;
    }
  }
}

void desarrollador() {
  if (time < 0) {
    DrawPoints(posc);
    return;
  }
  image(kinect.GetImage(), 0, 0, width, height);
  for (int i=0; i<bodies.size (); i++) {
    textAlign(LEFT, BOTTOM);
    text(time,0,height/2);
    SkeletonData _s = bodies.get(i);
    drawSkeleton(_s);
    while (time <= millis()-5000  && _s.dwTrackingID == bod && time > 0) {
      thread("savepos");
      //save("Posiciones/pos"+ log.id +".jpg");
      for(int y = 0;y<20;y++){
        posc[y] = _s.skeletonPositions[y].copy();
      }
      time = -1;
      return;
    }
  }
}

void drawSkeleton(SkeletonData _s) {
  // Body
  DrawBone(_s, 3, 2);
  DrawBone(_s, 2, 4);
  DrawBone(_s, 2, 8);
  DrawBone(_s, 2, 1);
  DrawBone(_s, 4, 1);
  DrawBone(_s, 8, 1);
  DrawBone(_s, 1, 0);
  DrawBone(_s, 0, 12);
  DrawBone(_s, 0, 16);
  DrawBone(_s, 12, 16);

  // Left Arm
  DrawBone(_s, 4, 5);
  DrawBone(_s, 5, 6);
  DrawBone(_s, 6, 7);

  // Right Arm
  DrawBone(_s, 8, 9);
  DrawBone(_s, 9, 10);
  DrawBone(_s, 10, 11);

  // Left Leg
  DrawBone(_s, 12, 13);
  DrawBone(_s, 13, 14);
  DrawBone(_s, 14, 15);

  // Right Leg
  DrawBone(_s, 16, 17);
  DrawBone(_s, 17, 18);
  DrawBone(_s, 18, 19);
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
    noStroke();
    fill(255,0,0,180);
    ellipse(_s.skeletonPositions[_j1].x*width,_s.skeletonPositions[_j1].y*height,10,10);
    ellipse(_s.skeletonPositions[_j2].x*width,_s.skeletonPositions[_j2].y*height,10,10);
  }
}

void DrawPoints(PVector[] vector) {
  float[] points = new float[2];
  noStroke();
  for(int one = 0; one<20; one++){
    points[0] = vector[one].x*width;points[1] = vector[one].y*height;
    fill(255,0,0);
    ellipse(points[0],points[1],10,10);
    if (points[0] >= mouseX-10 && points[0] <= mouseX+10) {
      if (points[1] >= mouseY-10 && points[1] <= mouseY+10) {
        fill(0,255,0);
        ellipse(points[0],points[1],10,10);
        if (mousePressed && mouseButton == LEFT) {
            if (pose[2] != one) {
            for (int h = 0; h < 5; h++) {
              if (escr[h] != null) {pose[1] = h;} else {
                escr[h] = one + ":" + vector[one].x + ":" + vector[one].y + ":"; pose[1]++; h = 6;
              }
            }
            pose[2] = one;
            if(pose[1]>=4){
              println(escr);
              log= new Log("/Posiciones/","Poses.txt",false, true);
              pos.save("Posiciones/pos"+ log.id +".jpg");
              for (int i=0; i<5; i++) {
                log.write(escr[i]);
              }
              log.close();
              pose=new int[totalrond + 1];
              pos = createGraphics(width, height);
              time=0;
              rond=0;
              next=false;
              back = bg("/Posiciones/posini.jpg");
              thread("randomizer");
            }
          }
        }
      }
    }
  }
}

void ganador() {
  if (time == 0)time = millis();
  color[] c = {color(#FF00FF),color(#3333FF),color(#00FF00),color(#FFFF00),color(#FF0000)};
  textAlign(CENTER, CENTER);
  textSize(72);
  back = bg("/Posiciones/posini.jpg");
  background(back);
  for (int p = millis(); p > millis()-15000;) {
    for (int i = 1; i < 16;) {
      image(bg("Ganadores/" + est + "/" + i + ".jpg"), 0, 0, width, height);
      fill(c[round(random(1,6))]);
      textAlign(TOP, CENTER);
      text("GANASTE!!",width/8,0);
      int x = 0;
      for (String t : table.keyArray()){
        textAlign(TOP, LEFT);
        text(t,20,height/8*x+3);
        textAlign(TOP, RIGHT);
        text(table.get(t),width-20,height/8*x+3);
        x++;
      }
      if (i == round((millis()-p)/1000)) {i++;}
    }
  }
}