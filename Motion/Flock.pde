class Flock {

  // Create a space in memory for a "flock" of birds
  Bird birds[] = new Bird[25];
  int leadBird = -1;

  Flock() {
    
    // Set the flock of birds to their initial position
    reset();
    
  }

  // Reset the flock of birds to their initial positions
  void reset() {

    // Make the flock of birds
    for (int i = 0; i < birds.length; i++) {

      float x = 0;

      /* 
       * Make a sideways "V" shape for the flock for starting positions
       */

      // Fan to right toward middle bird at start
      if (i < birds.length / 2) { 
        x = width / 20 * i;
      } else {
        // Fan to left after middle bird
        x = (width / 20) * (birds.length / 2) - (width / 20) * (i - (birds.length / 2));
      }

      // Always fan down
      float y = height / 25 * i;
      RVector initialPosition = new RVector(x, y);
      birds[i] = new Bird(initialPosition);
    }
    
  }

  // Update the position of the birds in the flock
  void update() {

    // Update birds' positions
    for (int i = 0; i < birds.length; i++)
      birds[i].update();

    // Determine the lead bird
    findLeadBird();

    // Display the birds
    for (int i = 0; i < birds.length; i++) {
      birds[i].checkEdges();
      birds[i].display();
    }
  }

  // Find the lead bird
  void findLeadBird() {

    // Reset tracking variables for finding shortest distance to mouse
    Float shortestDistanceToMouse = Float.POSITIVE_INFINITY;

    // Find each bird's position relative to the mouse
    for (int i = 0; i < birds.length; i++) {
      birds[i].distanceToMouse();
      if (birds[i].distanceToMouse < shortestDistanceToMouse) {
        leadBird = i;
        shortestDistanceToMouse = birds[i].distanceToMouse;
      }
    }
    // Set the lead bird
    birds[leadBird].makeLeadBird();
  }
}