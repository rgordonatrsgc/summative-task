class Bird extends Mover {
  
  Bird(RVector location_) {
    super(location_);
  }
  
  // do not wrap around edges, just go off screen
  void checkEdges() {
        
  }
}