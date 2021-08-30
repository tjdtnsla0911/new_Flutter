

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class ImageWidgetApp extends StatefulWidget {
  const ImageWidgetApp({Key? key}) : super(key: key);

  @override
  _ImageWidgetAppState createState() {
    // print('createState 시작 얘가 맨처음에나옴');
    Logger().d('#### createState에 등장');
    return _ImageWidgetAppState();
  }
}

class _ImageWidgetAppState extends State<ImageWidgetApp> {

  String sum = '';
  TextEditingController value =  TextEditingController();
  TextEditingController value2 =  TextEditingController();

  List _buttonList = ['더하기','빼기','곱하기','나누기'];
  // List<DropdownMenuItem<String>> _dropDownItems = [];
  List<DropdownMenuItem<String>> _dropDownItems = [];
  String? _buttonText;
  bool test = false; //이놈으로 술값계산인지 검사

  @override
  void initState() {
    super.initState();
    print('초기화됨');
    for(var item in _buttonList){
      print('initState의 item : $item');
      _dropDownItems.add(DropdownMenuItem(value: item, child: Text(item),));
      print('들어간후 -dropDownItems : $_dropDownItems');
    }

    _buttonText = _dropDownItems[0].value;

  }

  @override
  Widget build(BuildContext context) {
    print('_dropDownItems = ${_dropDownItems[0].value}');
    Logger().d('####### value : $value');
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('플러터로 만드는 웹사이트 + 안드로이드앱'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('image/kotlin.png', width: 300, height: 200),
              Text(
                '구글의 최신기술 플러터로 만드는 계산기',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: RaisedButton(
                      child: Row(
                        children: [Text('$_buttonText'),
                          //'더하기','빼기','곱하기','나누기'
                          _buttonText == '더하기' ? Icon(Icons.add) :
                              _buttonText == '빼기' ? Icon(Icons.remove) :
                              _buttonText == '곱하기' ? Icon(Icons.clear) :
                              Icon(Icons.all_inclusive)
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      color: Colors.amberAccent,
                      onPressed: () {
                        Logger().d('##### Button Click');

                        setState(() {
                              var value1Int = double.parse(value.value.text);
                              var value2Int = double.parse(value2.value.text);
                              var result;
                              if(_buttonText == '더하기'){
                                //  List _buttonList = ['더하기','빼기','곱하기','나누기'];
                                result = value1Int + value2Int;
                              }else if(_buttonText == '빼기'){
                                result = value1Int - value2Int;
                              }else if(_buttonText == '곱하기'){
                                result = value1Int * value2Int;
                              }else {
                                result = value1Int / value2Int;
                              }
                              print('result = $result');
                              sum = result.toString();

                        });
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '결과 : $sum',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

             DropdownButton(items: _dropDownItems, onChanged: (value){  
               print('옴');
               setState(() {
                 print('value = $value');
                 print('_buttonText = $_buttonText');
                 _buttonText = value as String?;
                 this.value = new TextEditingController();
                 this.value2 = new TextEditingController();
                 sum = '';

               });
                    //onChaneged에서값을 바꾼가 (보이는곳)
             }, value: _buttonText,),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

}
