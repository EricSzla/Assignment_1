import ddf.minim.*;
import processing.video.*;

Movie myMovie = null;
Graph hpGraph = null;
Bikes c = null;
Minim m;
AudioPlayer audio;
Instructions inst;

ArrayList<Bikes> bArray = new ArrayList<Bikes>();

// Variables for menu
float rotateZ = 0; //for rotating the spheres
float frame = 0;
int count = 0;
float rot = 0; //for rotating the menu i.e changing 1 sphere to another when arrow key is pressed
int crot = 0; //counter when spheres are rotated
int counter = 0; //so that arrow key wouldn't be sensitive when pressed
int spacecount = 0;
int loadcount = 0;
int img = 2;

boolean userChoice = true;
boolean update = false;
boolean finished = false;
boolean show = false;
boolean draw = false;
boolean plays = false;
boolean graph = false;

float percent = 0;
String file = "Files";
String details = "Show Details";
float theta = 0;
float circlecount = 0;

// Arrays for coordinates
int[][] xxyArray;

// Creates PShape variables to load .obj files
PShape engine;
PShape frame_obj;
PShape tyres;
PShape brakes;
PShape ninjaBrakes;
PShape suspension;
PShape menu_rect;
PImage eyes;
PImage graphimg;
PImage instr;
PVector v1;

Capture video;
PImage prevFrame;
float threshold = 150;
int Mx = 0;
int My = 0;
int ave = 0;

int ballX = width/2;
int ballY = height/2;
int rsp = 5;
int ballcount = 0;
int ballcount1 = 0;

void settings()
{
  size(670, 400, P3D);
}

void setup()
{
  //size(670, 400, P3D);
  surface.setTitle("Motorbike Visualisation");
  instr = loadImage("menu_bikes/inst.jpg");
  instr.resize(400,400);
  inst = new Instructions(); // Instructions menu
  
  // Start on capturing the images
  video = new Capture(this, 640, 380, 30);
  video.start();
  prevFrame = createImage(video.width, video.height, RGB);

  // Load the movie
  myMovie = new Movie(this, "yamahar1.mov");
  // Loop the movie
  myMovie.loop();

  xxyArray = new int[][]{
    {590, 240, 85, 240, 340, 220, 412, 136, 145, 240, 495, 265, 290, 180, 500, 200}, 
    {610, 240, 85, 240, 350, 216, 391, 160, 145, 240, 510, 265, 290, 180, 520, 200}, 
    {610, 240, 85, 240, 350, 216, 391, 143, 145, 240, 510, 240, 290, 180, 515, 190}
  };

  // Load data
  thread("loadData");
}


void draw()
{
  if (!finished)
  {
    image(myMovie, 0, 0, width, height);
    textAlign(LEFT);
    stroke(255);
    noFill();
    rect(width/2-150, height/2, 300, 10);
    fill(255, 0, 0);
    // The size of the rectangle is mapped to the percentage completed
    float w = map(percent, 0, 1, 0, 30);
    rect(width/2-150, height/2, w, 10);
    fill(255);
    text("Loading", width/2-15, height/2-15);
    fill(0);
    rect(width/2-150, height/2+15, 100, 15);
    fill(255);
    text(details, width/2-140, height/2+28);
    if (mousePressed)
    {
      loadcount++;
      if ((mouseX >= 185 && mouseX <= 285) && (mouseY >=215 && mouseY <= 235) && loadcount >=6)
      {
        loadcount = 0;
        if (show)
        {
          details = "Show Details";
        } else if (!show)
        {
          details = "Hide Details";
        }

        show = !show;
      }
    }

    if (show)
    {
      fill(200);
      rect(width/2-150, height/2+50, 300, 20);
      fill(0);
      textAlign(LEFT);
      text("Loading file: " + file, width/2-140, height/2+64);
    }
  } else
  { 

    textAlign(LEFT);

    if (draw)
    {
      if (plays)
      {
        audio.rewind();
        audio.play();
        plays = false;
      }
      img = c.drawBike();
      move();
    }
    if (update)
    {
      c.update();
    }
    if (userChoice && finished)
    {
      println("To interact with the menu use LEFT and RIGHT arrow");
      println("Press ENTER to select");
      menu();
    }


    if (keyPressed)
    {
      update = false;

      if (key == '1')
      {
        userChoice = true;
        draw = false;
        graph = false;
        img = 0;
      } else if (key == ' ')
      {
        spacecount++;
        if (c != null && userChoice == false && graph == false && spacecount >=6 )
        {

          c.show_points = !c.show_points;           // Change the counter

          if (c.show_points)                        // If show_points then draw the points
          {
            c.drawPoints();
            update = true;
          } else                                    // If not then come back to original background
          {                                         // Used to switch off the points if user clicks enter for the the second time
            background(c.round_view[1]);
            update = false;
            spacecount = 0;
          }
        }
      } else if (key == ENTER && !draw)
      {
        if (circlecount !=3  && frame == 0)
        {
          if (circlecount == 0)
          {
            c = bArray.get(0);
          }
          if (circlecount == 1)
          {
            c = bArray.get(1);
          }
          if (circlecount == 2)
          {
            c = bArray.get(2);
          }

          c.pressed = false;
          draw = true;
          userChoice = false;
          plays = true;
        } else if (circlecount == 3)
        {
          hpGraph.pieChart();
          graph = true;
          userChoice = false;
        }
      }// end of if key == ENTER

      theta += 0.1f;
    }// End of keyPressed
  }

  if (ballX < width/2)
  {
    ballcount = 1;
    ballX = width/2;
  } else if (ballX > width/2)
  {
    ballcount = 2;
    ballX = width/2;
  }
} // end of draw


