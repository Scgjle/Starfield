Particle[] particles = new Particle[100];

void setup() {
  size(800, 600);
  background(0);
  
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  // first partical is the oddball
  particles[0] = new OddParticle();
}

void draw() {
  background(0);
  
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}

class Particle {
  float x, y;
  int widt = 10;
  int heih = 10;
  float speed;
  float angle;
  color c;

  Particle() {
    x = width / 2;
    y = height / 2;
    speed = random(1, 5);
    angle = random(TWO_PI);
    c = color(random(255), random(255), random(255));
  }

  void move() {
  x += cos(angle) * speed;
  y += sin(angle) * speed;

  if (x < -(widt/2)) x = width + (widt/2);
  if (x > width+ (widt/2)) x = -(widt/2);
  if (y < -(widt/2)) y = height + (widt/2);
  if (y > height+(widt/2)) y = -(widt/2);
}


  void show() {
    fill(c);
    noStroke();
    ellipse(x, y, 5, 5);
  }
}

class OddParticle extends Particle {
  OddParticle() {
    super();
    speed = (2);
    c = color(255, 255, 255); 
    y = 20;
    x = 20;
    widt = 80;
  }

  void show() {
    fill(c);
    stroke(255);
    ellipse(x, y, widt, widt);
  }
}
