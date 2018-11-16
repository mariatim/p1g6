/**
## Screen 1 ##
**/

ArrayList<circle> circles; //uses array list since, we don't know how long the array should be
ArrayList<PVector> spots;//to make sure the circles have some where to go, PVector stores x and y spots
PImage text; //calls variable which will contain a picture

class circle{
float x; //x-position for the ellipse
float y; //y-position for the ellipse
float r; //diameter of the ellipse

boolean growing=true;

circle(float x_, float y_){
x=x_;
y=y_;
r=1;
}

void grow(){
   
if(growing){ //if the growing = true then the circle expands
r=r+1; //makes the radius of the circle grow by 1
}
}

boolean edges(){
return(x+r>width||x-r<0||y+r>height||y-r<0);//if any of these statements is fulfilled it will return true and stop growing, since the boolean is false. 

}
  
  void show(){ //draws the ellipse
    stroke(255);
    noFill();
  ellipse(x,y,r*2,r*2);
  }
  
}
//makes a function which contains the same as the class for circle
circle newCircle(){
  int r=int(random(0,spots.size())); //makes the radius of the circles random, between 0 and within the parameters set in the top, which is it should be within the pixels of the picture
  PVector spot=spots.get(r);
  
  float x= spot.x;  //x-position within the pixels of the picture                //random(width);
  float y= spot.y;  //y-postion within the pixels of the picture                //random(height);
  
  boolean valid=true; //makes the circles valid CHEK UP ON
  for(circle c: circles){
  float d= dist(x,y,c.x,c.y); //meassures the distance of the x and y position between the circle and the picture
  if(d<c.r){ //if the distance is smaller than the radius of the circle valid is set to false
    valid=false;
    break;
  }
    
  }
  
  if(valid){ // if the circle is valid then is will make a new circle
    return new circle(x,y); //find new places for circle if not then null(make no circles)
    
  //circles.add(new circle(x,y));
  } else{
  return null;  
  }
}
class button{
  boolean click;
  int x=width/2;
  int y=height/2+200;
  int r=100;
  
 button(){
   
 }
  
  
  void show(){
    noFill();
    stroke(#E8E45B);
    strokeWeight(15);
  ellipse(x,y,r,r);
  textSize(15);
  text("click here",x-32,y);
  }
  
  void pressed(){
  if(mouseX==x+r/2||mouseY==y+r/2&&mousePressed==true){
    //if(mousePressed==true){
    rect(x,y,width/2,height/2);
    //}
  }
  }
  /*void mouseClicked(){
  if(dist(mouseX,mouseY,x,y) <= r/2&&click == false){
    click=true;
   
  }*/
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
  
  public PImage menuScreen3;
  
  int randomNumber;

  public class Avatar{
    
  private PImage[] picture;
  private float xCoordinates;
  private float yCoordinates;
  private String name; 
  private boolean isMainAvatar;
  
  public Avatar(PImage[] picture, float xCoordinates, float yCoordinates, String name){
  this.picture = picture;
  this.xCoordinates = xCoordinates;
  this.yCoordinates = yCoordinates;
  this.name = name; 
  this.isMainAvatar = false;
  for (PImage image : picture){
    image.resize(300, 200);
  }
  }
  
  public void showAndBlink(){
  if (isMainAvatar){
      manageMainAvatar();
  }
  randomNumber = (int) random(0, 100);
  if (randomNumber < 10){
    show(picture[1]);
  } else {
    show(picture[0]);
  }
    showName();
  }
  
  private void show(PImage image){
    image(image, xCoordinates, yCoordinates);
  }
  
  private void showName(){
    textSize(20);
    fill(white);
    text(name, xCoordinates + 90, yCoordinates + 30); //+90 because the picture is not cropped
  }
  
  private void makeMainAvatar(){
    isMainAvatar = true;
  }
  
  private void manageMainAvatar(){
    stroke(green);
    fill(green);
    ellipse(getCenterCoordinates()[0], getCenterCoordinates()[1], 120, 120);
    if (overCircle(getCenterCoordinates()[0], getCenterCoordinates()[1], 120)){
       showMainCharacterMenu();
    }
  }
  
  private void showMainCharacterMenu(){
    println("OVER!!!");
   image(menuScreen3, getCenterCoordinates()[0] - 75, getCenterCoordinates()[1] + 40);
  }
  
  private float[] getCenterCoordinates(){
    return new float[]{xCoordinates + 140, yCoordinates + 100};
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
  
  menuScreen3 = loadImage("pics/screen3/rect.png");
  menuScreen3.resize(150, 300);
  
  //Avatar 3 is the user's avatar
  avatarsXCoordinates = new float[] {2 * width/8, 3 * width/8, 6 * width/8, 4 * width/8};
  
  avatarsYCoordinates = new float[] {height/16, height/16, height/4, height/16};
  
  avatars = new Avatar[] {
                new Avatar(avatar1, avatarsXCoordinates[0], avatarsYCoordinates[0], "FirstName"), 
                new Avatar(avatar2, avatarsXCoordinates[1], avatarsYCoordinates[1], "SecondName"), 
                new Avatar(avatar3, avatarsXCoordinates[2], avatarsYCoordinates[2], "YourName"),
                new Avatar(avatar4, avatarsXCoordinates[3], avatarsYCoordinates[3], "ThirdName")
              };
              
  avatars[2].makeMainAvatar();
  
}
