// Create a space in memory for a Mover object
Bird birds[] = new Bird[25];

// Runs once
void setup() {

  // Create a white background
  size(1000, 700);
  background(255);

  // Make the flock of birds
  for (int i = 0; i < birds.length; i++) {
    float x = 0;
    if (i < birds.length / 2) { 
      x = width / 20 * i;
    } else {
      x = (width / 20) * (birds.length / 2) - (width / 20) * (i - (birds.length / 2));
    }
    float y = height / 25 * i;
    RVector initialPosition = new RVector(x, y);
    birds[i] = new Bird(initialPosition);
  }
}

// Runs forever
void draw() {

  // Clear the background
  background(255);

  // Make the movers move!
  for (int i = 0; i < birds.length; i++) {
    birds[i].update();
    birds[i].checkEdges();
    birds[i].display();
  }
}


// Respond to keypresses
void keyPressed() {
}