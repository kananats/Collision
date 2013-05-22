Circle c;
Rectangle[] r;

void setup(){
  size(800,600,P2D);
  
  c=new Circle(100,100,30);
  r=new Rectangle[10];
  for(int i=0;i<r.length;i++){
    r[i]=new Rectangle(random(0,800),random(0,600),random(10,400),random(10,300));
    r[i].angle=random(0,radians(180));
  }
}

void draw(){
  background(255);
  fill(0,0);
  stroke(0);
  
  c.drag();
  
  for(int i=0;i<r.length;i++)r[i].update();

  c.display();
  for(int i=0;i<r.length;i++){
    stroke(0);
    if(colliding(c,r[i]))stroke(255,0,0);
    r[i].display();
  }
  
  
}

void mousePressed() {
  c.startDrag();
}

void mouseReleased() {
  c.stopDrag();
}
