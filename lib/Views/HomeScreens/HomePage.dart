import 'package:flutter/material.dart';
import 'widgets/gradient_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      drawer: Container(
        color: Colors.black38,
        child: Drawer(
          
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage("assets/images/nsbmbg.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color(0xFF222222).withOpacity(0.2), BlendMode.srcOver)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.white30.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Center(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    width: 90.0,
                    height: 90.0,
                    child: Icon(
                      Icons.school,
                      color: Colors.black54,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Welcome".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            GradientButton(
              text: "Add Qualifications".toUpperCase(),
              onPress: () {
                setState(() {
                  // userType = "user";
                });
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => SignUp(
                //           userType: userType,
                //         )));
              },
            ),
            SizedBox(height: 10.0),
            GradientButton(
              text: "My Qualifications".toUpperCase(),
              onPress: () {
                setState(() {
                  // userType = "hospital";
                });
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => SignUp(
                //           userType: userType,
                //         )));
              },
            ),
            SizedBox(height: 10.0),
            GradientButton(
              text: "My Profile".toUpperCase(),
              onPress: () {
                setState(() {
                  // userType = "pharmacy";
                });
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => SignUp(
                //           userType: userType,
                //         )));
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
