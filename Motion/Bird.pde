class Bird extends Mover {

  float distanceToMouse;
  boolean isLeadBird;

  Bird(RVector location_, boolean isLeadBird_) {

    super(location_);

    isLeadBird = isLeadBird_;
  }

  // update position
  void update(Bird theLeader) {

    // Only lead bird follows the mouse
    if (isLeadBird) {
      super.getDirectionTowardPosition(mouseX, mouseY);
      super.update();
    } else {
      // Other birds follow the lead bird
      super.getDirectionTowardPosition(theLeader.location.x, theLeader.location.y);
      super.update();
    }
  }

  // do not wrap around edges, just go off screen
  void checkEdges() {
  }

  // show the bird
  void display() {

    stroke(0);    // black border

    // Set fill
    if (isLeadBird) {  
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
    isLeadBird = false;
  }

  // make this bird the lead bird
  void makeLeadBird() {
    isLeadBird = true;
  }
}