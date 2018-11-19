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
  PVector spot=spots.get(r); //get a spot out of the arraylist spot
  
  float x= spot.x;  //x-position within the pixels of the picture                //random(width);
  float y= spot.y;  //y-postion within the pixels of the picture                //random(height);
  
  boolean valid=true; //makes the circles valid, to use to make sure a circle is not made inside another circle
  for(circle c: circles){
  float d= dist(x,y,c.x,c.y); //the distance between the circles so they are not touching  meassures the distance of the x and y position between the circle and the picture
  if(d<c.r){ //if the distance is smaller than the radius of the circle valid is set to false, so it won't make a circle inside a circle
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
    stroke(yellow);
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

public Button2[] buttons; 
public int numberOfButtons;
public int rectSize; 
public String[] popUpTexts;

public class Button2{
private float xCoordinates;
private float yCoordinates;
private int size;
private color[] buttonColor;
private boolean clicked = false;
private String buttonText;

public Button2(float xCoordinates, float yCoordinates, String text){
  this.xCoordinates = xCoordinates; 
  this.yCoordinates = yCoordinates; 
  size = 90;
  buttonText = text;
  buttonColor = new color[]{
    color(blue),
    color(yellow)
  };
}

public void show(){
  manageHover();
  rect(xCoordinates, yCoordinates, size, size);
  showText();
}

private void showText(){
  fill(pink);
  textSize(15);
  textAlign(CENTER, CENTER);
  text(buttonText, xCoordinates, yCoordinates, size, size);
}

private void manageHover(){
if (isMouseOnButton()) {
    fill(buttonColor[1]);
  } else{
    fill(buttonColor[0]);
  }
}

public void click(int i){
  if (isMouseOnButton()) {
    System.out.format("I clicked: %d; \n", i);
    clicked = true;
  } 
}

private boolean isMouseOnButton(){
 if ((mouseX >= xCoordinates) && (mouseX <= (xCoordinates + size)) && 
      (mouseY >= yCoordinates) && (mouseY <= yCoordinates+height)) {
      return true;
      } else {
      return false; 
      }
}
  
}


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
  
  public PImage commentBox1; 
  
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
  manageMainAvatar();
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
    text(name, xCoordinates + 110, yCoordinates + 30); //+90 because the picture is not cropped
  }
  
  private void makeMainAvatar(){
    isMainAvatar = true;
  }
  
  private void manageMainAvatar(){
  if (isMainAvatar){
    stroke(green);
    fill(green);
    ellipse(getCenterCoordinates()[0], getCenterCoordinates()[1], 120, 120);
    if (overCircle(getCenterCoordinates()[0], getCenterCoordinates()[1], 120)){
       showMainCharacterMenu();
    }
  } else{
    strokeWeight(3);
    stroke(green);
    noFill();
    ellipse(getCenterCoordinates()[0], getCenterCoordinates()[1], 120, 120);
    if (overCircle(getCenterCoordinates()[0], getCenterCoordinates()[1], 120)){
       showComment();
    }
  }
   
  }
  
  private void showMainCharacterMenu(){
   image(menuScreen3, getCenterCoordinates()[0] - 75, getCenterCoordinates()[1] + 40);
  }
  
  private void showComment(){
    println("OVER!!!");
    image(picture[2], width/32, 6*height/16);
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
 text=loadImage("pics/screen1/p1_text2.png"); //sets in the picture, is is not shown, but the pixels are read, so the circles know where to go
 text.loadPixels();//to read the pixels of the image
  //a loop that looks at the pixels of the picture
 for(int x=0; x<text.width;x++){//to make it loop inside the pictures pixels on the x-position
 for(int y=0;y<text.height;y++){//to make it loop inside the pictures pixels on the y-posiiton
 int index=x+y*text.width;//the column + the row times how wide it is 
 color c=text.pixels[index];//registering the color within the parameters stated above
 float b=brightness(c);//extracts the brightness from the pixels in the picture
 if(b>1){
 spots.add(new PVector(x,y));
 }
 }
 }
 circles= new ArrayList<circle>();

/**
## Screen 2 ##
**/

numberOfButtons = 9;
  rectSize = 90;
  buttons = new Button2[9];
  
  String[] buttonTexts = {
    "Social Anxiety Disorder",
    "AR",
    "Biblio therapy",
    "Our vision",
    "---",
    "---",
    "---",
    "---",
    "Demo"
  };
  
  int numberToAdd = -4; 
  for(int i = 0; i < numberOfButtons; i++){
    int xCoordinates = width/2 - rectSize/2 + rectSize * numberToAdd; 
    int yCoordinates = height - rectSize;
    buttons[i] = new Button2(xCoordinates, yCoordinates, buttonTexts[i]);
    numberToAdd++; 
  }
  
  popUpTexts = new String[]{
  "Social anxiety disorder \n Social anxiety disorder is a huge problem for the individual. Anxieties in general, including phobias, can become crippling handicaps if not properly treated, and some suffer from these irrational fears all of their life. Social anxiety disorder relates to the suffers' fear of other people, or other people's reactions to them, in a social capacity. There are a long list of symptoms ranging from physical discomforts to panic attacks.",
  "AR \n AR is short for Augmented Reality, and is the idea of layering an image of something unreal over a real image in real time. An example of an AR game would be Pokémon GO, in which the players physically walk around, get alerted to Pokémon nearby, and can see an animated Pokémon standing nearby them through their phone's camera, after which they can catch it. Another example could is MagicLeap, a pair of AR glasses, that let you see the real world through them, but overlayed with interactive elements. These come with a small remote, so you can doodle in AR while seeing the real world behind your doodle.",
  "Bibliotherapy \n Bibliotherapy is a therapy form that relies on books. The idea is for the patient to be guided by a therapist to find relatable characters and passages in books pertaining to their issues and through this learn to cope with their own situation. An example would be, that if you are feeling socially awkward, you can read about a character, who is also socially awkward, but overcomes it in the book, and thereby learn from their experiences, or get enlightened about the fact, that there is a chance to get better.",
  "Our vision \n Our vision is to combine AR and bibliotherapy. We want to make a tool, which relies on AR glasses and which allows patients to take notes about meaningful passages on their own, which could be shared with others during a therapist guided AR therapy session. Our hope is, that patients with social anxiety will benefit from bibliotherapy presented in an AR setting. This would give them a measure of anonymity, they would not have to leave their homes and they would hopefully feel more safe in this setting, but they would still be participating in therapist guided group therapy, centered around books, and therefore give them positive experiences with each other, as well as learn from the books they read."
  };



/**
## Screen 3 ##
**/

//Pictures

  //background picture
  screen3Background = loadImage("pics/screen3/background.jpg");
  
  //avatars
  avatar1 = new PImage[]{
    loadImage("pics/screen3/avatars/A1_1.png"),
    loadImage("pics/screen3/avatars/A1_2.png"),
    loadImage("pics/screen3/commentBox1.png")
  };
  
  avatar2 = new PImage[]{
    loadImage("pics/screen3/avatars/A2_1.png"),
    loadImage("pics/screen3/avatars/A2_2.png"),
    loadImage("pics/screen3/commentBox1.png")
  };
  
  avatar3 = new PImage[]{
    loadImage("pics/screen3/avatars/A3_1.png"),
    loadImage("pics/screen3/avatars/A3_2.png")
  };
  
  avatar4 = new PImage[]{
    loadImage("pics/screen3/avatars/A4_1.png"),
    loadImage("pics/screen3/avatars/A4_2.png"),
    loadImage("pics/screen3/commentBox1.png")
  };
  
  menuScreen3 = loadImage("pics/screen3/rect.png");
  menuScreen3.resize(150, 300);
 
  
  //Avatar 3 is the user's avatar
  avatarsXCoordinates = new float[] {2 * width/8, 3 * width/8, 6 * width/8, 4 * width/8};
  
  avatarsYCoordinates = new float[] {height/16, height/16, height/4, height/16};
  
  avatars = new Avatar[] {
                new Avatar(avatar1, avatarsXCoordinates[0], avatarsYCoordinates[0], "Lucas"), 
                new Avatar(avatar2, avatarsXCoordinates[1], avatarsYCoordinates[1], "Emilie"), 
                new Avatar(avatar3, avatarsXCoordinates[2], avatarsYCoordinates[2], "Milla"),
                new Avatar(avatar4, avatarsXCoordinates[3], avatarsYCoordinates[3], "Rasmus")
              };
              
  avatars[2].makeMainAvatar();
  
}
