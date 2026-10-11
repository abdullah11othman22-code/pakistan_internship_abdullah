import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterState();
}

class _CounterState extends State<CounterPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Edit
        children: [
          Text('Simple Counter App'),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.deepPurple),
                    ),
                    child: Text(count.toString()),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: count > 0
                              ? () {
                                  setState(() {
                                    count--;
                                  });
                                }
                              : null,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            color: Colors.deepPurple,
                            height: 48,
                            width: 75,
                            child: Padding(
                                
                            padding: EdgeInsetsGeometry.only(
                                bottom: 20),
                                
                                child: Icon(Icons.minimize_rounded,color: Colors.white,)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ++count;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            color: Colors.deepPurple,
                            height: 48,
                            width: 75,
                            child: Padding(padding: EdgeInsetsGeometry.only(bottom:8 ),child: Icon(Icons.plus_one,color: Colors.white,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.deepPurple),
                      ),
                      child: Text('c'),
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
}
