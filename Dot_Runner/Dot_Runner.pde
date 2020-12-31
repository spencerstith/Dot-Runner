Particle[] particles;

void setup() {
  colorMode(HSB);
  fullScreen();
  //size(600, 600);
  particles = new Particle[20];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(100);
  }
}

void draw() {
  background(0);
  for (Particle particle : particles) {
    particle.update();
    particle.show();
  }
}
