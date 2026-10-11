import 'package:flutter/material.dart';
import 'package:project1/screens/all_week_page/category_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CategoryPage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(height: 25),
          CircularProgressIndicator(),
          SizedBox(height: 32),

           Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,vertical: 40
                ),
                child: Text(textAlign: TextAlign.center,
                  'Welcome,this application contains the tests completed by the trainee Laith Al-Skaf',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
