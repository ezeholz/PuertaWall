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
      if (sec == sec2) {time = 0; rond = 1; sec = 5; sec2 = 0; next=true;}
    }
  } else {background(back);}
}

void poseunica() {
  if (next) {back = bg("/Posiciones/pos" + pose[rond] + ".jpg");next = false;}
  
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
    image(kinect.GetImage(), 0, 0, width, height);
    saveFrame("Ganadores/" + est +"/" + pose[rond] + ".jpg");
    next = true;
    if (rond != totalrond) {rond++;} else {rond = -1;}
    time=millis();
    while(time >= millis()-5000){};
    return;
    }
  }
}

void ganador() {
  if (time == 0)time = millis();
  color[] c = {color(#FF00FF),color(#3333FF),color(#00FF00),color(#FFFF00),color(#FF0000)};
  textAlign(CENTER, CENTER);
  textSize(72);
  switch (round((millis() - time)/1000)) {
  case 1 : fill(c[0]); back = bg("Ganadores/" + est +"/1.jpg"); break;
  case 2 : fill(c[1]); back = bg("Ganadores/" + est +"/2.jpg"); break;
  case 3 : fill(c[2]); back = bg("Ganadores/" + est +"/3.jpg"); break;
  case 4 : fill(c[3]); back = bg("Ganadores/" + est +"/4.jpg"); break;
  case 5 : fill(c[4]); back = bg("Ganadores/" + est +"/5.jpg"); break;
  case 6 : fill(c[0]); back = bg("Ganadores/" + est +"/1.jpg"); time = millis()-1000; break;
  }
  background(back);
  text("GANASTE!!",width/2,height/2);
}