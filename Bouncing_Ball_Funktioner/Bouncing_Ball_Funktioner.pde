int BoxLength = 500;
int BoxChange = -1;

float BallX; //Randomizes the balls starting position
float BallY;

float BallSpeedX;  //Randomizes the speed of the ball
float BallSpeedY;

void setup(){
  size(500,500);
  frameRate(100);
  RandomizeStart();
}

void draw(){
  clear();
  background(50);
  
  BoxMorph();
  DrawBox();
  
  BallMove();
  DrawBall();
}



void RandomizeStart(){
  BallX = random(100,500); //Randomizes the balls starting position
  BallY = random(100,500);

  BallSpeedX = random(2,5);  //Randomizes the speed of the ball
  BallSpeedY = random(2,5);
}

void BoxMorph(){
  BoxLength = BoxLength + BoxChange;  //Changes the box' size
  
  if(BoxLength < 50 || BoxLength > 500){    //Makes the box switch between shrinking and growing
    BoxChange = -BoxChange;
  }
}

void DrawBox(){
  fill(160);
  rect(0,0,BoxLength,BoxLength);  //Draws the box
}

void DrawBall(){
  fill(230);
  ellipse(BallX,BallY,10,10);  //Draws the ball
}

void BallMove(){
  BallX = BallX + BallSpeedX;    //Moves the ball
  BallY = BallY + BallSpeedY;
  
  if(BallX > BoxLength || BallX < 0){  //Makes the ball switch direction when it hits the edges
    BallSpeedX = -BallSpeedX;
  }
  if(BallY > BoxLength || BallY < 0){
    BallSpeedY = -BallSpeedY;
  }
  
  if(BallX > BoxLength){   //Makse sure the ball never gets out of the box
    BallX = BoxLength;
  }
  if(BallY > BoxLength){
    BallY = BoxLength;
  }
}
