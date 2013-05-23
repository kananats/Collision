int state;

Page0 page0;
Page0 page1;
Page1 page2;

Draggable d;

void setup() {
  size(800, 600, P2D);
  state=2;

  d=new Draggable(100, 100, 50);

  page0=new Page0(8);
  page1=new Page0(100);
  page2=new Page1();
}

void draw() {
  background(255);
  fill(0, 0);
  stroke(0);

  d.drag();

  switch(state) {
  case 0:
    page0.display();
    break;

  case 1:
    page1.display();
    break;

  case 2:
    page2.display();
    break;

  default:
    break;
  }
}

void mousePressed() {
  d.startDrag();
}

void mouseReleased() {
  d.stopDrag();
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      page0.refresh();
      page1.refresh();
    } else if (keyCode == DOWN) {
      d.position.x=100;
      d.position.y=100;
    } else if (keyCode == LEFT) {
      state--;
    } else if (keyCode == RIGHT) {
      state++;
    }
  }
}

