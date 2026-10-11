import 'package:flutter/material.dart';
class TaskSection extends StatelessWidget {

  const TaskSection({
    super.key,
    required this.startTopAnimation,
    required this.startBottomAnimation,
    required this.topChild,
    required this.bottomChild,
  });


  final bool startTopAnimation;
  final bool startBottomAnimation;

  final Widget topChild;
  final Widget bottomChild;


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        TweenAnimationBuilder(
          tween: Tween<double>(
            begin: -200,
            end: startTopAnimation ? 0 : -200,
          ),

          duration: const Duration(milliseconds:700),

          curve: Curves.bounceOut,

          builder: (context,value,child){

            return Transform.translate(
              offset: Offset(0,value),
              child: child,
            );

          },

          child: topChild,
        ),



        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedContainer(

            duration: const Duration(milliseconds:1200),

            curve: Curves.easeOut,

            height: startBottomAnimation ? 400 : 0,

            width: double.infinity,


            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple,
              ),

              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),

            ),

            child: bottomChild,

          ),
        ),


      ],
    );
  }
}