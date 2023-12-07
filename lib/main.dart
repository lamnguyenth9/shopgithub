import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/iem_ui.dart';
import 'package:shop/model/shoe_model.dart';
import 'package:flutter/services.dart'as rootBundle;


void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final font=size.width*0.08;
    return Scaffold(
      
      body: Stack(
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
              padding:  EdgeInsets.only(top: size.height * 0.19,left: 60,right: 60),
              child: Container(
                
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(25)
              ),
              height: size.height*0.65,
              width: double.infinity,
              child: MyWidget()
                      ),
            )
        ],
      ),
    );
  }
  Future<List<Shoes>>ReadJsonData()async{
      final jsondata=await rootBundle.rootBundle.loadString('jsonfile/shoes.json');
      final list=json.decode(jsondata)['shoes'] as List<dynamic>;
      return list.map((e) => Shoes.fromJson(e)).toList();
  }
}