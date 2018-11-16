public boolean overCircle(float x, float y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
   return (sqrt(sq(disX) + sq(disY)) < diameter/2);
}
