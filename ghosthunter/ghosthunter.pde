final int INIT_GHOST_NUM = 10;
final int INIT_BULLETS = 10;

final float W = 80;  // ghost width
final float H = 60;  // ghost height
final float MAX_SPEED = 5; 

int ghostKilled;
int bullets;

PImage ghost;

PFont myFont;

float []x = new float[INIT_GHOST_NUM];
float []y = new float[INIT_GHOST_NUM];
float []speedX = new float[INIT_GHOST_NUM];
float []speedY = new float[INIT_GHOST_NUM];

void setup(){
  size(600,600);
  ghost = loadImage("ghost.png");
  
  myFont = createFont("Georgia", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);

  ghostKilled= 0;
  bullets = INIT_BULLETS;

  // initialize x,y,speedX,speedY
  for(int i=0; i < INIT_GHOST_NUM; i++){
  x[i] = random(0, width-W);
  y[i] = random(0, height-H);
  do{
    speedX[i] = random(-MAX_SPEED,MAX_SPEED);
    speedY[i] = random(-MAX_SPEED,MAX_SPEED);
  }while( abs (speedX[i]) < 1 || abs (speedY[i]) < 1);
  }
  

}

void draw(){
  background(0);
  
  // ghost
  // draw every ghost
  for(int i=0; i < INIT_GHOST_NUM; i++){
    x[i] += speedX[i];
    y[i] += speedY[i];
    
    // boundary detection
    if( x[i] > width-W || x[i] < 0){
      speedX[i] *= -1;
    }
    if( y[i] > height-H || y[i] < 0){
      speedY[i] *= -1;
    }
    
    image(ghost, x[i], y[i], W, H);
    
    // show game over
    if(bullets == 0 && ghostKilled != INIT_GHOST_NUM){
    text("GAME OVER", width/2, height/2);
    speedX[i] = 0;
    speedY[i] = 0;
    }
  }
    

  
  

  // show bullets
  noStroke();
  fill(255,0,0);
  
  for(int j=0; j < bullets; j++){
  // draw bullets
  rect(20 + j*10, 10, 5, 10);
  }
  
  
  
  
  // show number of kills
  text("Kills:"+ ghostKilled,500,16); 
    
  // ghost all killed
  if(ghostKilled == INIT_GHOST_NUM){
    setup();
  }
  
}

void keyPressed(){
  if (key == '-'){
    int i = INIT_GHOST_NUM - ghostKilled - 1;
    x[i] = -100;
    y[i] = -100;
    ghostKilled++;
  }
}

void mousePressed(){ 
  if (bullets > 0){
    for (int i=0; i < INIT_GHOST_NUM; i++){
      float d = dist(mouseX, mouseY, x[i]+W/2, y[i]+H/2);
      if (d < W/2){
        x[i] = -100;
        y[i] = -100;
        ghostKilled++;
      }
    }
    bullets--;
  }
}
