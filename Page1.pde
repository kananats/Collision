class Page1{
  Circle c;
  Rectangle r;
  
  Page1(){
    c=new Circle(100,300,30);
    c.velocity.x=1;
    c.velocity.y=0;
    r=new Rectangle(400,300,300,100);
    r.angle=1;
  }
  
  void display(){
    c.position.add(c.velocity);
    
    noFill();
    stroke(0);
    c.display();
    r.display();
    
    r.intersect(c);
  }
}
