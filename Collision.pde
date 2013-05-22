int state;

Live1 live1;

void setup() {
  size(800, 600, P2D);
  state=0;
  live1=new Live1();
}

void draw() {
  background(255);
  fill(0, 0);
  stroke(0);

  switch(state) {
  case 0:
    live1.d.drag();
    live1.display();
    break;

  case 1:
    break;

  case 2:
    break;

  default:
    break;
  }
}

void mousePressed() {
  switch(state) {
  case 0:
    live1.d.startDrag();
    break;
    
  case 1:
    break;

  case 2:
    break;

  default:
    break;
  }
}

void mouseReleased() {
  switch(state) {
  case 0:
    live1.d.stopDrag();
    break;
    
  case 1:
    break;

  case 2:
    break;

  default:
    break;
  }
}

