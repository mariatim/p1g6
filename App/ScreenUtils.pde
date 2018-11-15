public class ScreenUtils{
private int currentScreen;
  
  public ScreenUtils(){
    currentScreen = 1; 
  }
  
  public void showScreen(){
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
  
  private void showScreen1(){
   background(blue);
    
  int total=10;//make 10 circles every frame
  int count=0;
  int attempts=0;
  
 while(count<total){
 circle newc = newCircle();
   if(newc !=null){
  circles.add(newc);  
  count++;
  }
  if(attempts>1000){ //when it takes 1000 tries and can't find any where to put 10 circles pr. frame it stops
  noLoop();
  
  println("FINISHED");
  break;
  }
  }
  
  //if the a cricle is touching either the edge or antoher circle it stops growing
  for(circle c : circles){ //calls an circle for every circle(c)
  if(c.growing){
  
  if(c.edges()){ //when the circle reaches the edges, growing is set to false so it stops growing
  c.growing=false;
  }else{
    for(circle other:circles){
      if(c!=other){
      
     float d=dist(c.x,c.y,other.x,other.y);
     if(d-2<c.r+other.r){
     c.growing=false;
     break;
     }
     }
   }
  }
  }
  c.show();
  c.grow();
  }
  }
  
  private void showScreen2(){
    background(green);
  }

  public void showScreen3(){
    image(screen3Background, 0, 0);
    //background(screen3Background);
  }
  
}
