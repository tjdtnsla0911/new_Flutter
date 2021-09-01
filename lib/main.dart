import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:start_app/firstPage.dart';
import 'package:start_app/secondPage.dart';
import './animelitem.dart';
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
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {

  // const _MyHomePage({Key key}) : super(key: key);
  @override
  __MyHomePageState createState() => __MyHomePageState();
}

//with는 여러 클래스를 재사용할수있는 편리한 키워드..
class __MyHomePageState extends State<_MyHomePage> with SingleTickerProviderStateMixin{

  TabController? controller;
  List<Animal>? animalList = [];

  @override
  void initState() {
    super.initState();
    ///vsync는 탭이 이동했을때 호출되는 콜백함수를 어디서 처리할지 지정한다
    //그냥 박을시 error가 터진다. 탭컨트롤러는 여러화면을 이동하는 역할을 하므로, 기본적으로 애니메이션을 사용하는데
    //this가 가르키는 _MySyate에는 아무것도없어서 그렇다
    controller = TabController(length: 2, vsync: this);
    Logger().d('###### controller : $controller');
    print('initState맨첨에 시작해서 animalList = $animalList');
    /*

    * */
    animalList!.add(Animal(animalname: '리엑트',kind: '깃허브',imagepath: '/image/github.png'));
    print('animalList = ${animalList.toString()}');

  }

  @override
  void dispose() {
    print('######## dispose에옴');
    controller!.dispose();
    super.dispose();
    print('######## dispose에끝');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('태바')
      ),
      body: TabBarView(
        children: <Widget>[FirstApp(list: animalList,),SeconApp(list : animalList)],
        controller: controller,
      ),
      //요놈이 밑에 페이징
      bottomNavigationBar: TabBar(tabs: <Tab>[
        Tab(icon: Icon(Icons.looks_one, color: Colors.blueAccent,),),
        Tab(icon: Icon(Icons.looks_two,color: Colors.blueGrey,),)

      ],controller: controller,),

    );

  }

}

