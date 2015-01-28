class block extends Player
{
  float w,h,x,y;
  color c1,c2,c3;
  block(float x,float y,float w,float h,color c1,color c2,color c3)
  {
    this.w=w;
    this.h=h;
    this.x=x;
    this.y=y;
    this.c1=c1;
    this.c2=c2;
    this.c3=c3;
  }
  
  void display()
  {
    fill(c1,c2,c3);
    rect(x,y,w,h);
  }
}


