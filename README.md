# Custom bottom navigation bar

A bottom navigation bar widget that is made to be customized 

![alt text](https://firebasestorage.googleapis.com/v0/b/looseweight-31bfd.appspot.com/o/plugin%2Fezgif-6-9387a6e9dd24.gif?alt=media&token=50e3e48f-92a4-4487-b7ea-531ecc008a63 "GIF1")
![alt text](https://firebasestorage.googleapis.com/v0/b/looseweight-31bfd.appspot.com/o/plugin%2Fezgif-6-d15351a12185.gif?alt=media&token=5b592fb9-f737-43e2-91f2-465cce11e3ff "GIF1")


## How to use it?
	
~~~~
Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [
          CustomBottomNavigationBarItem(
            icon: Icons.map,
            title: "Map",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.near_me,
            title: "Directions",
          ),
          CustomBottomNavigationBarItem(
            icon: Icons.settings,
            title: "Settings",
          ),
        ],
      ),
    );
~~~~

You can also add a parameter onTap (which returns current index) to control PageController:

~~~~
onTap: (index) {
          _pageController.animateToPage(index,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 600));
        },
~~~~
