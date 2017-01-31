class Tower
{
  PVector location;
  float h; // height
  float w; // width
  float d; // depth
  float direction;
  color bodyColor;
  
  Tower(PVector l, float size)
  {
    location = l.copy();
    h = 30;
    w = size;
    d = size;
  }
    
  void update(float h_)
  {
    h = h_;
    bodyColor = color(h % 255, 255, 255);
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y - h / 2, location.z);
    fill(bodyColor);
    stroke(32, 32);
    box(w, h, d);
    popMatrix();
  }
}