import 'package:flutter/material.dart';
import 'package:nsbm_ipt/Controllers/Qualification/GetQualificationService.dart';
import 'package:nsbm_ipt/Modals/QualificationModal.dart';
import 'package:nsbm_ipt/Views/HomeScreens/EditQualificationPage.dart';
import 'AddQualificationPage.dart';
import 'HomePage.dart';
import 'widgets/gradient_button.dart';

class MyQualificationsPage extends StatefulWidget {
  MyQualificationsPage({Key key}) : super(key: key);

  @override
  _MyQualificationsPageState createState() => _MyQualificationsPageState();
}

List<QualificationItem> qItem = List();
List<QualificationItem> filteredQItem = List();

class _MyQualificationsPageState extends State<MyQualificationsPage> {
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() {
    GetQService.getQs().then((qFromServer) {
      setState(() {
        qItem = qFromServer;
        filteredQItem = qItem;
      });
    });
  }

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
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "NSBM IPT",
                      style: TextStyle(fontSize: 35),
                    )
                  ],
                )),
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                ),
              ),
              ListTile(
                title: Text("Home"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                },
              ),
              // ListTile(
              //   title: Text("Search Student"),
              //   trailing: Icon(Icons.chevron_right),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
              ListTile(
                title: Text("Log Out"),
                trailing: Icon(Icons.exit_to_app),
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
              width: 60.0,
              height: 60.0,
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
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Your Qualifications".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Container(
              child: Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // print(widget.filteredSaleItem.length);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            gradient: new LinearGradient(
                                colors: [Color(0xFFF6BDC0), Color(0xFFEA4C46)],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 1.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: ListTile(
                              title: Text(filteredQItem[index].category,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              subtitle:
                                  Text(filteredQItem[index].qualification),
                              trailing: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditQualificationPage(filteredQItem[index])));
                                  }),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 16);
                    },
                    itemCount: filteredQItem.length),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
