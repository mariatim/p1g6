public boolean overCircle(float x, float y, int diameter) { // helper method to determine whether something is on top of a circle
  float disX = x - mouseX;
  float disY = y - mouseY;
  return (sqrt(sq(disX) + sq(disY)) < diameter/2);
}
