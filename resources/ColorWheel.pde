import java.util.*;
int[][] col = {{255,0,0},//red
               {255,69,0},//red orange
               {255,102,0},//orange
               {255,174,66},//yellow orange
               {255,255,0},//yellow
               {173,255,47},//yellow green
               {0,255,0},//green
               {13,152,186},//blue green
               {0,0,255},//blue
               {111,0,255},//blue purple
               {143,0,255},//purple
               {199,21,133}//red purple
              };
int[] colorlist;
int frameW = 800;
int frameH = 600;
int boxW = 600;
int boxH = 500;
int[] count;
char mode = ' ';
int tries=0;

Ball[] list = new Ball[(int)(100*Math.random()+50)];

class Ball{
 int x,y,r,vx,vy,index;
  color fillcolor;
  Ball(){
    x=(int)(boxW*Math.random()+(frameW-boxW)/2);
    y=(int)(boxH*Math.random());
    r = (int)(10*Math.random()+10);
    vx = (int)(3*Math.random()+1);
    vy = (int)(3*Math.random()+1);
    index = (int)(12*Math.random());
    fillcolor = color(col[index][0],col[index][1],col[index][2]);
  }
  void drawBall(){
    fill(fillcolor);
    stroke(fillcolor);
    ellipse(x,y,r,r);
    if(vx+x>(frameW+boxW)/2 || vx+x<(frameW-boxW)/2){//horizontal collision
      vx=vx*-1;
    }
    if(vy+y>boxH || vy+y<0 ){//vertical collision
      vy=vy*-1;
    }
    x = x+vx;
    y = y+vy;
  }
}
void setup(){
  size(frameW,frameH);
  mode='p';
  for(int i = 0; i<list.length; i++){
    list[i] = new Ball();
  }
}

void reset(){
  mode='p';
  list = new Ball[(int)(100*Math.random()+50)];
  for(int i = 0; i<list.length; i++){
    list[i] = new Ball();
  }
}

void draw(){
  //background(255,255,255);
  int index = (int)(mouseX/(800/12));
  if(index<0){
    index=0;
  }
  if(index>11){
    index=11;
  }
  background(color(col[index][0],col[index][1],col[index][2]));
  for(int i = 0; i<list.length; i++){
    list[i].drawBall();
  }
  
  
  
  fill(0,0,0);
  //fill(color(col[index][0],col[index][1],col[index][2]));
  textSize(36); 
  textAlign(CENTER,CENTER);
  switch(mode){
    case 'p': text("Guess the most common color!",frameW/2,(frameH+boxH)/2); break;
    case 'w': 
      textSize(24);
      text("Good job! It took you " + tries + " tries.\nClick to start a new game",frameW/2,(frameH+boxH)/2);
     text(count[ (int)(mouseX/(frameW/12))],100,100);  
      break;
    case 'l': 
      textSize(24);
      text("Sorry that's incorrect. \n Click to start a new game",frameW/2,(frameH+boxH)/2);
      
      break;
      
  }
}

void mousePressed(){
  if(mode=='p'){
    int guess = (int)(mouseX/(frameW/12));
    count = new int[12];
    for(int i = 0; i<list.length; i++){
      count[list[i].index]++;
    }
    tries++;
    mode='w';
    for(int i = 0; i<count.length; i++){
      if(count[guess]<count[i]){
        mode='l';
        break;
      }
    }
  } else {
    if(mode=='w'){
      tries=0;
    }
    reset();
    
  }
}

