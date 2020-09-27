// A GravityBall object is a particle that moves under the influence of a 
// gravitational force directed from its position to an anchor point. 
class GravityBall { 
  PVector anchor, pos, vel, acc, r;
  float rad;
  color c;
  float g = 0.05; // magnitude and direction of the acceleration
  
  // Create a GravityBall object
  GravityBall (PVector anchor_, PVector pos_, PVector vel_, color c_, float rad_) {  
    anchor = new PVector(anchor_.x, anchor_.y); // location of gravitational center
    pos = new PVector(pos_.x, pos_.y);          // particle initial position
    r = PVector.sub(anchor, pos);               // vector from the position to the anchor
    vel = new PVector(vel_.x, vel_.y);          // particle initial velocity
    acc = new PVector(0,0);                     // initial acceleration
    c = c_;                                     // particle color
    rad = rad_;                                 // radius of the particle
  }
  
  void update() { 
    // Update the acceleration, velocity, and position at each time step
    PVector norm = r;
    norm.normalize();
    acc.set(g*norm.x/r.magSq(), g*norm.y/r.magSq());
    vel.set(vel.x+acc.x, vel.y+acc.y);
    pos.set(pos.x+vel.x, pos.y+vel.y);
    r = PVector.sub(anchor, pos);
    
    // Draw the particle in its updated position with radius rad and a 
    // gradient line to its anchor.
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, rad, rad);
    gradientLine(anchor.x, anchor.y, pos.x, pos.y, color(c,0), c);
  } 
}

// Draw a line from p1 to p2 that changes color from a to b
void gradientLine(float x1, float y1, float x2, float y2, color a, color b) {
  float deltaX = x2-x1;
  float deltaY = y2-y1;
  float tStep = 1.0/dist(x1, y1, x2, y2);
  for (float t = 0.0; t < 1.0; t += tStep) {
    fill(lerpColor(a, b, t));
    ellipse(x1+t*deltaX,  y1+t*deltaY, 1, 1);
  }
}
