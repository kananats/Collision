class Bullet extends Circle {
  int state;
  //0 idle
  //1 drag
  //2 release

  boolean fly;

  PVector offset;

  Bullet() {
    super(175, 400, 25);

    offset=new PVector();
    state=0;
    fly=false;
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(position.x, position.y, radius*2, radius*2);
  }

  void move() {
    switch(state) {
    case 1:
      position.x=175;
      position.y=400;
      PVector drag=new PVector(mouseX-175, mouseY-400);
      float mag=(drag.mag());
      drag.normalize();
      drag.mult(0.4*mag);
      position.add(drag);
      position.add(offset);
      break;

    case 2:
      PVector acc=new PVector(0,0.4); //gravity
      velocity.add(acc);
      position.add(velocity);
      
      if(position.x<radius){
        velocity.x*=-0.9;
        position.x=radius;
      }
      if(position.x>width-radius){
        velocity.x*=-0.9;
        position.x=width-radius;
      }
      if(fly&&position.y>500-radius){
        velocity.y*=-0.75;
        velocity.x*=0.95;
        position.y=500-radius;
      }
      if(!fly&&position.y<=500-radius)fly=true;
      break;

    default:
      break;
    }
  }
  void startDrag() {
    if (state<=1&&dist(position.x, position.y, mouseX, mouseY)<=50) {
      state=1;
      offset.x=position.x-mouseX;
      offset.y=position.y-mouseY;
    }
  }

  void stopDrag() {
    if (state==1) {
      state=2;
      velocity.x=(175-position.x)*0.2;
      velocity.y=(400-position.y)*0.2;
      if(position.y<=500-radius)fly=true;
    }
  }

  void refresh() {
    state=0;
    position.x=175;
    position.y=400;
    velocity.x=0;
    velocity.y=0;
    fly=false;
  }
}

