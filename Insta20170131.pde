ArrayList<Tower> towers;
float noise_value;

float radius, size;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  smooth();
  colorMode(HSB);
  
  towers = new ArrayList<Tower>();
  noise_value = random(10);
  radius = 150;
  size = 15;
  
  /*
  for(int i = 90; i < 360 * 3; i += 5)
  {
     float point_x = radius * cos(radians(i));
     float point_z = radius * sin(radians(i));
     towers.add(new Tower(new PVector(point_x, height - 30, point_z), size + i / 45));
     radius += 3;
  }
  */
}

void draw()
{
  background(255);
  translate(width / 2, height / 2, -1000);
  rotateX(radians(-60));
  
  if(frameCount < 265)
  {
    int i = frameCount * 5 + 90;
    float point_x = radius * cos(radians(i));
    float point_z = radius * sin(radians(i));
    towers.add(new Tower(new PVector(point_x, height - 30, point_z), size + i / 45));
    radius += 3;
  }
  
  float tmp_noise_value = noise_value;
  for(int i = towers.size(); i > 0; i -= 1)
  {
    float h = 1024 * noise(noise_value);
    towers.get(i - 1).update(h);
    towers.get(i - 1).display();
    noise_value += 0.03;
  }
  noise_value = tmp_noise_value + 0.03;
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}