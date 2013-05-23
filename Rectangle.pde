class Rectangle {

  PVector position;

  PVector[] vertex;
  PVector[] axis;

  float w, h;
  float angle;

  Rectangle(float x, float y, float w, float h) {

    position=new PVector(x, y);

    this.w=w;
    this.h=h;

    float rand;
    while (true) {
      rand=random(0, 180);
      if (!(rand==0||rand==90||rand==180)) {
        angle=radians(rand);
        break;
      }
    }

    vertex=new PVector[4];
    axis=new PVector[4];
    for (int i=0;i<4;i++) {
      vertex[i]=new PVector();
      axis[i]=new PVector();
    }

    update();
  }

  void update() {
    PVector dx=new PVector(w*0.5, 0);
    dx.rotate(angle);
    PVector dy=new PVector(0, h*0.5);
    dy.rotate(angle);

    for (int i=0;i<4;i++) {
      vertex[i].x=position.x+(i==0||i==3? 1:-1)*dx.x+(i==2||i==3? 1:-1)*dy.x;
      vertex[i].y=position.y+(i==0||i==3? 1:-1)*dx.y+(i==2||i==3? 1:-1)*dy.y;
    }

    for (int i=0;i<4;i++) {
      axis[i].x=vertex[(i+1)%4].y-vertex[i].y;
      axis[i].y=vertex[i].x-vertex[(i+1)%4].x;
      axis[i].normalize();
    }
  }

  PVector voronoi(PVector point) {
    update();
    if (isOutside(vertex[0], vertex[1], point)) {
      if (isOutside(vertex[1], vertex[2], point))return vertex[1]; else if (isOutside(vertex[0], vertex[3], point))return vertex[0];
    } else if (isOutside(vertex[2], vertex[3], point)) {
      if (isOutside(vertex[1], vertex[2], point))return vertex[2]; else if (isOutside(vertex[0], vertex[3], point))return vertex[3];
    }
    return null;
  }

  void intersect(Circle circle) {
    if (!colliding(this, circle))return;
    update();

    if (!isOutside(vertex[3], vertex[0], circle.position)&&!isOutside(vertex[1], vertex[2], circle.position)) {
      if (isOutside(vertex[0], vertex[1], circle.position)) {

        float a=(vertex[1].y-vertex[0].y)/(vertex[1].x-vertex[0].x);
        float b=-1;
        float c=-(vertex[1].y-vertex[0].y)*vertex[0].x/(vertex[1].x-vertex[0].x)+vertex[0].y;
        if (abs(a*circle.position.x+b*circle.position.y+c)/sqrt(a*a+b*b)<circle.radius) {
          PVector reflec=getNorm(vertex[0], vertex[1]);
          reflec.mult(circle.velocity.dot(getNorm(vertex[0], vertex[1])));
          circle.velocity.sub(reflec);
          circle.velocity.sub(reflec);
          return;
        }
      } 
      if (isOutside(vertex[2], vertex[3], circle.position)) {
        float a=(vertex[3].y-vertex[2].y)/(vertex[3].x-vertex[2].x);
        float b=-1;
        float c=-(vertex[3].y-vertex[2].y)*vertex[2].x/(vertex[3].x-vertex[2].x)+vertex[2].y;
        if (abs(a*circle.position.x+b*circle.position.y+c)/sqrt(a*a+b*b)<circle.radius) {
          PVector reflec=getNorm(vertex[2], vertex[3]);
          reflec.mult(circle.velocity.dot(getNorm(vertex[2], vertex[3])));
          circle.velocity.sub(reflec);
          circle.velocity.sub(reflec);
          return;
        }
      }
    } 

    if (!isOutside(vertex[0], vertex[1], circle.position)&&!isOutside(vertex[2], vertex[3], circle.position)) {
      if (isOutside(vertex[1], vertex[2], circle.position)) {
        float a=(vertex[2].y-vertex[1].y)/(vertex[2].x-vertex[1].x);
        float b=-1;
        float c=-(vertex[2].y-vertex[1].y)*vertex[1].x/(vertex[2].x-vertex[1].x)+vertex[1].y;
        if (abs(a*circle.position.x+b*circle.position.y+c)/sqrt(a*a+b*b)<circle.radius) {
          PVector reflec=getNorm(vertex[1], vertex[2]);
          reflec.mult(circle.velocity.dot(getNorm(vertex[1], vertex[2])));
          circle.velocity.sub(reflec);
          circle.velocity.sub(reflec);
          return;
        }
      } 
      if (isOutside(vertex[3], vertex[0], circle.position)) {
        float a=(vertex[3].y-vertex[2].y)/(vertex[3].y-vertex[2].y);
        float b=-1;
        float c=-(vertex[3].y-vertex[2].y)*vertex[2].x/(vertex[3].x-vertex[2].x)+vertex[2].y;
        if (abs(a*circle.position.x+b*circle.position.y+c)/sqrt(a*a+b*b)<circle.radius) {
          PVector reflec=getNorm(vertex[2], vertex[3]);
          reflec.mult(circle.velocity.dot(getNorm(vertex[2], vertex[3])));
          circle.velocity.sub(reflec);
          circle.velocity.sub(reflec);
          return;
        }
      }
    }
  }

  private PVector getNorm(PVector v0, PVector v1) {
    PVector p=new PVector((v0.x+v1.x)/2-position.x, (v0.y+v1.y)/2-position.y);
    p.normalize();
    return p;
  }

  private boolean isOutside(PVector v0, PVector v1, PVector point) {
    if (position.y-v1.y<=(v1.y-v0.y)*(position.x-v1.x)/(v1.x-v0.x)) {
      if (point.y-v1.y>=(v1.y-v0.y)*(point.x-v1.x)/(v1.x-v0.x)) {
        return true;
      }
    } else {
      if (point.y-v1.y<=(v1.y-v0.y)*(point.x-v1.x)/(v1.x-v0.x)) {
        return true;
      }
    }
    return false;
  }

  void display() {
    rectMode(CENTER);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    rect(0, 0, w, h);
    popMatrix();
    rectMode(CORNER);
  }
}

