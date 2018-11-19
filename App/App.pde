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
     for(int i = 0; i < buttons.length; i++){
         if (buttons[i].isMouseOnButton()){
             showPopUpNumber = buttons[i].click();
         }
      }  
  } else{
     screenUtils.nextScreen();
  }
    
  
}
     
  
     
    
