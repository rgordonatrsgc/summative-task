// Create space in memory for a flock of birds
Flock flockOBirds;

// Runs once
void setup() {

  // Create a white background
  size(1000, 700);
  background(255);
  
  // Initialize the flock of birds
  flockOBirds = new Flock();

}

// Runs forever
void draw() {

  // Clear the background
  background(255);
  
  // Update the flock's position
  flockOBirds.update();

}

// Runs when a key is pressed
void keyPressed() {
  
  if (key == 'r' || key == 'R') {
    flockOBirds.reset();
  }
  
}