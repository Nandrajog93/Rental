import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // AppBar background color
          elevation: 0, // Removes the shadow for a clean look
         // title: GestureDetector(
            // onTap: () {
            //   // Navigate to home page
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => MyHomePage()),
            //   );
            // },
            title: Container(
              padding: EdgeInsets.all(8.0), // Add padding around the logo
              decoration: BoxDecoration(
                color: Colors.white, // Logo background color
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: Image.asset(
                '/Users/nandrajog/Downloads/test_application/lib/download.png',
                height: 50, // Adjust the height according to your needs
              ),
            ),
         // ),
          bottom: const TabBar(
             indicatorColor: Colors.lightBlue,
            indicatorWeight: 4.0,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.bolt_outlined)),
              Tab(icon: Icon(Icons.backpack)),
              Tab(icon: Icon(Icons.fire_extinguisher)),
              Tab(icon: Icon(Icons.hail)),
            ],
          ),
        ),
        body: ScreenTypeLayout(
          mobile: buildLayout(context, DeviceScreenType.mobile),
          tablet: buildLayout(context, DeviceScreenType.tablet),
          desktop: buildLayout(context, DeviceScreenType.desktop),
        ),
      ),
    );
  }

  Widget buildLayout(BuildContext context, DeviceScreenType deviceScreenType) {
    return TabBarView(
      children: [
        buildHomeContent(context, deviceScreenType),
        buildTabContent2(context, Colors.white, Icons.bolt_outlined),
        buildTabContent2(context, Colors.white, Icons.backpack),
        buildTabContent2(context, Colors.white, Icons.fire_extinguisher),
        buildTabContent1(context, Colors.white, Icons.hail),
      ],
    );
  }

  Widget buildHomeContent(BuildContext context, DeviceScreenType deviceScreenType) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: deviceScreenType == DeviceScreenType.mobile ? TextAlign.start : TextAlign.center,
            ),
            buildSearchBar(context, deviceScreenType),
            SizedBox(height: 20),
            // Add other common widgets here
          ],
        ),
      ),
    );
  }

  Widget buildTabContent1(BuildContext context, Color color, IconData icon) {
    return Container(
      color: color,
      child: Center(
        child: Icon(icon, size: 100.0, color: Colors.white),
      ),
    );
  }
    Widget buildTabContent2(BuildContext context, Color color, IconData icon) {
    return Container(
      color: color,
      child: Center(
        child: Icon(icon, size: 100.0, color: Colors.purple),
      ),
    );
  }

  Widget buildSearchBar(BuildContext context, DeviceScreenType deviceScreenType) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double width;

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          width = MediaQuery.of(context).size.width * 0.4;
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          width = MediaQuery.of(context).size.width * 0.6;
        } else {
          width = MediaQuery.of(context).size.width * 0.4;
        }
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              controller: null, // Replace with your actual controller
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),


          ],
        ),
      ),
    );
        


      },
    );
  }
}


