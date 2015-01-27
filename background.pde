class block extends Player
{
  float w,h,x,y;
  block(float x,float y,float w,float h)
  {
    this.w=w;
    this.h=h;
    this.x=x;
    this.y=y;
  }
  
  void display()
  {
    stroke(0);
    fill(0);
    rect(x,y,w,h);
  }
}


