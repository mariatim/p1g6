import processing.video.Movie;

private ScreenUtils screenUtils;

void setup() {
  size(1100,778);
  screenUtils = new ScreenUtils(); //creates an instance of the helper class ScreenUtils and stores it in the global variable screenUtils
  loadResources(); //loads all ressources one time, when the program is run
}

void draw() {
  screenUtils.showScreen(); //draws/shows the screen every frame, in a loop
}

public void mouseClicked(){ //method to manage the mouse click events for the different screens

  if (screenUtils.getCurrentScreen()==2){ // block to manage clicks for second screen
    boolean buttonClicked = false;
     for(int i = 0; i < buttons.length; i++){
         if (buttons[i].isMouseOnButton()){ //only handle click if the courser is on top of a button
             buttonClicked = true;
             if (i == buttons.length-1){ // for the last button
               buttons[i].click(-1); // don't show any popup (or remove any showing popup from before)
             } else{
               showPopUpNumber = buttons[i].click(showPopUpNumber); // show popup according to button
             }
         }
      }
      if (!buttonClicked) {
        showPopUpNumber = -1; // remove (if there is any)  popup text, if the user clicks anywhere on the screen
      }
  } else if (screenUtils.getCurrentScreen()==3){ //block to manage clicks for third screen
    boolean buttonClicked = false;
    if(screen3buttons[0].isMouseOnButton()){  //manage first button
       buttonClicked = true;
       screenUtils.previousScreen(); //go to previos screen
    } else if(screen3buttons[1].isMouseOnButton()){ //manage second button
       buttonClicked = true;
       screenUtils.nextScreen(); //go to next screen
    } else if (screen3buttons[2].isMouseOnButton()){ //manage third button
      buttonClicked = true;
      showPopUpNumber = screen3buttons[2].click(showPopUpNumber); //show popup for third button
    }
    if (!buttonClicked) {
        showPopUpNumber = -1; // remove (if there is any) popup text, if the user clicks anywhere on the screen
    }
  } else{ //manages clicks for first screen
     screenUtils.nextScreen(); //go to the next screen (the second one, in this case)
  }


}
