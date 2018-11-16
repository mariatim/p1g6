/**
## Screen 1 ##
**/

ArrayList<circle> circles;
ArrayList<PVector> spots;//to make sure the circles have some where to go, PVector stores x and y spots
PImage text;

class circle{
float x;
float y;
float r;

boolean growing=true;

circle(float x_, float y_){
x=x_;
y=y_;
r=1;
}

void grow(){
   
if(growing){
r=r+1; //makes the radius of the circle grow by 1
}
}

boolean edges(){
return(x+r>width||x-r<0||y+r>height||y-r<0);//if any of these are true it will return 

}
  
  void show(){
    stroke(255);
    noFill();
  ellipse(x,y,r*2,r*2);
  }
  
}

circle newCircle(){
  int r=int(random(0,spots.size()));
  PVector spot=spots.get(r);
  
  float x= spot.x;                 //random(width);
  float y= spot.y;                 //random(height);
  
  boolean valid=true;
  for(circle c: circles){
  float d= dist(x,y,c.x,c.y);
  if(d<c.r){
    valid=false;
    break;
  }
    
  }
  
  if(valid){
    return new circle(x,y); //find new places for circle if not then null(make no circles)
    
  //circles.add(new circle(x,y));
  } else{
  return null;  
  }
}

/**
## Screen 2 ##
**/


/**
## Screen 3 ##
**/

//Pictures

  //background picture
  public PImage screen3Background;
  
  //avatars
  public PImage[] avatar1;
  
  public PImage[] avatar2;
  
  public PImage[] avatar3;
  
  public PImage[] avatar4;
  
  public Avatar[] avatars;
  
  public float[] avatarsXCoordinates;
  
  public float[] avatarsYCoordinates;
  
  int randomNumber;

  public class Avatar{
  private PImage[] picture;
  private float xCoordinates;
  private float yCoordinates;
  
  public Avatar(PImage[] picture, float xCoordinates, float yCoordinates){
  this.picture = picture;
  this.xCoordinates = xCoordinates;
  this.yCoordinates = yCoordinates;
  for (PImage image : picture){
    image.resize(300, 200);
  }
  }
  
  public void showAndBlink(){
  
  randomNumber = (int) random(0, 100);
  if (randomNumber < 10){
    show(picture[1]);
  } else {
    show(picture[0]);
  }
  }
  
  private void show(PImage image){
    image(image, xCoordinates, yCoordinates);
  }
  
  }
  
  
/**
## Load the resources ##
**/
  
public void loadResources(){
/**
## Screen 1 ##
**/
 spots= new ArrayList<PVector>();
 text=loadImage("pics/screen1/p1_text2.png");
 text.loadPixels();//to read the pixels of the image
 for(int x=0; x<text.width;x++){
 for(int y=0;y<text.height;y++){
 int index=x+y*text.width;
 color c=text.pixels[index];
 float b=brightness(c);
 if(b>1){
 spots.add(new PVector(x,y));
 }
 }
 }
 circles= new ArrayList<circle>();

/**
## Screen 2 ##
**/

/**
## Screen 3 ##
**/

//Pictures

  //background picture
  screen3Background = loadImage("pics/screen3/background.jpg");
  
  //avatars
  avatar1 = new PImage[]{
    loadImage("pics/screen3/avatars/A1_1.png"),
    loadImage("pics/screen3/avatars/A1_2.png")
  };
  
  avatar2 = new PImage[]{
    loadImage("pics/screen3/avatars/A2_1.png"),
    loadImage("pics/screen3/avatars/A2_2.png")
  };
  
  avatar3 = new PImage[]{
    loadImage("pics/screen3/avatars/A3_1.png"),
    loadImage("pics/screen3/avatars/A3_2.png")
  };
  
  avatar4 = new PImage[]{
    loadImage("pics/screen3/avatars/A4_1.png"),
    loadImage("pics/screen3/avatars/A4_2.png")
  };
  
  avatarsXCoordinates = new float[] {50, 150, 300, 500};
  
  avatarsYCoordinates = new float[] {200, 200, 200, 100};
  
  avatars = new Avatar[] {
                new Avatar(avatar1, avatarsXCoordinates[0], avatarsYCoordinates[0]), 
                new Avatar(avatar2, avatarsXCoordinates[1], avatarsYCoordinates[1]), 
                new Avatar(avatar3, avatarsXCoordinates[2], avatarsYCoordinates[2]),
                new Avatar(avatar4, avatarsXCoordinates[3], avatarsYCoordinates[3])
              };
}
