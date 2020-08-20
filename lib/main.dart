import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() async{

  Map data=await getAllData();
  print("Result is:"+data['city']['coord']['lat'].toString());

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Weather Application'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        height: 800.0,
        child: Stack(
          children:<Widget> [
             Container(
               height: 800.0,
               child: Image(
                 image: AssetImage("asset/sun.jpg"),
                 fit: BoxFit.cover,

             ),
             
             ),
             Positioned(
               bottom: 5.0,

               child: Container(
                 margin: EdgeInsets.all(10.0),
                 height:100.0 ,
                 width: 400.0 ,
                 color: Colors.deepOrange,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:<Widget> [
                     Text(data['list'][0]['main']['temp'].toString()+"/F",
                     style: TextStyle(
                       fontSize: 20.0,
                       color:Colors.white,
                     ),
                     ),

                     SizedBox(height: 10.0,),
                     Text(data['list'][0]['weather'][0]['main'],
                     style: TextStyle(
                       fontSize: 20.0,
                       color:Colors.white,
                     ),
                     ),

                   ],

                 ),

               ),),
          ],
        ),

      ),
    ),
  ));
}

Future<Map> getAllData() async{
  var api="https://samples.openweathermap.org/data/2.5/forecast/hourly?id=524901&appid=439d4b804bc8187953eb36d2a8c26a02";

  var data= await http.get(api);
  var jsonData= json.decode(data.body);

  return jsonData; 


}