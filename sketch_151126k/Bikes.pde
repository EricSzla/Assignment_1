abstract class Bikes
{
  // Fields
  int[] xyArray = new int[17];  // Stores xy position for bike ellipses
  color c; 
  int choice;
  boolean pressed = false;
  int img2;
  boolean show_points = false;
  PImage menu_image;
  PImage[] round_view = new PImage[18];
  
  
  // Variables for .csv data
  String name;
  float horsePower;
  float engineSize;
  String engineType;
  float frontSusSize;
  String frontSuspension;
  String rearSuspension;
  String frontTyre;
  String rearTyre;
  float rearBrakeDiscSize;
  String rearBrake;
  String frontBrake;
  String frame;


  Bikes()
  {
    xyArray = null;
  }


  abstract int drawBike();

  abstract void drawPoints();

  abstract void update();
}