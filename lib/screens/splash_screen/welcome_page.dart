import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/all_week_page/category_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

// الانتقال للصفحة التالية بعد 5 ثوانٍ
    _navigationTimer = Timer(
      const Duration(seconds: 5),
          () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryPage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://tse4.mm.bing.net/th/id/OIP.ntYERm5Hx1LB2RTuH7rPCwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Text(
                'Welcome, this application contains the tests completed by the trainer Abdullah Othman',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 18,
                ),
              ),

            ),
            SizedBox(height: 100,),
            const SpinKitDualRing(
              color: Colors.deepPurple,
              size: 40,
              lineWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}
