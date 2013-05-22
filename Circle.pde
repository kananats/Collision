class Circle{
  PVector position;
  float radius;
  
  Circle(float x,float y,float radius){
    position=new PVector(x,y);
    this.radius=radius;
  }
 
  void display(){
    ellipse(position.x,position.y,2*radius,2*radius);
  }
}
