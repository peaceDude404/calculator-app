import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _value='0';
  String _temp='0';
  double num1=0.0;
  double num2=0.0;
  String operand='';

  pressedbutton(String buttonText){
    if(buttonText=='clear'){
       _temp='0';
       num1=0.0;
       num2=0.0;
       operand='';
    }else if(buttonText=='+' ||buttonText=='-' || buttonText=='*' || buttonText=='/')
      {
        num1=double.parse(_value);
        operand=buttonText;
        _temp='0';
      }else if(buttonText=='.') {
        if(_value.contains('.')) {
          print('Already contain dot!!');
          return;
        }
        else {
      _temp=_temp+buttonText;
    }
      }else if(buttonText=='='){
      num2=double.parse(_value);
      if(operand=='+'){
        _temp=(num1+num2).toString();
      }
      else if(operand=='-'){
        _temp=(num1-num2).toString();
      }
      else if(operand=='/'){
        _temp=(num1/num2).toString();
      }
      else if(operand=='*'){
        _temp=(num1*num2).toString();
      }
      num1=num2=0.0;
      operand='0.0';
    }else{
      _temp=_temp+buttonText;
    }
    print(_temp);
    setState(()=> _value=double.parse(_temp).toStringAsFixed(2));
  }

  Widget _showbutton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,style: new TextStyle(fontSize: 24.0),),
        onPressed: ()=>pressedbutton(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        shadowColor: Colors.green,
        bottomOpacity: 0.5,
        title: new Text('CALCULATOR',style: new TextStyle(fontWeight: FontWeight.bold,),),
      ),
      body: new Container(
      //  padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
                 padding: new EdgeInsets.symmetric(
               vertical: 30.0,
               horizontal: 20.0,
        ),
                 child: new Text(_value,style: new TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
            ),
            
            new Expanded(
              child: new Divider(),
            ),
              new Column(
                children: [
                  new Row(
                  children: <Widget>[
                        _showbutton('1'),
                        _showbutton('2'),
                        _showbutton('3'),
                        _showbutton('/'),
                  ],
                 ),
                  new Row(
                    children: <Widget>[
                      _showbutton('4'),
                      _showbutton('5'),
                      _showbutton('6'),
                      _showbutton('+'),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      _showbutton('7'),
                      _showbutton('8'),
                      _showbutton('9'),
                      _showbutton('-'),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      _showbutton('.'),
                      _showbutton('0'),
                      _showbutton('00'),
                      _showbutton('*'),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      _showbutton('clear'),
                      _showbutton('='),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}