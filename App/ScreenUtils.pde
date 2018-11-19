public class ScreenUtils{
private int currentScreen;
  
  public ScreenUtils(){
    currentScreen = 1; 
  }
  
  public void showScreen(){
  frameRate(20);
  if (currentScreen == 1){
  showScreen1();
  } else if (currentScreen == 2){
  showScreen2();
  } else if (currentScreen == 3){
  showScreen3();
  }
  }
  
  public void nextScreen(){
  currentScreen = (currentScreen == 3)? 1 : currentScreen + 1; 
  showScreen();
  }
  
  public void previousScreen(){
  currentScreen = (currentScreen == 1)? 1 : currentScreen - 1; 
  showScreen();
  }
  
  public int getCurrentScreen(){
    return currentScreen;
  }
  
  private void showScreen1(){
   background(blue);
    
  int total=10;//make 10 circles every frame
  int count=0;
  int attempts=0;
  //to make it find 10 new circles every frame
 while(count<total){//while the count of circles is smaller than the total number of circles per frame it will make a new circle, if the statements are true
 circle newc = newCircle();//makes the new circle
   if(newc !=null){//when the circles is not null it will add a new circle
  circles.add(newc);   //adds the new circle
  count++;//the count will go up by one each time it makes a circle
  }
  //to not make it go in an infinte loop to fin new spots, there is made an if statement to stop the loop, when it can't find new circles after 1000 tries it stops making circles
  if(attempts>1000){ //when it takes 1000 tries and can't find any where to put 10 circles pr. frame it stops
  noLoop();
  
  println("FINISHED");
  break;
  }
  }
  
  //if the a cricle is touching either the edge or antoher circle it stops growing
  for(circle c : circles){ //calls an circle for every circle(c)
  if(c.growing){//if the circle is growing it will then stop when it reaches the edges, and is set to false
  
  if(c.edges()){ //when the circle reaches the edges, growing is set to false so it stops growing
  c.growing=false;
  }else{
    for(circle other:circles){//if the statement above is not true it will make another circle 
      if(c!=other){ //it should not be the same object as other circle  if the circle(c) is not equal to circle(other) it will stop growing when it touches another circle
      
     float d=dist(c.x,c.y,other.x,other.y);//measures the distance between the circles, so they are not touching
     if(d-2<c.r+other.r){// set to minus 2 since the pixel with of the circle is 2. the the distance is smaller than the radius of the circles(c & other) growing is set to false and they will stop growing
     c.growing=false;
     break;
     }
     }
   }
  }
  }
  c.show();//makes the circle display
  c.grow();//makes the circle grow
  }
  }
  
  private void showScreen2(){
  background(green);
  for(int i = 0; i < buttons.length; i++){
    buttons[i].show();
  }  
  }

  public void showScreen3(){
    frameRate(4);
    image(screen3Background, 0, 0);
    for (Avatar avatar: avatars){
      avatar.showAndBlink();
    }
  }
 
  
}
