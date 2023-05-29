// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text; 
  final IconData icon;
 const CardWidget({required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Card(
              elevation: 5,
              color: Colors.green,
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white,),
                  TextButton(child: Text(text, style: TextStyle(color: Colors.white),),onPressed: (){
                    print("hello world");
                  },),
                ],
              ),),
            );
  }
}