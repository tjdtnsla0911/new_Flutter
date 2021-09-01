import 'package:flutter/material.dart';
import 'animelitem.dart';

class SeconApp extends StatelessWidget {
  final List<Animal>? list; 

  const SeconApp({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('2번째옴 빌드 ##');
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('두번째 페이지'),
        ),
      ),
    );
  }
}

