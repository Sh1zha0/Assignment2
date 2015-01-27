class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  float theta;
  color colour;
  float s=1.1;
  boolean alive;
  float ellapse=0.0f;
  float fireRate=10.0f;
  float toPass=1.0f/fireRate;
  float timeDelta=1.0f/60.0f;
  float lx,ly;
  int i;
  
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
    theta=0;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    ellapse+=timeDelta;
    float lx,ly;
    lx = sin(theta);
    ly = cos(theta);
    if (checkKey(up))
    {
      //if(pos.x<width-12&&pos.x>12&&pos.y<height-12&&pos.y>12)
      //{
      pos.x += lx;
      pos.y -= ly;
      /*}
      else
      {
      pos.y +=ly*2;
      pos.x -=lx*2;
      }*/
    }
    if (checkKey(down))
    {
      if(pos.x<width-12&&pos.x>12&&pos.y<height-12&&pos.y>12)
      {
      /*for(i=0;i<block.size();i++)
      {
        if(dist(pos.x,0,block[i].x,0)>0&&dist(0,pos.y,0,block[i].y)>block[i].w)
      {*/
      pos.y +=ly;
      pos.x -=lx;
      /*}
      }*/
      }
      else
      {
      pos.y -=ly*2;
      pos.x +=lx*2;
      }
    }
    if (checkKey(left))
    {
     // pos.x -= 0.1f;
     theta-=0.1f;
    }    
    if (checkKey(right))
    {
      //pos.x += 0.1f;
      theta+= 0.1f;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
      if(ellapse>toPass)
      {
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.theta = theta;
      players.add(bullet);
      ellapse=0.0f;
      }
      
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  
  void display()
  {    
    pushMatrix();
    translate(pos.x,pos.y);   
    rotate(theta);
    stroke(colour);
    fill(colour);  
   
    rect(-10,-10,20,20);
    fill(random(255));
    rect(-10,-10,5,20);
    fill(random(0,255));
    rect(5,-10,5,20);
    fill(random(0,255));
    rect(-10,-10,5,3);
    rect(-10,-3,5,3);
    rect(-10,3,5,3);
    fill(random(0,255));
    rect(-10,6,5,3);
    rect(5,-10,5,3);
    rect(5,-3,5,3);
    rect(5,3,5,3);
    rect(5,6,5,3);
    stroke(100);
    fill(200,200,155);
    arc (0, 5, 8, 20, PI, PI*2); 
    rect(-1,-15,3,10);
    popMatrix();
}  

    /*boolean collides(block b)
  {
    // Its easier to check if they DONT colide
    if (b.x + b.w < pos.x)
    {
      return false;
    }
    if (b.x > pos.x + 20)
    {
      return false;
    } 
    
    if (b.y > pos.y +20)
    {
      return false;
    }
    
    if (b.y + b.h < pos.y)
    {
      return false;
    }
    // If none of the above then there is a collision
    return true;
    
  }*/
  
}
