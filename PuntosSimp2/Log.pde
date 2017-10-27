class Log {
  private PrintWriter output;
  private String path=sketchPath();
  private String fileName;
  public int id=1;
 
  Log(String pth,String fileName, boolean overwrite, boolean create) {
    path = path+pth;
    this.fileName=fileName;
    if (exist(this.fileName) && !overwrite) {
      rename();
      if (create) {output= createWriter(path+this.fileName);}
    }
    else {
      if (create) {output= createWriter(path+this.fileName);}
    }
  }
 
  private String[] listFileNames(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      String names[] = file.list();
      return names;
    } 
    else {
      return null;
    }
  }
 
  private boolean exist(String fileName) {
    String[] filenames = listFileNames(path);
    for (int x=0; x<=filenames.length-1;x++) {
      if (fileName.equals(filenames[x])) {
        return true;
      }
    }
    return false;
  }
  
  private void rename() {
    String newName=(split(fileName, ".")[0]+str(id)+"."+split(fileName, ".")[1]);
    if (exist(newName)) {
      id++;
      rename();
    }
    else {
      fileName=newName;
      return;
    }
  }
  
  public void close() {
    output.flush();
    output.close();
  }
 
  public void write(String data) {
    output.println(data);
  }
  
  public String getName(){
     return fileName;
  }
  
}

void texto() {
  switch (rond) {
  case -1 :
    textSize(20);
    textAlign(CENTER, TOP);
    fill(255); text("Cree su propia posicion", width/2, 0); break;
  case 0 :
    textSize(20);
    textAlign(LEFT, TOP);
    fill(0); rect(0,0,420,110);
    fill(255); text("Ubique su cuerpo de acuerdo a los colores", 0, 0);
    text("Intente estar lo más cómod@ posible", 0, 20);
    fill(204,0,204,180); text("CABEZA", 0, 40);
    fill(0,255,255,180); text("MANOS", 0, 60);
    fill(255,255,0,180); text("PIES", 0, 80); 
    textAlign(LEFT, BOTTOM);
    textSize(72);
    fill(0,0,255,180); text(name, 0, height); break;
  default :
    image(loadImage("/Posiciones/pos" + pose[rond] + ".jpg"),20,20,width/8+20,height/8+20);
    textAlign(LEFT, BOTTOM);
    fill(0,0,255,180); text(round((millis()-time)/1000),0,height);
  }
}

void conteo(boolean doit) {
  if (bod != 0 && time == 0 && doit) {time = millis();} 
  else if (bod == 0) {time = 0; sec2 = 0;} if (!doit) {time = 0; sec2 = 0;}
  if (time != 0) {
    if (time+1000*sec2+1000 <= millis() && sec2<sec) {sec2++;} else if (sec2 == sec) {sec2=0;}
    textSize(72);
    textAlign(CENTER, CENTER);
    fill(0,0,255,180);
    if (bod != 0 && millis() >= time+1000*sec2 && doit) {text(sec-sec2,width/2,height/2);}
  } else {textSize(72);textAlign(CENTER, CENTER);fill(0,0,255,180);text(sec,width/2,height/2);}
}

void savemask() {
  pos.beginDraw();
  pos.background(136,6,206);
  pos.image(kinect.GetMask(), 0, 0, width, height);
  pos.endDraw();
}

void saveimg() {
  pos.beginDraw();
  pos.tint(255,255);
  pos.image(kinect.GetImage(), 0, 0, width, height);
  pos.endDraw();
  next = true;
}