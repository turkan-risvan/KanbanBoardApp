import 'dart:async';

import 'package:flutter/material.dart';
 
import 'package:kanbanboardapp/src/view/home_page.dart';
 

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      Timer(
      const Duration(seconds: 3), // 3 saniye sonra
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>   HomePage(), // Geçiş yapılacak sayfanın belirtilmesi
          ),
        );
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                     height: 70,
                     width: 110,
                    child: Image.asset("assets/rastmobilelogo.png",)),
                   
                         const Text("Building the Future",style: TextStyle(color: Color(0xffD8D8D8),fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
            )
            ],
          ),
       Positioned(
        top: 0,
         child: Row(children: [
          Container(
            decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)) , color: Color(0xff744BFC)),
           width: 60,height: 60,),
         const SizedBox(width: 4,),
         Container(decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)) , color: Color(0xff744BFC)),width:350,height: 60,),
         ],),
       ),
        Positioned(
          left: 0,
          top: 64,
          child: Container(decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20)) , color: Color(0xff744BFC)),width:60,height: 180,),
        ),
          Positioned(
        bottom: 0,right: 0,
         child: Row(children: [
          Container(decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20)) , color: Color(0xff744BFC)),width:326,height: 60,),
           const SizedBox(width: 4,),
          Container(
            decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)) , color: Color(0xff744BFC)),
           width: 60,height: 60,),
        
         
         ],),
       ),
        Positioned(
          right: 0,
          bottom: 64,
          child: Container(decoration:const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)) , color: Color(0xff744BFC)),width:60,height: 180,),
        ),
        ],
      ),
    );
  }
}