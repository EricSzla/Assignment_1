# Assignment_1

OOP assignment.
The assignment loads and visualize data (specifications) of three different motorbikes:
- Yamaha R1
- Kawasaki H2R
- Honda CBR

## Loading Menu
The first thing user can see in the program is the instruction window and main program widow, in the instruction windows there is small desciption of how to use the program. In the main program the user can see loading menu, user can choose to interact with the loading menu by clicking on the **SHOW/HIDE** details, if the user clicks on SHOW details, the description bar will appear which indicates which file is loading at the moment. During all this time there is a movie with music playing in the background.

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613618/5e55abd0-9c1f-11e5-9cb1-a6e3aba3e4c2.png)

## Menu
The second thing user can see is the menu, menu is seperated by four spheres all with different images representing:
-Kawasaki Motorbike
-Yamaha Motorbike
-Honda CBR motorbike
-A Pie Chart 

User can interact with the menu using **LEFT** and **RIGHT** arrow to choose between different spheres, when user uses the arrows, there is an animation of the spheres turning, during that time there is error checking to make sure that user cannot press enter and choose a sphere while its not in the centre of the screen. When the sphere is in the centre of the screen user can press **ENTER** to choose one of the four spheres.

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613649/66f023aa-9c20-11e5-9fce-1bb9d4ef15bc.png)

## Pie-Chart
If the user chooses the sphere representing the pie chart, the program will load pie-chart which compares the horse power of three bikes.
User can **PRESS 1 to go back to menu**.

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613718/0c9ecd90-9c23-11e5-8893-640946d62279.png)

## Motorbikes visualisation and motion interaction
If the user chooses on of the spheres which represent motorbikes he will be greeted with a **360 degrees view** of the bike with which user can interact using **MOTION**. This does **NOT** require a kinect or similar device, the only requirement is build-in laptop camera or connected external camera.

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613720/293dbd30-9c23-11e5-8a73-f196cbd60740.png)

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613721/2f03c048-9c23-11e5-9063-6739a90a52b3.png)

**To interact using motion:**
- Wave your hand on **LEFT** hand side of the screen in order to turn the bike left
- Wave your hand on **RIGHT** hand side of the screen in order to turn the bike right

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613822/9c714a08-9c26-11e5-80f5-07f5dd5d1fb9.png)


**To visualize the data:**
- Press **SPACE** in order to draw the circles on top of the bike
- **POINT** at each circle to see the specification of a given part e.g. in order to see engine specification point at the engine this will display specifitaion loaded from the **.csv file** and show an **3D object** (.obj file) which is rotating. Each part has its own object.
- Press **SPACE** to come back to 360 view or **1** to go back to menu.

![alt tag](https://cloud.githubusercontent.com/assets/15609881/11613758/79f803ba-9c24-11e5-9a64-73a3ed46b0c0.png)
