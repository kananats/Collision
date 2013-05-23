boolean colliding(Circle c1, Circle c2) {
  if (dist(c1.position.x, c1.position.y, c2.position.x, c2.position.y)<=c1.radius+c2.radius)return true;
  return false;
}

boolean colliding(Rectangle r, Circle c) {
  return colliding(c, r);
}

boolean colliding(Circle c, Rectangle r) {
  PVector voronoi=r.voronoi(c.position);
  r.update();

  if (voronoi!=null) {
    PVector voronoi_axis=new PVector(c.position.x-voronoi.x, c.position.y-voronoi.y);
    voronoi_axis.normalize();

    Projection p1=new Projection(voronoi_axis, r.vertex);
    Projection p2=new Projection(voronoi_axis, c, voronoi_axis.heading());

    if (p1.overlap(p2)<0) return false;
  }

  for (int i=0;i<r.axis.length;i++) {
    Projection p1=new Projection(r.axis[i], r.vertex);
    Projection p2=new Projection(r.axis[i], c, r.angle);

    if (p1.overlap(p2)<0) return false;
  }
  return true;
}

boolean colliding(Rectangle r1, Rectangle r2) {
  r1.update();
  r2.update();
  for (int i=0;i<r1.axis.length;i++) {
    Projection p1=new Projection(r1.axis[i], r1.vertex);
    Projection p2=new Projection(r1.axis[i], r2.vertex);

    if (p1.overlap(p2)<0) return false;

    p1=new Projection(r2.axis[i], r1.vertex);
    p2=new Projection(r2.axis[i], r2.vertex);

    if (p1.overlap(p2)<0) return false;
  }
  return true;
}

