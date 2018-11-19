private ScreenUtils screenUtils;

void setup() {
  //fullScreen();
  size(1100,778);
  screenUtils = new ScreenUtils();
  loadResources();
}

void draw() {
  screenUtils.showScreen();
}
     
public void mouseClicked(){
  
  if (screenUtils.getCurrentScreen()==2){
    boolean buttonClicked = false;
     for(int i = 0; i < buttons.length; i++){
         if (buttons[i].isMouseOnButton()){
             buttonClicked = true;
             showPopUpNumber = buttons[i].click(showPopUpNumber);
         }
      }
      if (!buttonClicked) {
        showPopUpNumber = -1;
      }
  } else{
     screenUtils.nextScreen();
  }
    
  
}
     
  
     
    
