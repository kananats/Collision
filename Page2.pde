class Page2{
  Bullet b;
  Page2(){
    b=new Bullet();
  }
  
  void display(){
    b.move();
    
    //floor
    fill(0);
    noStroke();
    rectMode(CORNER);
    rect(0, 500, 800, 100);

    //slingshot (back)
    strokeWeight(12);
    stroke(0);

    line(180, 450, 215, 380);

    //rubber band (back)
    if (b.state<=1) {
      strokeWeight(3);
      stroke(150);
      float temp=dist(215, 380, b.position.x, b.position.y);
      line(145, 380, 215+(b.position.x-215)*(25/temp+1), 380+(b.position.y-380)*(25/temp+1));
    }

    //object
    b.display();
    
    //slingshot (front)
    strokeWeight(12);
    stroke(0);
    line(180, 450, 180, 500);
    line(180, 450, 145, 380);

    //rubber band (front)
    if (b.state<=1) {
      strokeWeight(3);
      stroke(150);
      float temp=dist(215, 380, b.position.x, b.position.y);
      line(215, 380, 215+(b.position.x-215)*(25/temp+1), 380+(b.position.y-380)*(25/temp+1));
    }
  }
  
  void refresh(){
    b.refresh();
  }
}
