class Instructions extends PApplet
{
  
  public Instructions()
  {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings()
  {
    size(400, 400);
  }

  public void setup()
  {
    surface.setTitle("Instructions");
  }

  public void draw()
  {
    background(instr);
    fill(255,0,0);

    text("To interact with loading menu: \n" +
      "Click on SHOW/HIDE details\n" +
      "This will display the files that are currently loading", width/13, height/12);

    text("To interact with the menu: \n" +
      "Use LEFT and RIGHT arrow to navigate \n" +
      "Use ENTER to select the sphere", width/13, height/4);

    text("To interact with the bike: \n" +
      "Use MOTION, place your hand in front of the monitor\n" +
      "In front of the left hand side of the monitor bike will turn left \n" +
      "Right hand side of the monitor bike will turn right\n" +
      "Press SPACE to show circles on the bike\n" +
      "If pressed, point at the circle to visualize the data\n"
      + "Press 1 to go back to menu", width/13, height/2.5);
  }
}