import 'package:flutter/material.dart';
import 'image_font_add_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var switchvalue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch:
              Colors.blueGrey //요놈이 앱바 색깔결정하는듯 만약 Appbar에서 적으면 요놈은 무시당하네..
          //플로씽액션버튼까지 쳐먹네 이게
          ),
      darkTheme: ThemeData.light(),
      home: ImageWidgetApp(),
    );
  }
}

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  @override
  Widget build(BuildContext context) {
    print('build 시작');
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Design App'),
        backgroundColor: Colors.cyan,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(Icons.android),
              Text('반갑다'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
