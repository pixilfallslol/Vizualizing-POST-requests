int W_W = 1920;
int W_H = 1080;

String[] data;
String allText = "";

int lastReload = 0;


void setup(){
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  noStroke();
  reloadData();
  size(1920,1080,P2D);
}

void draw(){
  background(0xff00);
  reloadFile();
  drawData();
}

void reloadFile(){
  if(millis()-lastReload>=500){
    println("RELOADED FILE!");
    reloadData();
    lastReload = millis();
  }
}

void reloadData(){
  data = loadStrings("users.txt");
  if(data == null) return;
  allText = join(data,"\n");
}

void drawData(){
  if(allText == null) return;
  fill(0xff);
  textSize(48);
  float tx = W_W/2;
  float ty = W_H/2;
  text(allText,tx,ty);
}
