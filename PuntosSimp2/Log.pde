//Inicia clase Log
class Log {
  private PrintWriter output;  //Permite la creacion de archivos
  private String path=sketchPath();  //Variable para guardar ruta de archivo 
  private String fileName;  //Variable para el nombre del archivo
  private int id=1;  //id del archivo, se usa para renombrar
 
  //Constructor de la clase
  Log(String pth,String fileName, boolean overwrite) {
    path = path+pth;
    this.fileName=fileName;  //Asigamos nombre del archivo
    if (exist(this.fileName) && !overwrite) {  //comprobamos si ya existe el nombre del archivo con la funcion exist()
      rename();  //Si es verdadero se llama a la funcion rename()
      output= createWriter(path+this.fileName);
    }
    else {
      output= createWriter(path+this.fileName); //Si no existe, se crea sin renombrar
    }
  }
 
  //Crea una lista de los archivos existentes en el directorio actual
  private String[] listFileNames(String dir) {  //recibe como parametro la ruta actual
    File file = new File(dir);  //Crea un objeto de la clase File
    if (file.isDirectory()) {  //Comprobamos que sea un directorio y no un archivo
      String names[] = file.list();  //Cargamos la lista de archivos en el vector names[]
      return names;  //regresamos names[]
    } 
    else {
      return null;  //En caso de que sea un archivo se regresa null
    }
  }
 
  //Comprueba si el archivo ya existe
  private boolean exist(String fileName) {  //recibe como parametro el nombre del archivo
    String[] filenames = listFileNames(path);  //llama a la funcion listFileNames para obtener la lista de archivos
    for (int x=0; x<=filenames.length-1;x++) {  //Se comprueba por medio de un for la existencia del archivo, recorre todo el vector
      if (fileName.equals(filenames[x])) {  //Si el nombre de un archivo existente coincide con el que se propuso
        return true;  //Regresa verdadero
      }
    }
    return false;  //Regresa falso
  }
  
  //Renombra el archivo para no sobreescribir
  private void rename() {
    String newName=(split(fileName, ".")[0]+str(id)+"."+split(fileName, ".")[1]); //Al nombre original se le asigna un indicador haciendo uso del id
    if (exist(newName)) {  //Se comprueba si archivo con el nuevo nombre existe
      id++;  //Se incrementa id hasta que se encuentra un archivo inexistente
      rename();  //Es recursiva en caso de que siga exisitiendo el nombre
    }
    else {
      fileName=newName;  //Se regresa el nuevo nombre
      return;
    }
  }
  
  //Cierra el archivo, para que sea utilizable
  public void close() {
    output.flush();  //Vaciamos buffer de escritura
    output.close();  //Cerramos el archivo
  }
 
  //Escribe datos nuevos
  public void write(String data) {
    output.println(data);  //Concatena los datos nuevos y asigna fin de linea
  }
  
  //Regresa el nombre final del archivo
  public String getName(){
     return fileName;
  }
  
}//Termina clase