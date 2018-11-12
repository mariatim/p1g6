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
  }
  
  private void showScreen2(){
    background(green);
  }

  private void showScreen3(){
    background(pink);
  }
  
}