void loadData()
{
  percent = 0;
  //Setup bikes
  setupBikes();

  file = "eyes.jpg";
  eyes = loadImage("menu_bikes/eyes.jpg", "jpg");
  eyes.resize(width, height);
  percent = 1;
  
  file = "pieChart.png";
  graphimg = loadImage("menu_bikes/pie-sample.png");
  percent = 1.5;

  // Load .obj files
  file = "engine.obj";
  engine             = loadShape("objects/engine/engine.obj");
  percent = 2;
  file = "frame.obj";
  frame_obj          = loadShape("objects/frame/frame.obj");
  percent = 3;
  file = "neumatico.obj";
  tyres              = loadShape("objects/tires/Neumatico.obj");
  percent = 4;
  file = "brembo.obj";
  brakes             = loadShape("objects/brakes/brake/brakes/brembo.obj");
  percent = 5;
  file = "shock.obj";
  suspension         = loadShape("objects/suspension/shock.obj");
  percent = 6;
  file = "brakes.obj";
  ninjaBrakes        = loadShape("objects/brakes/brake/brakes/brembo.obj");
  percent = 7;

  file = "yamaha.mp3";
  m = new Minim(this);
  audio = m.loadFile("audio/Yamaha R1.mp3");
  println("\n\n\n\n\n\n");
  percent = 8;

  // Adjust obj files
  frame_obj.disableStyle();
  frame_obj.scale(0.5);
  percent = 9;
  suspension.disableStyle();
  suspension.scale(0.05);
  percent = 9.25;
  brakes.disableStyle();
  brakes.scale(0.1);
  ninjaBrakes.disableStyle();
  ninjaBrakes.scale(0.15);
  percent = 9.50;


  userChoice = true;


  // Initialize hpGraph
  hpGraph = new Graph();
  percent = 10;

  finished = true;
} // End of loadData()

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

void setupBikes()
{
  bArray.clear();
  color col = color(0, 255, 0);
  int input = 0;

  String[] lines = loadStrings("bikes.csv");
  for (int i =1; i < lines.length; i++)
  {

    if (i == 1)
    {                                          
      col = color(255);
      input = 1;
    } else if ( i == 2)
    {
      col = color(255);
      input = 2;
    } else if ( i == 3)
    {
      col = color(0);
      input = 3;
    }

    Bikes a = new MotorBike(lines[i], xxyArray[i-1]);
    a.c = col;
    a.choice = input;
    bArray.add(a);

    percent = float (i)/ lines.length;
    file = "CSV file: " + i + "/" + (lines.length-1);
  }
}

void menu()
{
  sphereDetail(30);

  // This plays the movie
  image(myMovie, 0, 0, width, height);
  float border = 50; 

  // Transparent rectangle in the menu
  tint(255, 150);
  image(eyes, 0, height/2-border*2, width, height/2-border);
  tint(255, 255);


  // Start of 3D spheres
  translate(width/2, border*4-border/2);
  rotateX(1.5);
  rotateZ(1.55);
  fill(255);
  noFill();
  noStroke();
  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == LEFT)
      {
        if (counter > 5)
        {

          crot = 1;
          counter = 0;
        }


        counter++;
      } else if (keyCode == RIGHT)
      {
        if (counter > 5)
        {
          crot = 2;
          counter = 0;
        }


        counter++;
      }
    }
  }

  if (crot == 1)
  {

    if (frame < 125.0f)
    {
      count = 0;
      frame+=1.0f; 
      rotateZ = (rot + TWO_PI * frame/500);
    }
    if (frame == 125.0f)
    {
      count = 1;
      crot = 0;
      frame = 0;
      rot += TWO_PI / 4;
      circlecount--;
      if (circlecount < 0)
      {
        circlecount = 3;
      }
    }
  }

  if (crot == 2)
  {

    if (frame < 125.0f)
    {
      count = 0;
      frame+=1.0f; 
      rotateZ = (rot - TWO_PI * frame/500);
    }
    if (frame == 125.0f)
    {
      count = 1;
      crot = 0;
      frame = 0;
      rot -= TWO_PI / 4;
      circlecount++;
      if (circlecount > 3)
      {
        circlecount = 0;
      }
    }
  }

  if (count == 0)
  {
    rotateZ(rotateZ);
  }

  if (count == 1)
  {
    rotateZ(rot);
  }


  for (int i =0; i <= bArray.size()+1; i++)
  {
    pushMatrix();
    PShape logo = createShape(SPHERE, 20);
    translate(200, 0);
    rotateX(-1.5);
    rotateY(-1.9);

    if (i < bArray.size())
    {
      logo.setTexture(bArray.get(i).menu_image);
    }
    if (i == bArray.size())
    {
      logo.setTexture(graphimg);
    }
    shape(logo);
    popMatrix();
    rotate(TWO_PI/(bArray.size()+1));
  }
} // end of menu


void move()
{

  if (video.available()) {

    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); 
    prevFrame.updatePixels();
    video.read();
  }

  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  Mx = 0;
  My = 0;
  ave = 0;


  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {

      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 


      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        ave++;
      } else {

        pixels[loc] = video.pixels[loc];
      }
    }
  }
  
  if(img == 0)
  {
    img++;
  }
  background(c.round_view[img]);

  if (ave != 0) { 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > ballX + rsp/2 && Mx > 50) {
    ballX+= rsp;
  } else if (Mx < ballX - rsp/2 && Mx > 50) {
    ballX-= rsp;
  }
  if (My > ballY + rsp/2 && My > 50) {
    ballY+= rsp;
  } else if (My < ballY - rsp/2 && My > 50) {
    ballY-= rsp;
  }

  updatePixels();
}