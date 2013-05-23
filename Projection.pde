class Projection {

  float min, max;

  Projection(PVector axis, PVector[] vertex) {
    for (int i=0;i<vertex.length;i++) {
      float temp=axis.dot(vertex[i]);
      if (i==0||temp<min)min=temp;
      if (i==0||temp>max)max=temp;
    }
  }

  Projection(PVector axis, Circle c, float angle) {
    for (int i=0;i<4;i++) {
      float temp=new PVector(c.position.x+c.radius*cos(angle), c.position.y+c.radius*sin(angle)).dot(axis);
      if (i==0||temp<min)min=temp;
      if (i==0||temp>max)max=temp;
      angle+=radians(90);
    }
  }

  float overlap(Projection p) {
    if (ascending(min, max, p.min, p.max)||ascending(p.min, p.max, min, max))return -1;
    //-1 indicate no overlapping occur 
    else if (ascending(min, p.min, max, p.max))return max-p.min; 
    else if (ascending(p.min, min, p.max, max))return p.max-min; 
    else if (ascending(min, p.min, p.max, max))return p.max-p.min;
    return max-min;
  }

  private boolean ascending(float a, float b, float c, float d) {
    return a<=b&&b<=c&&c<=d;
  }
}

