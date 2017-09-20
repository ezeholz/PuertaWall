class Log {
  private PrintWriter output;
  private String path=sketchPath();
  private String fileName;
  private int id=1;
 
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
  textSize(20);
  textAlign(CENTER, BOTTOM);
  if (bod == 0) {fill(255,0,0); text("NO ESTA TRACKEANDO", width/2, height);}
  else {fill(0,255,0); text("TRACKEANDO", width/2, height);}
}

void conteo() {
  if (bod != 0) {time = millis();} else {time = 0;}
  if (time != 0) {
    if (time+1000*sec2+1000 <= millis() && sec2<sec) {sec2++;} else if (sec2 == sec) {sec2=0;}
    textSize(72);
    textAlign(CENTER, CENTER);
    if (bod != 0 && millis() >= time+1000*sec2) {text(sec-sec2,width/2,height/2);}
  } else {textSize(72);textAlign(CENTER, CENTER);text(sec-sec2+1,width/2,height/2);}
}

void savepos() {
  pos.beginDraw();
  pos.background(255);
  pos.image(kinect.GetMask(), 0, 0, width, height);
  pos.endDraw();
}