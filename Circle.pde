class Circle{
  PVector position;
  PVector velocity;
  float radius;
  
  Circle(float x,float y,float radius){
    position=new PVector(x,y);
    velocity=new PVector(0,0);
    this.radius=radius;
  }
 
  void display(){
    ellipse(position.x,position.y,2*radius,2*radius);
  }
}
