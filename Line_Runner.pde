PVector pos, vel;
void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  pos = new PVector(random(width), random(height));
  vel = new PVector(random(5), random(5));
}

void draw() {
  point(pos.x, pos.y);
  pos.add(vel);
  checkEdge();
}

void checkEdge() {
  if (pos.x <= 0 || pos.x >= width) {
    vel.x = -vel.x;
  }
  if (pos.y <= 0 || pos.y >= height) {
    vel.y = -vel.y;
  }
  
}
