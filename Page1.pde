class Page1{
  Circle c;
  Rectangle r;
  
  Page1(){
    c=new Circle(100,300,30);
    c.velocity.x=5;
    c.velocity.y=-1.3;
    r=new Rectangle(400,300,300,300);
    r.angle=1;
  }
  
  void display(){
    c.position.add(c.velocity);
    
    noFill();
    stroke(0);
    c.display();
    r.display();
    
    r.intersect(c);
    if(c.position.x+c.radius>width||c.position.x-c.radius<0)c.velocity.x*=-1;
    if(c.position.y+c.radius>height||c.position.y-c.radius<0)c.velocity.y*=-1;
  }
}
