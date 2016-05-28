class Bird extends Mover {
  
  float distanceToMouse;
  boolean leadBird;
  
  Bird(RVector location_) {
    
    super(location_);
    
    leadBird = false;
    
  }
  
  // update position
  void update() {
    
    // Only lead bird follows the mouse
    if (leadBird) {
      super.getDirection();
      super.update();
    } else {
      super.getDirection();
    }
  }
  
  // do not wrap around edges, just go off screen
  void checkEdges() {
        
  }
  
  // show the bird
  void display() {
    
    stroke(0);    // black border
    
    // Set fill
    if (leadBird) {  
      fill(0);      // lead bird shows as black
    } else {
      fill(175);    // light gray fill
    }
    
    // draw the mover
    ellipse(location.x, location.y, 25, 25);
    
  }

  
  // get the raw distance to the mouse, to help determine lead bird
  void distanceToMouse() {
    
    // How far am I from the mouse?
    distanceToMouse = super.heading.mag();
    
    // Release claim on being lead bird
    leadBird = false;
    
  }
  
  // make this bird the lead bird
  void makeLeadBird() {
    leadBird = true;
  }
  
}