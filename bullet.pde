class Bullet extends Player
{
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  float toLive = 5.0f;
  float x,y;
  //PVector move;
  
  Bullet()
  {
    pos.x=width/2;
    pos.y=height/2;
  }
  
  void update()
  {
    ellapsed += timeDelta;
    float lx = sin(theta);
    float ly = -cos(theta);
    //pos.x+=lx;
    //pos.y+=ly;
    if (ellapsed > toLive)
    {
      alive = false;
    }
    if(x>width||x<0)
    {
      lx=-lx;
    }
    if(y>height||y<0)
    {
      ly=-ly;
    }
    
    pos.x+=lx;
    pos.y+=ly;
    
    x=pos.x;
    y=pos.y;
    
    

    float speed = 10.0f;
    //PVector velocity = PVector.mult(move, speed);
    //pos.add(move);
 
        
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(0);
    //rect(-10,10,500,500);
    ellipse(0,-14,5,5);
    popMatrix();
  }
}