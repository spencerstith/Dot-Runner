class Particle {
  
  PVector[] history;
  int len;
  PVector vel;
  float deltaGradient;
  float hue;
  float saturation;
  
  Particle(int len) {
    this.len = len;
    vel = randomVel();
    history = calculateHistory();
    deltaGradient = 255 / len;
    hue = random(255);
    saturation = random(255);
  }
  
  PVector[] calculateHistory() {
    PVector begin = new PVector(random(width), random(height));
    PVector[] history = new PVector[len];
    history[0] = begin;
    for (int i = 1; i < len; i++) {
      history[i] = new PVector(history[i - 1].x - vel.x, history[i - 1].y - vel.y);;
    }
    return history;
  }
  
  PVector randomVel() {
    float angle = random(0, TWO_PI);
    float mag = random(0, 10);
    float x = mag * cos(angle);
    float y = mag * sin(angle);
    return new PVector(x, y);
  }
  
  void update() {
    // New head
    PVector newHead = PVector.add(history[0], vel);
    history = shiftArray(history, newHead);
    
    // Check bounds
    if (history[0].x < 0) history[0].x = width;
    if (history[0].x > width) history[0].x = 0;
    if (history[0].y < 0) history[0].y = height;
    if (history[0].y > height) history[0].y = 0;
  }
  
  PVector[] shiftArray(PVector[] arr, PVector newHead) {
    PVector [] newArr = new PVector[arr.length];
    for (int i = 1; i < arr.length; i++) {
      newArr[i] = arr[i - 1];
    }
    newArr[0] = newHead;
    return newArr;
  }
  
  void show() {
    for (int i = len - 1; i >= 0; i--) {
      stroke(hue, saturation, 255 - deltaGradient * i);
      fill(hue, saturation, 255 - deltaGradient * i);
      ellipse(history[i].x, history[i].y, 10, 10);
    }
  }
  
}
