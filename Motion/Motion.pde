// Create a space in memory for a Mover object
Mover movers[] = new Mover[25];

// Runs once
void setup() {

  // Create a white background
  size(1000, 700);
  background(255);

  // Actually make an instance of a Mover
  println(movers.length / 2);
  for (int i = 0; i < movers.length; i++) {
    float x = 0;
    if (i < movers.length / 2) { 
      x = width / 20 * i;
    } else {
      x = (width / 20) * (movers.length / 2) - (width / 20) * (i - (movers.length / 2));
    }
    float y = height / 25 * i;
    RVector initialPosition = new RVector(x, y);
    movers[i] = new Mover(initialPosition);
  }
}

// Runs forever
void draw() {

  // Clear the background
  background(255);

  // Make the movers move!
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}


// Respond to keypresses
void keyPressed() {
}