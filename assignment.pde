
import ddf.minim.*;

/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/
PImage page;
PImage help;
PImage over1;
PImage over2;
ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
int stage=0;
AudioPlayer shoot;
AudioPlayer back;
Minim minim;
int life;

void setup()
{
  size(700, 500);
  page=loadImage("start.jpg");
  help=loadImage("help.jpg");
  over1=loadImage("p1.jpg");
  over2=loadImage("p2.jpg");
  setUpPlayerControllers();
  minim=new Minim(this);
  back=minim.loadFile("back.mp3");
  shoot=minim.loadFile("shoot.mp3");
  back.play();
  back.loop();
  backg();
  
  
}
Player[] gameObjects;
ArrayList<block> objects = new ArrayList<block>();


void draw()
{
  frameRate(60);
  background(255);
  if(stage==0)
  {
    image(page,0,0,700,500);
    if(keyPressed&&key=='q')
    {
      stage=1;
    }
    if(keyPressed&&key=='r')
    {
      stage=2;
    }
  }
  if(stage==1)
  {
  background(0);
  for(int i=0;i<players.size();i++)
  {
    players.get(i).update();
    players.get(i).display();
  }
  if(keyPressed&&key=='e'||keyPressed&&key=='p')
  {
    shoot.play();
    shoot.rewind();
  }
  
  println(frameCount);
  
  }
  if(stage==2)
  {
    image(help,0,0,700,500);
    if(keyPressed&&key=='q')
    {
      stage=1;
    }
  }
  if(stage==3)
  {
    image(over1,0,0,width,height);
    if(keyPressed&&key=='q')
    {
      stage=0;
    }
    /*for (int i=0; i<objects.size(); i++)
    {
    objects.remove(i);
    }*/ 
  }
  if(stage==4)
  {
    image(over2,0,0,width,height);
    /*for (int i=0; i<objects.size(); i++)
    {
    objects.remove(i);
    } */
    if(keyPressed&&key=='q')
    {
      stage=0;
    }
    
  }
}

void backg()
{
  for (int i = 0 ; i <10 ; i ++)
  {
    if(i==0)
    {
    block block = new block(20,100, 660,12,255,233,255);
    players.add(block);
    objects.add(block);
    } 
    if(i==1)
    {
    block block = new block(20,100, 12,300,255,233,255);
    players.add(block);
    objects.add(block);
    } 
    if(i==2)
    {
    block block = new block(20,400, 660,12,255,233,255);
    players.add(block);
    objects.add(block);
    } 
    if(i==3)
    {
    block block = new block(670,100, 12,300,255,233,255);
    players.add(block);
    objects.add(block);
    } 
    if(i>3&&i<7)
    {
    block block = new block(random(80,580),random(120,170), random(5,7),random(100,150),(int)random(0,255),(int)random(0,255),(int)random(0,255));
    players.add(block);
    objects.add(block);
    }
    if(i>6)
    {
    block block = new block(random(80,520),random(200,380), random(100,150),random(5,7),(int)random(0,255),(int)random(0,255),(int)random(0,255));
    players.add(block);
    objects.add(block);
    }
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i*8+1) * width/10;
    p.pos.x = x;
    p.pos.y = 250;
   players.add(p);         
  }
  
  /*for(int i = 0 ; i < players.size() ; i ++)
  {
    Player player1 = players.get(i);
    for (int j = 0 ; j < objects.size() ; j ++)
    {
      block block1 = objects.get(j);
      if (player1.collides(block1))
      {
        player1.pos.y +=player1.ly*2;
        player1.pos.x -=player1.lx*2;
        //printMessage("Rectangle " + i + " collides with " + " rect " + j);
      }  
    }
  }*/
  
}
