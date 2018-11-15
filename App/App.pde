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
  screenUtils.nextScreen();
}
     
  
     
    
