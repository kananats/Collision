class Page0 {

  Rectangle[] r;
  Circle[] c;

  Page0(int quantity) {

    r=new Rectangle[quantity];
    for (int i=0;i<r.length;i++) 
      r[i]=new Rectangle(random(0, 800), random(0, 600), random(10, 400), random(10, 300));

    c=new Circle[quantity];
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

  void refresh() {
    for (int i=0;i<r.length;i++) {
      r[i].position.x=random(0, 800);
      r[i].position.y=random(0, 600);
      r[i].w=random(10, 400);
      r[i].h=random(10, 300);
      r[i].angle=random(0, radians(180));
    }

    for (int i=0;i<c.length;i++) {
      c[i].position.x=random(0, 800);
      c[i].position.y=random(0, 600);
      c[i].radius=random(10, 200);
    }
  }
}

