import processing.video.Movie;

private ScreenUtils screenUtils;

void setup() {
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
             if (i == buttons.length-1){
               buttons[i].click(-1);
             } else{
               showPopUpNumber = buttons[i].click(showPopUpNumber);
             }
         }
      }
      if (!buttonClicked) {
        showPopUpNumber = -1;
      }
  } else if (screenUtils.getCurrentScreen()==3){
    boolean buttonClicked = false;
    if(screen3buttons[0].isMouseOnButton()){
       buttonClicked = true;
       screenUtils.previousScreen();
    } else if(screen3buttons[1].isMouseOnButton()){
       buttonClicked = true;
       screenUtils.nextScreen();
    } else if (screen3buttons[2].isMouseOnButton()){
      buttonClicked = true;
      showPopUpNumber = screen3buttons[2].click(showPopUpNumber); //<>// //<>//
    }
    if (!buttonClicked) {
        showPopUpNumber = -1;
    }
  } else{
     screenUtils.nextScreen();
  }
    
  
}
     
  
     
    
