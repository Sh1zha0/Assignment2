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
    fill(255);
    rect(x,y,w,h);
  }
}


