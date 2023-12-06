import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


import 'package:flutter/material.dart';
import 'package:shop/screen2.dart';

import 'model/shoe_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    
    final size=MediaQuery.of(context).size;
    return FutureBuilder(
                future: ReadJsonData(),
                builder: (context,data){
                  var items=data.data as List<Shoes>;
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return   Card(
                        
                         color:  Colors.transparent,
                         elevation: 0,
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             GestureDetector(
                              onTap: () {
                                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Screen2(shoes: items[index],)),
);
                              },
                               child: Stack(
                                  children: [
                                   
                                      
                                       CircleAvatar(
                                        radius: size.height*0.06,
                                        backgroundColor: HexColor(items[index].color.toString()),
                                      ),
                                      
                                       
                                   
                                    Positioned.fill(
                                      
                                      child: Transform.rotate(
                                       angle: -30 * 3.141592653589793 / 180,
                                        child: ClipOval(
                                         child: Image.network(
                                           items[index].image.toString(),
                                            height: 180,
                                          width: 180,
                                           fit:  BoxFit.cover,
                                            ),
                                 
                                            ),
                                                 )
                                      )
                             
                                  ],
                                ),
                             ),
                            
                            Padding(
                              padding: const EdgeInsets.only(left:50.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(items[index].name.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width*0.025
                                  ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('\$'+items[index].price.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width*0.04

                                  ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        onPressed: (){

                                        }, 
                                        icon: Icon(Icons.add_circle_outline_rounded,
                                        color: Color.fromARGB(255, 146, 146, 144),
                                        )),
                                        Text("soluong"),
                                        IconButton(
                                        onPressed: (){
                                          
                                        }, 
                                        icon: Icon(Icons.remove_circle_outline_rounded,
                                        color: Color.fromARGB(255, 166, 166, 166),
                                        )),
                                        SizedBox(width: 20,),
                                         IconButton(
                                        onPressed: (){
                                          
                                        }, 
                                        icon: Icon(Icons.delete,
                                        color: Colors.orange,
                                        )),
                                    ],
                                  )
                                ],
                              ),
                            )
                            


                          ],
                          
                         ),
                          
                        );
                      
                    }
                    );
                }
                );
    
  }
}
Future<List<Shoes>>ReadJsonData()async{
      final jsondata=await rootBundle.loadString('jsonfile/shoes.json');
      final list=json.decode(jsondata)['shoes'] as List<dynamic>;
      return list.map((e) => Shoes.fromJson(e)).toList();
  }