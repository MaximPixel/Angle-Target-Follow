void setup() {
  size(800, 800, P3D);
  smooth(8);
  strokeWeight(4F);
  noFill();
}

float current;
float target;

void draw() {
  background(200);

  translate(width / 2, height / 2);

  stroke(0, 0, 0);
  circle(0, 0, 600);

  target = atan2(width / 2 - mouseX, height / 2 - mouseY) + PI;

  target = swapAngle(target);
  current = swapAngle(current);

  float diff = swapAngle(target - current);

  float dir = sign(diff);

  current += min(abs(diff), 0.01F) * dir;

  float x1 = sin(current) * 300;
  float y1 = cos(current) * 300;
  float x2 = sin(target) * 300;
  float y2 = cos(target) * 300;

  stroke(255, 0, 0);
  line(0, 0, x1, y1);

  stroke(0, 255, 0);
  line(0, 0, x2, y2);
}

float sign(float a) {
  return a > 0F ? 1F : a < 0F ? -1F : 0F;
}

float swapAngle(float angle) {
  while (angle < -PI) {
    angle += 2F * PI;
  }

  while (angle >= PI) { 
    angle -= 2F * PI;
  }

  return angle;
}
