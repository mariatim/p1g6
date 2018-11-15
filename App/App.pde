private ScreenUtils screenUtils;

void setup() {
  //fullScreen();
  size(3508, 4961);
  screenUtils = new ScreenUtils();
  loadResources();
}

void draw() {
  screenUtils.showScreen3();
  //screenUtils.showScreen();
}
     

public void mouseClicked(){
 // screenUtils.nextScreen();
}
     
  
     
    
