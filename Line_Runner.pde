PVector pos, vel;
boolean running;
void setup() {
  fullScreen(P2D);
  //size(600, 600);
  background(0);
  strokeWeight(2);
  stroke(255);
  
  running = false;
}

void draw() {
  if (running) {
    stroke(random(255), random(255), random(255));
    point(pos.x, pos.y);
    pos.add(vel);
    checkEdge();
  } else {
    background(0);
    if (pos != null) {
      line(pos.x, pos.y, mouseX, mouseY);
    }
  }
}

void mouseClicked() {
  if (pos == null) {
    pos = new PVector(mouseX, mouseY);
  } else {
    PVector newPos = new PVector(mouseX, mouseY);
    vel = newPos.sub(pos).div(10);
    running = true;
    background(0);
  }
}

void checkEdge() {
  if (pos.x <= 0 || pos.x >= width) {
    vel.x = -vel.x;
  }
  if (pos.y <= 0 || pos.y >= height) {
    vel.y = -vel.y;
  }
  
}
