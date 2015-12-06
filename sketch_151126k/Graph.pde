class Graph
{
  float diameter;
  float[] hp = {0, 0, 0};
  String[] names = new String[3];

  Graph(float diameter)
  {
    this.diameter = diameter;
  }

  Graph()
  {
    this.diameter = height - 60;
  }

  // Sorting algorithm for the graph
  // Sorts the horsepower in order to put it in the pie chart
  void sortHP()
  {

    // Fill array with values
    for (int i = 0; i < bArray.size(); i++)
    {
      hp[i] = bArray.get(i).horsePower;
      names[i] = bArray.get(i).name;
    }

    float temp = 0;
    String tempName;

    // Sort array in ascending order
    for (int i =0; i < bArray.size()-1; i++)
    {
      for (int j = 1; j < bArray.size(); j++)
      {
        if (bArray.get(i).horsePower > hp[j])
        {
          temp = hp[j];
          hp[j] = bArray.get(i).horsePower;
          hp[i] = temp;

          tempName = names[j];
          names[j] = bArray.get(i).name;
          names[i] = tempName;
        }
      }
    }
  }


  void pieChart()
  {
    // Sort array in ascending order
    sortHP();
    background(0);
    float x, y;
    float border = 30;
    float lastAngle = 0;

    for (int i = 0; i < bArray.size(); i++)
    {
      int yboost = 30; 
      x = border;
      y = border;
      color c = color(0);

      if (i == 0)
      {
        c = color(200, 0, 0);
      } else if (i == 1)
      {
        c = color(0, 0, 255);
      } else if ( i == 2)
      {
        c = color(0, 244, 0);
      }

      fill(255);
      stroke(0);
      text("Horsepower PieChart:", x, yboost);
      fill(c);
      text(names[i] + ": " + hp[i], x, (yboost*2) + (y*i+1));
      arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(hp[i]));
      lastAngle =+ radians(hp[i]);
    }

    noStroke();
    noFill();
  }
}