final int INIT_GHOST_NUM = 10;
final int INIT_BULLETS = 10;

final float W = 80;  // ghost width
final float H = 60;  // ghost height
final float MAX_SPEED = 5; 

int ghostKilled;

PImage ghost;

PFont myFont;

void setup(){
  size(600,600);
  ghost = loadImage("ghost.png");
  
  myFont = createFont("Georgia", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);

}

void draw(){
  background(0);

    
    // show bullets
    noStroke();
    fill(255,0,0);

    rect(20, 10, 5, 10);

    
    // show number of kills
    text("Kills:"+ ghostKilled,500,16); 
    

}

void keyPressed(){
  if (key == '-'){
    ghostKilled++;
  }
}

void mousePressed(){ 

}