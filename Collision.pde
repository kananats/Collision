Circle c;
Rectangle r;

void setup(){
  size(800,600,P2D);
  
  c=new Circle(100,100,30);
  r=new Rectangle(400,300,300,150);
  r.angle=2;
}

void draw(){
  background(255);
  fill(0,0);
  stroke(0);
  c.drag();
  
  r.updateVertex();
  r.updateAxis();
  
  println(colliding(c,r));
  
  strokeWeight(1);
  c.display();
  r.display();
}

void mousePressed() {
  c.startDrag();
}

void mouseReleased() {
  c.stopDrag();
}
