class Draggable extends Circle {
  boolean dragging;
  PVector offset;

  Draggable(float x, float y, float radius) {
    super(x, y, radius);
    offset=new PVector();
    dragging=false;
  }

  void startDrag() {
    if (dist(position.x, position.y, mouseX, mouseY)<=radius) {
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

