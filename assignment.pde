
import ddf.minim.*;

/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/
PImage page;
ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
int stage=0;
AudioPlayer shoot;
AudioPlayer back;
Minim minim;

void setup()
{
  size(700, 500);
  page=loadImage("start.jpg");
  setUpPlayerControllers();
  minim=new Minim(this);
  back=minim.loadFile("back.mp3");
  shoot=minim.loadFile("shoot.mp3");
  back.play();
  back.loop();
}

void draw()
{
  background(255);
  if(stage==1)
  {
    image(page,0,0,700,500);
  }
  if(stage==0)
  {
  //background(0);
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
}
