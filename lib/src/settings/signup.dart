import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';



// 1)BuildContext context is used because you need access to the current widget tree's media query data.
// 2) The method is static because it doesn't require any instance-specific data and making it static simplifies its usage as a utility function.
class  DeviceConfig{
  static double getTextSize(BuildContext contex){
    var deviceType = getDeviceType(MediaQuery.of(contex).size);


    switch (deviceType){
      case DeviceScreenType.desktop:
        return 40;
      case DeviceScreenType.tablet:
        return 30;
      case DeviceScreenType.mobile:
      default:  //error handling
        return 20;
    }
  }


static double getPadding(BuildContext context){
  var deviceType = getDeviceType(MediaQuery.of(context).size);

  switch (deviceType){
    case DeviceScreenType.desktop:
      return 35;
    case DeviceScreenType.tablet:
      return 25;
    case DeviceScreenType.mobile:
    default:
      return 15;
  }

}

  static double getCardWidth(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 800.0;
      case DeviceScreenType.tablet:
        return 600.0;
      case DeviceScreenType.mobile:
      default:
        return 350.0;
    }
  }

  static double getCardHeight(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.desktop:
        return 650.0;
      case DeviceScreenType.tablet:
        return 550.0;
      case DeviceScreenType.mobile:
      default:
        return 500.0;
    }
  }

}
class SignupDesktop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignupDesktopState();
}

class _SignupDesktopState extends State<SignupDesktop> {
  @override
  Widget build(BuildContext context) {
    double textSize = DeviceConfig.getTextSize(context);
    double padding = DeviceConfig.getPadding(context);
    double cardWidth= DeviceConfig.getCardWidth(context);
    double cardHeight = DeviceConfig.getCardHeight(context);

    return Scaffold(
      body : Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: padding,
          vertical: padding/2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),

          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: ScreenTypeLayout(
                
                
              mobile: buildMobileLayout(textSize,padding),
              tablet: buildTabletLayout(textSize, padding),
              desktop: buildDesktopLayout(textSize, padding),
                
                ),
            ),
  
          ),
        ),
      )
 );
  }
}


Widget buildMobileLayout (double textSize, double padding) {
  return SingleChildScrollView(

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('/Users/nandrajog/Downloads/test_application/lib/house.gif',
          fit: BoxFit.cover,
          height: 150,
          ),
        ),
             SizedBox(height: padding),

                Row(
            children: [
              Text(
                "Sign-up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Icon(
                  Icons.login_rounded,
                  color: Colors.deepPurple,
                  size: textSize,
                ),
              ),
              ]
                ),
            SizedBox(height: padding),
            customTextField("Username", "username", Icons.account_circle, false,textSize),
            SizedBox(height: padding/2),
            customTextField("Email", "you@example.com", Icons.mail, false,textSize),
            SizedBox(height: padding/2),
            customTextField("Password", "Enter Password", Icons.lock, true,textSize),
            SizedBox(height: padding/2),
            customTextField("Confirm Password", "Confirm Password", Icons.lock, true,textSize),
            SizedBox(height: padding),
            
                Container(
               width: double.infinity,
                height: padding * 1.5,  
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
           child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              ),
              onPressed: () {},
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textSize * 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

                ),
           SizedBox(height: padding / 2),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:  "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textSize * 0.4,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    text: "Sign-In",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: textSize * 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
            
      ],

    ),



    );

    
    
  
}
Widget buildTabletLayout(double textSize, double padding) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Sign-Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.deepPurple,
                        size: textSize,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: padding),
                customTextField("Username", "username", Icons.account_circle, false,textSize),
                SizedBox(height: padding/2),
                customTextField("Email", "you@example.com", Icons.mail, false,textSize),
                SizedBox(height: padding/2),
                customTextField("Password", "Enter Password", Icons.lock, true,textSize),
                SizedBox(height: padding/2),
                customTextField("Confirm Password", "Confirm Password", Icons.lock, true,textSize),
                SizedBox(height: padding),
                //SizedBox(height: padding / 2),
                Container(
                  width: double.infinity,
                  height: padding * 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize * 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding / 2),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sign-In",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: textSize * 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              '/Users/nandrajog/Downloads/test_application/lib/house.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
    Widget buildDesktopLayout(double textSize, double padding) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Sign-Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.login_rounded,
                        color: Colors.deepPurple,
                        size: textSize,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: padding),
                customTextField("Username", "username", Icons.account_circle, false,textSize),
                SizedBox(height: padding/2),
                customTextField("Email", "you@example.com", Icons.mail, false,textSize),
                SizedBox(height: padding/2),
                customTextField("Password", "Enter Password", Icons.lock, true,textSize),
                SizedBox(height: padding/2),
                customTextField("Confirm Password", "Confirm Password", Icons.lock, true,textSize),
                SizedBox(height: padding),


                Container(
                  width: double.infinity,
                  height: padding * 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize * 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: padding / 2),

           Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:  "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textSize * 0.4,
                    ),
                  ),
                  WidgetSpan(
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                    text: "Sign-In",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: textSize * 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              '/Users/nandrajog/Downloads/test_application/lib/house.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }


  Widget customTextField(String title, String hintText, IconData icon, bool isPassword, double textSize) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: textSize * 0.4,
            color: Colors.black,
          ),
        ),
        TextFormField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );
  }




//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Card(
//             elevation: 5,
//             margin: EdgeInsets.symmetric(horizontal: 90, vertical: 20),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
//             shadowColor: Colors.black,
//             child: Container(
//               width: double.infinity,
//               height: 750.0,
//               child: Padding(padding: EdgeInsets.all(35.0),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 12.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Row(
//                             children: [
//                               Text(
//                                 "Sign-Up",
//                                 style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Center(
//                                 child: Icon(
//                                   Icons.login_rounded,
//                                   color: Colors.deepPurple,
//                                   size: 50,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 25.0),
//                           customTextField("Username", "username", Icons.account_circle, false),
//                           SizedBox(height: 25.0),
//                           customTextField("Email", "you@example.com", Icons.mail, false),
//                           SizedBox(height: 25.0),
//                           customTextField("Password", "Enter Password", Icons.lock, true),
//                           SizedBox(height: 25.0),
//                           customTextField("Confirm Password", "Confirm Password", Icons.lock, true),
//                           SizedBox(height: 25.0),
//                           Container(
//                             width: double.infinity,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: ElevatedButton(
//                               style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
//                               ),
//                               onPressed: () {},
//                               child: Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w600
//                                 ),
//                               )
//                             )
//                           ),
//                           SizedBox(height: 20.0),
//                           Center(
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "Already have an account?",
//                                     style: TextStyle(
//                                       color: Colors.white70,
//                                       fontSize: 18,
//                                     )
//                                   ),
//                                   TextSpan(
//                                     text: "Sign-In",
//                                     style: TextStyle(
//                                       color: Colors.deepPurple,
//                                       fontSize: 18,
//                                     )
//                                   ),
//                                 ]
//                               )
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ),
//                   SizedBox(height: 23.0),
//                   Expanded(
//                     flex: 1,
//                     child: Center(
//                       child: Material(
//                         borderRadius: BorderRadius.circular(17.0),
//                        // child: _riveArtboard == null ? const SizedBox() : Rive(artboard: _riveArtboard),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
