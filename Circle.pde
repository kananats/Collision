class Circle{
  PVector position;
  float radius;
  
  boolean dragging;
  PVector offset;
  
  Circle(float x,float y,float radius){
    position=new PVector(x,y);
    this.radius=radius;
    offset=new PVector();
    dragging=false;
  }
 
  void display(){
    ellipse(position.x,position.y,2*radius,2*radius);
  }
  
  void startDrag() {
    if (dist(position.x,position.y,mouseX,mouseY)<=radius) {
      dragging = true;
      offset.x = position.x-mouseX;
      offset.y = position.y-mouseY;
    }
  }

  void stopDrag() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      position.x = mouseX + offset.x;
      position.y = mouseY + offset.y;
    }
  }
}
