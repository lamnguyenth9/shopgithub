import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import 'model/shoe_model.dart';

class Screen2 extends StatelessWidget {
  final Shoes shoes;
  const Screen2({super.key, required this.shoes});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final font=size.height*0.05;
    return Scaffold(
      
      body: ListView(
        children:[ Stack(
          children: [
            Positioned(
              top: -size.height*0.15,
              left: -size.height*0.20,
              child: Container(
                 height: size.height*0.4,
                 width: size.height*0.4,
                 decoration: BoxDecoration(
                  color:  HexColor("#efc845"),
                  shape: BoxShape.circle
                 ),
              )),
              Positioned(
              
              child: AppBar(
                toolbarHeight: size.height*0.116,
               automaticallyImplyLeading: false,
                actions:  [
                   Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Row(
                         children: [
                          
                            Text("\$ 358.94",
                            style: TextStyle(color: Colors.black,fontSize: font,
                            fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width*0.07,)
                         ],
                       ),
                     ],
                   ),
                  
                ],
                title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      
                     Padding(
                       padding: const EdgeInsets.only(top:8.0),
                       child: Image.asset("assets/images/nike.png",
                       height: font,
                       ),
                     ),
                     const SizedBox(height: 10,),
                      Text(" Your Cart",
                     style: TextStyle(
                      fontSize: font,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                     ),
                     )
                ],),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
           
              
              Padding(
                padding:  EdgeInsets.only(top: size.height * 0.14,left: 60,right: 60),
                child: Container(
                  decoration: BoxDecoration(
                   color: HexColor(shoes.color.toString()),
                  borderRadius: BorderRadius.circular(25)
                ),
                  height: size.height*0.65,
                   child: Center(child: 
                   Image.network(shoes.image.toString())
                   ),
               
                        ),
              ),
              
          ],
        ),
        SizedBox(height: size.height*0.05,),
        Padding(
          padding: const EdgeInsets.only(right:60, left:60),
          child: Text(shoes.name.toString(),style: TextStyle(fontSize: size.height*0.03,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10,right:60, left:60),
          child: Text(shoes.description.toString()),
          )
        ]
      ),
    );
  }
}