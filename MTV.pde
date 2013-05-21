class MTV {
  PVector axis;
  float overlap;
  
  MTV(Rectangle r,Circle c){
    this(c,r);
  }
  
  MTV(Circle c, Rectangle r) {
    overlap=Float.MAX_VALUE;
    axis=null;
    float temp;
    PVector voronoi=r.voronoi(c.position);

    if (voronoi!=null) {
      //PVector voronoi_axis=new PVector(voronoi.y-c.position.y, c.position.x-voronoi.x);
      PVector voronoi_axis=new PVector(c.position.x-voronoi.x,c.position.y-voronoi.y);
      voronoi_axis.normalize();
      
      //temp=new Projection(voronoi_axis, r.vertex).overlap(new Projection(c, voronoi_axis, -atan2(c.position.y-voronoi.y, c.position.x-voronoi.x)));
      
      Projection p1=new Projection(voronoi_axis, r.vertex);
      
      println("p1: "+p1.min+","+p1.max);
      
      Projection p2=new Projection(c,voronoi_axis, 0);
      
      println("p2: "+p2.min+","+p2.max);

      
      temp=p1.overlap(p2);
      println("ok: "+temp);
      if (temp<0){
        axis=null;
        return;
      }
      else{
        if(temp<overlap){
          overlap=temp;
          axis=new PVector(voronoi_axis.x,voronoi_axis.y);
        }
      }
    }

    for (int i=0;i<r.axis.length;i++) {
      temp=new Projection(r.axis[i], r.vertex).overlap(new Projection(c, r.axis[i], r.angle));
      
      if (temp<0){
        axis=null;
        return;
      }
      else{
        if(temp<overlap){
          overlap=temp;
          axis=new PVector(r.axis[i].x,r.axis[i].y);
        }
      }
    }
  }

  MTV(Rectangle p1, Rectangle p2) {
    overlap=Float.MAX_VALUE;
    axis=null;
    float temp;
    for (int i=0;i<p1.axis.length;i++) {
      temp=new Projection(p1.axis[i], p1.vertex).overlap(new Projection(p1.axis[i], p2.vertex));
      if (temp<0){
        axis=null;
        return;
      }
      else{
        if(temp<overlap){
          overlap=temp;
          axis=new PVector(p1.axis[i].x,p1.axis[i].y);
        }
      }
      
      temp=new Projection(p2.axis[i], p1.vertex).overlap(new Projection(p2.axis[i], p2.vertex));
      if (temp<0){
        axis=null;
        return;
      }
      else{
        if(temp<overlap){
          overlap=temp;
          axis=new PVector(p2.axis[i].x,p2.axis[i].y);
        }
      }
    }
  }
}

