class Bullet extends Player
{
  float ellapsed = 0.0;
  float timeDelta = 1.0f / 60.0f;
  float toLive = 5.0f;
  float x,y;
  float fireRate=1000f;
  float toPass=1.0f/fireRate;
  PVector posi;
  color c;
  int counter;
  //PVector move;
  
  Bullet()
  {
    pos.x=width/2;
    pos.y=height/2;
    counter=0;
  }
  
  void update()
  {
    ellapsed += timeDelta;
    float lx = 1.5*sin(theta);
    float ly = 1.5*-cos(theta);
    //pos.x+=lx;
    //pos.y+=ly;
    if (ellapsed > toLive)
    {
      alive = false;
    }
    for (int j = 4 ; j < 7 ; j ++)
    {
      block block1 = objects.get(j);
      if (collides(block1))
      {
       ly=-sin(theta-random(90,800));
       ly=ly*20;
       lx=lx*20;
        //printMessage("Rectangle " + i + " collides with " + " rect " + j);
      } 
    }
    for (int j = 7 ; j < objects.size() ; j ++)
    {
      block block1 = objects.get(j);
      if (collides(block1))
      {
       lx=cos(theta-random(100,300));
       ly=ly*20;
       lx=lx*20;
        //printMessage("Rectangle " + i + " collides with " + " rect " + j);
      } 
    }
    
    pos.x+=lx;
    pos.y+=ly;
    
    

    float speed = 10.0f;
    //PVector velocity = PVector.mult(move, speed);
    //pos.add(move);
 
        
  }
  
  void display()
  {
    pushMatrix();
    for (int j = 0 ; j < 4 ; j ++)
    {
      block block1 = objects.get(j);
      if (collides(block1))
      {
        c=0;
        counter=1;
       break;
        //printMessage("Rectangle " + i + " collides with " + " rect " + j);
      } 
      else if(counter==0)
      {
        c=200;
      }
    }
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(0);
    fill(c);
    //rect(-10,10,500,500);
    rect(0,-20,4,10);  
    for (int j = 0 ; j <2 ; j ++)
    {
      Player p1 = players.get(j);
      if (collide(p1))
      {
        if(j==0)
        {
          stage=3;
        }
        if(j==1)
        {
          stage=4;
        }
        //printMessage("Rectangle " + i + " collides with " + " rect " + j);
      } 
    }  
    popMatrix();
    
    
    
  }
    
    boolean collides(block b)
  {
    // Its easier to check if they DONT colide
    if (pos.x<b.x-2)
    {
      return false;
    }
    if (pos.x>b.x+b.w)
    {
      return false;
    } 
    
    if (pos.y<b.y-2)
    {
      return false;
    }
    
    if (pos.y>b.y+b.h)
    {
      return false;
    }
    // If none of the above then there is a collision
    return true;
    
  }
  
  boolean collide(Player b)
  {
    // Its easier to check if they DONT colide
    if (pos.x<b.pos.x-1)
    {
      return false;
    }
    else if (pos.x>b.pos.x+1)
    {
      return false;
    } 
    
    else if (pos.y<b.pos.y-1)
    {
      return false;
    }
    
    else if (pos.y>b.pos.y+1)
    {
      return false;
    }
    // If none of the above then there is a collision
    else
    {
    return true;
    }
  }
}


 
