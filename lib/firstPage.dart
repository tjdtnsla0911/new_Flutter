import 'package:flutter/material.dart';
import 'animelitem.dart';

class FirstApp extends StatelessWidget {

  final List<Animal>? list;

  const FirstApp({Key? key, this.list}) : super(key: key); //생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(itemBuilder: (context,position){
              print('context = $context');
              print('position = $position');
              return Card(

              );

          }),
        ),
      ),
    );
  }
}
