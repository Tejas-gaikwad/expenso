// import 'package:flutter/material.dart';

// class HomePageAnimatedBuilder extends StatelessWidget {
//   final Listenable animation;
//   final TransitionBuilder builder;
//   final Widget child;
//   const HomePageAnimatedBuilder({super.key, required this.animation, required this.builder, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation, 
//       builder: (context, child) {
        
//         return builder(context,  HomePageEnterAnimation(animation) as Widget? );
//       },
//       child: child,
//       );
//   }
// }


// class HomePageEnterAnimation {
//   final AnimationController controller;
//   HomePageEnterAnimation(this.controller)

//   : 
  
//   headerOpacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent:  controller, curve: const Interval(0,0.2, curve: Curves.easeIn),)),
//   row1Offset = Tween<Offset>(begin:const Offset(0,5), end: Offset.zero).animate(CurvedAnimation(parent:  controller, curve: const Interval(0.1,0.25, curve: Curves.easeOut),)),
//   row2Offset = Tween<Offset>(begin:const Offset(0,5), end: Offset.zero).animate(CurvedAnimation(parent:  controller, curve: const Interval(0.15,0.30, curve: Curves.easeOut),));

//   final Animation<double> headerOpacity;
//   final Animation<Offset> row1Offset;
//   final Animation<Offset> row2Offset;

// }