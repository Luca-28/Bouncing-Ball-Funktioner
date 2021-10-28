int BallAmount = 1000;  //Defines the number of balls


int BoxLength = 500;
int BoxChange = -1;

float[] BallX = new float[BallAmount]; //Randomizes the balls' starting position
float[] BallY = new float[BallAmount];

float[] BallSpeedX = new float[BallAmount];  //Randomizes the speeds of the ball
float[] BallSpeedY = new float[BallAmount];

void setup(){
  noStroke();
  size(500,500);
  frameRate(100);
  RandomizeStart();
}

void draw(){
  clear();
  background(50);
  
  BoxMorph();
  DrawBox();
  
  BallsMove();
  DrawBalls();
}



void RandomizeStart(){
  for(int i = 0; i < BallAmount; i++){
    BallX[i] = random(10,990); //Randomizes the balls starting position
    BallY[i] = random(10,990);
  
    BallSpeedX[i] = random(1,5);  //Randomizes the speed of the ball
    BallSpeedY[i] = random(1,5);
  }
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

void DrawBalls(){
  fill(230);
  for(int i = 0; i < BallAmount; i++){
    circle(BallX[i],BallY[i],10);  //Draws the balls
  }
}

void BallsMove(){
  for(int i = 0; i < BallAmount; i++){
    BallX[i] += BallSpeedX[i];    //Moves the ball
    BallY[i] += BallSpeedY[i];
    
    if(BallX[i] > BoxLength || BallX[i] < 0){  //Makes the balls switch direction when they hit the edges
      BallSpeedX[i] *= -1;
    }
    if(BallY[i] > BoxLength || BallY[i] < 0){
      BallSpeedY[i] *= -1;
    }
    
    if(BallX[i] > BoxLength){   //Makes sure the balls never get out of the box
      BallX[i] = BoxLength;
    }
    if(BallY[i] > BoxLength){
      BallY[i] = BoxLength;
    }
  }
}
