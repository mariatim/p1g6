private ScreenUtils screenUtils;

void setup() {
  fullScreen();
  //size(400, 400);
  screenUtils = new ScreenUtils();
}

void draw() {
  screenUtils.showScreen();
}
     

public void mouseClicked(){
  screenUtils.nextScreen();
}
     
  
     
    
