import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loovum_designs/services/requestServices/RequestGetters.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/screens/home/home.dart';
import 'package:loovum_designs/ui/screens/sign_up_screen.dart';
import 'package:loovum_designs/ui/shared/widgets/CustomToast.dart';
import 'package:loovum_designs/ui/shared/widgets/heighRatio.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController, passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(child: Image.asset('assets/sign_up_logo.png')),
              SizedBox(
                height: 28.0,
              ),
              _bodyContainer(),
            ],
          ),
        ),
      ),
    );
  }

  _bodyContainer() {
    var ScreenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFCEEF0), //Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
      height: getScreenHeight(context) == 0
          ? ScreenSize.height * 0.7
          : getScreenHeight(context) == 1
              ? ScreenSize.height * 0.63
              : ScreenSize.height * 0.565,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Sign in to continue', style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: ScreenSize.height * 0.09,
            ),
            textField('Email', 'farazahmed@gmail.com',
                controller: emailController),
            SizedBox(
              height: 50.0,
            ),
            textField('Password', 'abc123123',
                isObscure: true, controller: passwordController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('Forgot Password?')],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: ScreenSize.height * 0.075,
              width: ScreenSize.width * 0.85,
              child: RaisedButton(
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xFFE6798A),
                onPressed: () async {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    bool result = await GetMethods.loginInit(
                        email: emailController.text,
                        password: passwordController.text);

                    if (result) {
                      CustomToast(text: 'Login Successfully');
                      emailController.clear();
                      passwordController.clear();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else if (!result)
                      CustomToast(text: 'Email or password is wrong');
                  } else
                    CustomToast(text: 'Please fill all fields');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column textField(String title, String hintText,
      {bool isObscure = false, TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(),
        ),
        TextField(
          controller: controller == null ? null : controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black45),
            hintText: hintText,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE6798A))),
          ),
        ),
      ],
    );
  }
}
