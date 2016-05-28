// The Mover class will let us learn about vectors and simluating
// more interesting forms of motion.
//
// Progression:
// 1. Motion 101 – location and velocity
// 2. Motion w/ Acceleration (Constant)
//    Velocity - rate of change of location
//    Acceleration – rate of change of velocity
//    Acceleration affects velocity; velocity in turn affects location.
// 3. Motion w/ Acceleration (Random)
// 4. Motion w/ Acceleration (Toward the mouse)
class Mover {

  // Declare properties of the class here
  // They are in-scope (accessible) to all methods below
  RVector location;
  RVector velocity;
  RVector acceleration;
  RVector heading;

  // Constructor – use this to initialize a Mover instance
  Mover(RVector location_) {

    // Movers appear in centre of window and have zero velocity at first
    location = location_;
    velocity = new RVector(0, 0);  // object at rest when instantiated
    acceleration = new RVector(0, 0);  // object at rest when instantiated 
    heading = new RVector(0, 0);  // object at rest when instantiated 
  }

  // Behaviour
  // Add additional methods to implement Mover object behaviour below.

  // update position
  void update() {
    // update position
    velocity.add(acceleration);
    velocity.limit(3);
    location.add(velocity);
  }

  // get direction vector
  void getDirectionTowardPosition(float x, float y) {
    // Determine the direction vector that points to the specified position
    RVector position = new RVector(x, y);
    RVector direction = RVector.sub(position, location);

    // Save the raw heading vector that points to the specified position
    heading = RVector.sub(position, location);

    // Normalize and scale the direction vector
    direction.normalize();
    direction.mult(0.10);

    // Accelerate based on direction vector
    acceleration = direction;

  }

  // show the object
  void display() {

    stroke(0);    // black border
    fill(175);    // light gray fill

    // draw the mover
    ellipse(location.x, location.y, 25, 25);
  }

  // wrap around edges
  void checkEdges() {

    if (location.x > width) {     // right edge
      location.x = 0;
    } else if (location.x < 0) {  // left edge
      location.x = width;
    }

    if (location.y > height) {   // bottom edge
      location.y = 0;
    } else if (location.y < 0) { // top edge
      location.y = height;
    }
  }
}