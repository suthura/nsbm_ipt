import 'package:flutter/material.dart';
import 'package:nsbm_ipt/Controllers/Auth/RegisterService.dart';
import 'package:nsbm_ipt/Controllers/Auth/UpdateProfileService.dart';
import 'package:nsbm_ipt/Controllers/Qualification/AddQualificationService.dart';
import 'package:nsbm_ipt/Views/AuthScreens/constants/constants.dart';
import 'package:nsbm_ipt/Views/AuthScreens/widgets/custom_shape.dart';
import 'package:nsbm_ipt/Views/AuthScreens/widgets/customappbar.dart';
import 'package:nsbm_ipt/Views/AuthScreens/widgets/responsive_ui.dart';
import 'package:nsbm_ipt/Views/AuthScreens/widgets/textformfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

final fnameController = TextEditingController();
final lnameController = TextEditingController();
final emailController = TextEditingController();
final nsbmidController = TextEditingController();
final phoneController = TextEditingController();

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      // categoryController.text = "Programming";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),

                SizedBox(
                  height: _height / 35,
                ),
                button(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //         spreadRadius: 0.0,
          //         color: Colors.black26,
          //         offset: Offset(1.0, 10.0),
          //         blurRadius: 20.0),
          //   ],
          //   color: Colors.white,
          //   shape: BoxShape.circle,
          // ),
          child: GestureDetector(
              onTap: () {
                print('Adding photo');
              },
              child: Text(
                "Add Qualification",
                style: TextStyle(fontSize: 30),
              )),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            nsbmidTextFormField(),
            SizedBox(height: _height / 60.0),
            phonetypeFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      textEditingController: fnameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      textEditingController: lnameController,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      textEditingController: emailController,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
    );
  }

  Widget nsbmidTextFormField() {
    return CustomTextField(
      textEditingController: nsbmidController,
      keyboardType: TextInputType.text,
      // obscureText: true,
      icon: Icons.lock,
      hint: "NSBM ID",
    );
  }

  Widget phonetypeFormField() {
    return CustomTextField(
      textEditingController: phoneController,
      keyboardType: TextInputType.text,
      // obscureText: true,
      icon: Icons.lock,
      hint: "Phone",
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        SharedPreferences login = await SharedPreferences.getInstance();

        final body = {
          "token": login.getString("gettoken"),
          "firstname": fnameController.text,
          "lastname": lnameController.text,
          "email": emailController.text,
          "nsbmid": nsbmidController.text,
          "phone": phoneController.text
        };

        // print(body);
        UpdateProService.update(body).then((success) {
          if (success) {
            // qualificationController.clear();
            Alert(
              style: AlertStyle(
                animationType: AnimationType.fromTop,
                isCloseButton: false,
                isOverlayTapDismiss: false,
                descStyle: TextStyle(fontWeight: FontWeight.bold),
                animationDuration: Duration(milliseconds: 400),
                alertBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                titleStyle: TextStyle(
                  color: Colors.red,
                ),
              ),
              context: context,
              type: AlertType.success,
              title: "Success",
              desc: "Profile Updated",
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          } else {
            print("failed");
          }
        });
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.greenAccent
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'UPDATE',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
