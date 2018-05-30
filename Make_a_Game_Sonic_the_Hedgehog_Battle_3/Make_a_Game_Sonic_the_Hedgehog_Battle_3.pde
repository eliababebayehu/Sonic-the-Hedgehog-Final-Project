//Make a Game Assignment: Sonic the Hedgehog: Battle 3.
//NAME: Eliab Abebayehu


//Declare your player location variables.
int x, y;

//You can add your own pictures - this is where you declare them.
PImage SonictheHedgehogModern; //Sprite Character.
PImage DrEggmanModern; //Sprite for the goal.

//Variable to hold the score.
int score;

//Variables for the location of the goal.
int goalX, goalY;


//Make a level variable for keeping track of what level you are on.
int level;
int time;
int frames;

void setup() {
  size(800, 800);

  //This creates a font of size 50. 
  textFont(createFont("Consolas", 50));
  fill(255);


  //If you add pictures, assign them here.   
  SonictheHedgehogModern = loadImage("SonictheHedgehogModern.gif");
  DrEggmanModern = loadImage("DrEggmanModern.gif");

  //Initializing (giving a starting value to) our location and score variables.
  x = 200; //Player starts at 200,50
  y = 50;
  score = 0;
  goalX = int(random(width)); //random location for the goal
  goalY = int(random(height));

  //imageMode() changes where the "location" of the image is measured from.  
  imageMode(CENTER);

  level =1;
  time=100;
  frames=1;
}

void draw() {


  if (level ==1) {
    //Black background. Feel free to change the colour or replace this with an image.
    background(0);
    
    
    //Timer for level 1:
    frames++;
    if(frames>60){
      frames =0;
      time--;
    }




    //If you use images, this is where you can draw them.


    //Sprite for Character.
    image(SonictheHedgehogModern, x, y, 100, 100);


    //Sprite for the goal.
    image(DrEggmanModern, goalX, goalY, 100, 100);

    //Change the fill colour to white.
    fill(255);  

    //Draw the score onto the screen.
    text("Score: 0" +score, 0, 40);
    
    //Draw the timer onto the screen.
    text("Time: 0" +time, 300, 40);

    //Score the goal.
    if (abs(x-goalX)<100 && abs(y-goalY)<100) {
      //Hitbox is 100 x 100 by default.

      //Get a point.
      score +=100;

      //Move the goal to a new random location.
      goalX = int(random(width));
      goalY = int(random(height));
  }
  


  //Boundary Conditions
  //This is what happens if your player leaves the screen. 

  if ( x > 850) { //Right hand side.
    x=-50;
  }
  if (x < -60) { //Left
    x=850;
  }
  if (y > 850) { //Bottom
    y = -50;
  }
  if (y< -60) { //Top
    y=850;
  }

if(keyPressed){
  
  
  //The following code makes the character move.
  //This code must go into either void keyPressed(){OR if(keyPressed){}within draw(){}
  if(keyCode == RIGHT || key == 'd' || key =='D'){
    x=x+15;
    score-=1;
  }
  
  if(keyCode==LEFT){
    x=x-15;
    score-=1;
  }
  
  if(keyCode==UP){
    y=y-15;
    score-=1;
  }
  
  if(keyCode==DOWN){
    y=y+15;
    score-=1;
  }
  
  
  //Game over if score <0 or time<0.
  if(score<0||time<0){
    
    level=1;
  }
 }
}


if(level==0){
  clear();
  textSize(70);
  text("You won", 100, 400);
  textSize(40);
  text("Press r to restart!", 150, 590);
  text("You score" + score + "points.", 50, 480);
  
  
  
  //Reset the game by pressing r.
  if(key=='r'|| key=='R'){
    setup();
  }
 }
}
  

void keyPressed() {
}  