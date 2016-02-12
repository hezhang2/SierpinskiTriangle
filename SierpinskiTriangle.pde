private int theLen,preLen,theMin,preMin;
private float theY,preY,theX,preX;
private String direct;
public void setup(){
  noStroke();
  size(400,400);
//  noFill();
  fill(50);

  theLen=height;
  theY=height;
  theX=0;
  theMin=40;
  direct="rest";
}
public void draw(){
  background(200);
  sierpinski(theX,theY,theLen);
  println();
  zoom(direct);
}
public void keyReleased(){
  preLen=theLen;
  preMin=theMin;
  preY=theY;
  preX=theX;
  if(key=='a'){
    direct="left";
  }
  if(key=='d'){
    direct="right";
  }
}
public void sierpinski(float x, float y, float len) {
  if(len<=theMin){
    triangle(x,y,x+len,y,x+len/2,y-len);
  }else{
    sierpinski(x,y,len/2);
    sierpinski(x+len/2,y,len/2);
    sierpinski(x+len/4,y-len/2,len/2);
  }
}
public void zoom(String mode){
  if(mode=="left"){
    if(theLen<preLen*2&&theMin<640){
      theLen+=preLen/(height/10);
      theMin+=preMin/(height/10);
    }
  }else if(mode=="right"){
    if(theLen>preLen/2&&theMin>40){
      theLen-=preLen/(height/10);
      theMin-=preMin/(height/10);
    }
  }else{
  }
}