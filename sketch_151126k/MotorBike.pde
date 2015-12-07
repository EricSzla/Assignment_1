class MotorBike extends Bikes
{
  String images;


  MotorBike(String lines, int[] xyArray)
  {
    // Load .csv data
    String[] elements = lines.split(",");
    name = elements[0];
    horsePower = Float.parseFloat(elements[1]);
    engineSize = Float.parseFloat(elements[2]);
    engineType = elements[3];
    frontSusSize = Float.parseFloat(elements[4]);
    frontSuspension = elements[5];
    rearSuspension = elements[6];
    frontTyre = elements[7];
    rearTyre = elements[8];
    rearBrakeDiscSize = Float.parseFloat(elements[9]);
    rearBrake = elements[10];
    frontBrake = elements[11];
    frame = elements[12];

    menu_image = loadImage("menu_bikes/" + name + ".jpg", "jpg");
    menu_image.resize(width, height);

    // Load images for 360 view
    for (int j = 1; j < 18; j++)
    {
      images  = j + ".png";

      round_view[j] = loadImage(name +"/" + images, "png");
      round_view[j].resize(width, height);
    }

    this.xyArray = xyArray;
  } // End of constructor


  // Method that draws the bike
  int drawBike()
  {
    if (!pressed)
    {
      background(round_view[1]);
      pressed = true;
      return 1;
    } else if (ballcount == 1)
    {
      img2--;
      if (img2 <= 1)
      {
        img2 = round_view.length-1;
      }
      // background(round_view[img2]);
    } else if ( ballcount ==2)
    {
      img2++;
      if (img2 >= round_view.length-1)
      {
        img2 = 1;
      }
      //background(round_view[img2]);
    } else if (keyPressed)
    {
      int k = key - '0';

      if (k >= 1 && k <= 5)
      {
        pressed = false;
      }
    }

    ballcount = 0;
    return img2;
    
  }//End of draw bike()


  // This methods draws points on the bikes
  void drawPoints()
  {
    float ellipseWidth = 15;
    background(round_view[1]);

    stroke(255, 0, 0);
    fill(255);
    ellipse(xyArray[0], xyArray[1], ellipseWidth, ellipseWidth);
    ellipse(xyArray[2], xyArray[3], ellipseWidth, ellipseWidth);
    ellipse(xyArray[4], xyArray[5], ellipseWidth, ellipseWidth);
    ellipse(xyArray[6], xyArray[7], ellipseWidth, ellipseWidth);
    ellipse(xyArray[8], xyArray[9], ellipseWidth, ellipseWidth);
    ellipse(xyArray[10], xyArray[11], ellipseWidth, ellipseWidth);
    ellipse(xyArray[12], xyArray[13], ellipseWidth, ellipseWidth);
    ellipse(xyArray[14], xyArray[15], ellipseWidth, ellipseWidth);

    noStroke();
    noFill();
  }

  // Method which displays informations when user points the mouse on the ellipses
  void update()
  {
    if (show_points)
    {
      float x = 15;
      float y = 15;
      fill(0, 255, 0);
      text("Specifications: ", x, y);
      if ((mouseX <= xyArray[0]+5 && mouseX >= xyArray[0]-5) 
        && (mouseY <= xyArray[1]+5 && mouseY >= xyArray[1]-5))
      {
        // Display the bike name and tyre size

        // Draw the front tyre and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        translate(x*17, y*3);
        rotateZ(TWO_PI*frameCount/500);
        shape(tyres);
        popMatrix();

        fill(c);
        text("Name : " + name + "\nPart: Front Tyre " + "\nFront Tyre Size: " + frontTyre, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }// End of mouse over frontTyre       
      else if ((mouseX <= xyArray[2]+5 && mouseX >= xyArray[2]-5) 
        && (mouseY <= xyArray[3]+5 && mouseY >= xyArray[3]-5))
      {

        // Draw the rear tyre and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        translate(x*15, y*3);
        rotateZ(TWO_PI*frameCount/500);
        shape(tyres);
        popMatrix();

        fill(c);
        text("Name : " + name + "\nPart: Rear Tyre" + "\nRear Tyre: " + rearTyre, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }// end of mouse over rear tyre
      else if ((mouseX <= xyArray[4]+5 && mouseX >= xyArray[4]-5) 
        && (mouseY <= xyArray[5]+5 && mouseY >= xyArray[5]-5))
      {
        // Draw the engine and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        if (choice == 1)
        {
          translate(x*15, y*3);
        } else if (choice == 2)
        {
          translate(x*5, y*9);
        } else if (choice == 3)
        {

          translate(x*5, y*9);
        }

        rotateZ(TWO_PI*frameCount/500);
        shape(engine);
        popMatrix();

        fill(c);
        text("Part: Engine" + "\nEngine Size: " + engineSize + " cc"
          + "\nEngine Type: " + engineType + "\nHorse Power: " + horsePower
          , x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }// end of mouse over engine
      else if ((mouseX <= xyArray[6]+5 && mouseX >= xyArray[6]-5) 
        && (mouseY <= xyArray[7]+5 && mouseY >= xyArray[7]-5))
      {

        // Draw the frame and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        if (choice == 1)
        {
          translate(x*15, y*3);
          fill(0, 0, 255);
        } else if (choice == 2)
        {
          translate(x*5, y*7);
          fill(0, 255, 0);
        }
        rotateZ(TWO_PI*frameCount/500);
        shape(frame_obj);
        popMatrix();


        fill(c);
        text("Name : " + name + "\nFrame: " + frame, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      } // end of mouse over frame
      else if ((mouseX <= xyArray[8]+5 && mouseX >= xyArray[8]-5) 
        && (mouseY <= xyArray[9]+5 && mouseY >= xyArray[9]-5))
      {

        // Draw the rear brake and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        if (choice == 1)
        {
          translate(x*16, y*2);
          fill(0, 0, 255);
        } else if (choice == 2)
        {
          translate(x*18, y*2);
          fill(0, 255, 0);
        } else if ( choice == 3)
        {
          translate(x*16, y*2);
          fill(255, 200, 0);
        }
        rotateZ(TWO_PI*frameCount/500);
        shape(brakes);
        popMatrix();

        fill(c);
        text("Name : " + name + "\nRear Brake: " + rearBrake, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }// end of mouse over rear brake
      else if ((mouseX <= xyArray[10]+5 && mouseX >= xyArray[10]-5) 
        && (mouseY <= xyArray[11]+5 && mouseY >= xyArray[11]-5))
      {

        // Draw the front brake and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        if (choice == 1)
        {
          translate(x*20+10, y*2);
          fill(0, 0, 255);
          rotateZ(TWO_PI*frameCount/500);
          shape(brakes);
        } else if (choice == 2)
        {
          translate(x*5, y*6);
          stroke(0);
          fill(0, 255, 0);
          rotateZ(TWO_PI*frameCount/500);
          shape(ninjaBrakes);
        } else if (choice == 3)
        {
          translate(x*3, y*6);
          stroke(0);
          fill(255, 200, 0);
          rotateZ(TWO_PI*frameCount/500);
          shape(ninjaBrakes);
        }
        popMatrix();


        fill(c);
        text("Name : " + name + "\nFront Brake: " + frontBrake, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }//end of mouse over front brake
      else if ((mouseX <= xyArray[12]+5 && mouseX >= xyArray[12]-5) 
        && (mouseY <= xyArray[13]+5 && mouseY >= xyArray[13]-5))
      {

        // Draw the rear suspension and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        translate(x*12, y*2);
        rotateZ(TWO_PI*frameCount/500);
        fill(255, 0, 0);
        shape(suspension);
        popMatrix();

        fill(c);
        text("Name : " + name + "\nPart: Rear Suspension" + "\nRear Suspension: " + rearSuspension, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }// end of mouse over rear suspension
      else if ((mouseX <= xyArray[14]+5 && mouseX >= xyArray[14]-5) 
        && (mouseY <= xyArray[15]+5 && mouseY >= xyArray[15]-5))
      {

        // Draw the front suspension and rotate it
        pushMatrix();
        background(round_view[1]);
        drawPoints();
        translate(x*12, y*2);
        rotateZ(TWO_PI*frameCount/500);
        fill(255, 215, 0);
        shape(suspension);
        popMatrix();

        fill(c);
        text("Name : " + name + "\nPart: Front Shock" + "\nFront Suspension: " + frontSuspension, x*2, y*2);
        fill(0, 255, 0);
        text("Specifications: ", x, y);
      }// end of mouse over front suspension
      else {
        background(round_view[1]);
        drawPoints();
      }
    }// End of if show_points
    noFill();
    noStroke();
  }// End of update()
}    // End of class
