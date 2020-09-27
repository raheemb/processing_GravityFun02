int nBallsInner = 30;
int nBallsMid = 30;
int nBallsOuter = 30;
GravityBall[] gBalls = new GravityBall[nBallsInner+nBallsMid+nBallsOuter];
int frame = 0;

void setup() { 
  size(900, 900); // set the canvas size
  PVector anchor = new PVector(0,0); // center the gravitational potential around the origin
  
  // define the color for each layer of particles
  color cInner = color(26, 166, 183);
  color cMid = color(153, 137, 255);
  color cOuter = color(255, 65, 77);
  
  float rad = 4; // set the particle radius
  float velScale = 2; // scale the random initial velocities of the particles
  
  // initialize the GravityBall objects for each layer with random positions around the circle
  // and add them to the gBalls array
  for (int i=0; i < nBallsInner; i++) {
    float r = random(0, 200);
    float theta = random(0, 2*PI);
    PVector pos = new PVector(r*cos(theta),r*sin(theta));
    PVector vel = new PVector(random(-velScale,velScale), random(-velScale,velScale)); 
    gBalls[i] = new GravityBall(anchor, pos, vel, cInner, rad);
  }
  for (int i=0; i < nBallsMid; i++) {
    float r = random(180, 275);
    float theta = random(0, 2*PI);
    PVector pos = new PVector(r*cos(theta),r*sin(theta));
    PVector vel = new PVector(random(-velScale,velScale), random(-velScale,velScale)); 
    gBalls[nBallsInner+i] = new GravityBall(anchor, pos, vel, cMid, rad);
  }
  for (int i=0; i < nBallsOuter; i++) {
    float r = random(250, 350);
    float theta = random(0, 2*PI);
    PVector pos = new PVector(r*cos(theta),r*sin(theta));
    PVector vel = new PVector(random(-velScale,velScale), random(-velScale,velScale)); 
    gBalls[nBallsInner+nBallsMid+i] = new GravityBall(anchor, pos, vel, cOuter, rad);
  }
}


void draw() {  
  translate(width/2, height/2); // Translate to center the sketch in the frame
  background(0);
  
  // Iterate through all balls and update their positions
  for (GravityBall g : gBalls) g.update();
  
  // Uncomment to save the frames as png files, use the frame counter and if statement 
  // to set the length of your animation. 
  //saveFrame("frames/#######.png");
  //frame++;
  //if (frame >= 1800) exit();
}  
