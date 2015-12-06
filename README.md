# Assignment_1

OOP assignment.
The assignment loads data (specifications) of three different motorbikes:
- Yamaha R1
- Kawasaki H2R
- Honda CBR

## Loading Menu
The first thing user can see in the program is the instruction window and main program widow, in the instruction windows there is small desciption of how to use the program. In the main program the user can see loading menu, user can choose to interact with the loading menu by clicking on the **SHOW/HIDE** details, if the user clicks on SHOW details, the description bar will appear which indicates which file is loading at the moment. During all this time there is a movie with music playing in the background.


## Menu
The second thing user can see is the menu, menu is seperated by four spheres all with different images representing:
-Kawasaki Motorbike
-Yamaha Motorbike
-Honda CBR motorbike
-A Pie Chart 

User can interact with the menu using **LEFT** and **RIGHT** arrow to choose between different spheres, when user uses the arrows, there is an animation of the spheres turning, during that time there is error checking to make sure that user cannot press enter and choose a sphere while its not in the centre of the screen. When the sphere is in the centre of the screen user can press **ENTER** to choose one of the four spheres.

## Pie-Chart
If the user chooses the sphere representing the pie chart, the program will load pie-chart which compares the horse power of three bikes.
User can **PRESS 1 to go back to menu**.

## Motorbikes visualisation and motion interaction
If the user chooses on of the spheres which represent motorbikes he will be greeted with a **360 degrees view** of the bike with which user can interact using **MOTION**. This doesn **NOT** require a kinect or similar device, the only requirement is build-in laptop camera or connected external camera.
**To interact using motion:**
- Wave your hand on **LEFT** hand side of the screen in order to turn the bike left
- Wave your hand on **RIGHT** hand side of the screen in order to turn the bike right

**To visualize the data:**
- Press **SPACE** in order to draw the circles on top of the bike
- **POINT** at each circle to see the specification of a given part e.g. in order to see engine specification point at the engine this will display specifitaion loaded from the **.csv file** and show an **3D object** (.obj file) which is rotating. Each part has its own object.
- Press **SPACE** to come back to 360 view or **1** to go back to menu.
