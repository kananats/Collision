class Live1 {

  Draggable d;
  Rectangle[] r;
  Circle[] c;

  Live1() {
    d=new Draggable(100, 100, 50);

    r=new Rectangle[8];
    for (int i=0;i<r.length;i++) 
      r[i]=new Rectangle(random(0, 800), random(0, 600), random(10, 400), random(10, 300), random(0, radians(180)));

    c=new Circle[8];
    for (int i=0;i<c.length;i++)
      c[i]=new Circle(random(0, 800), random(0, 600), random(10, 200));
  }

  void display() {
    fill(0, 100);
    noStroke();
    d.display();

    for (int i=0;i<r.length;i++) {
      noFill();
      stroke(0);
      if (colliding(r[i], d))stroke(255, 0, 0);
      r[i].display();
    }

    for (int i=0;i<c.length;i++) {
      noFill();
      stroke(0);
      if (colliding(c[i], d))stroke(255, 0, 0);
      c[i].display();
    }
  }
}

