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
          child: ListView.builder(
            itemBuilder: (context, position) {
              print('context = $context');
              print('position = $position');
              print('경로야 나와라 = ${list![position].imagepath.toString()}');
              return GestureDetector(
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        list![position].imagepath.toString(),
                        height: 100,
                        width: 100,
                      ),
                      Text('${list![position].animalname}'),
                    ],
                  ),
                ),

                onTap: (){
                  print('click! = $position');

                  showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                    content: Text('이 번호는  ${position}기술은입네다'),
                  ));
                },
              );
              //빌더에 파라미터로 itemCount안적으면 조진다 ㄹㅇㅋㅋㅋㅋ
            },
            itemCount: list!.length,
          ),
        ),
      ),
    );
  }
}
