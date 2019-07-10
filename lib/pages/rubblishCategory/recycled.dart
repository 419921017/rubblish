


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecycledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecycledPageContainer();
  }
}

class RecycledPageContainer extends StatefulWidget {
  @override
  _RecycledPageContainerState createState() => _RecycledPageContainerState();
}

class _RecycledPageContainerState extends State<RecycledPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: Text('有害垃圾'),
      appBar: AppBar(title: Text('可回收垃圾'),),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
//              Text('干垃圾')
              Container(child: Image.asset('assets/images/recycled/recycled_info.jpg'),),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10),),
              Container(child: Image.asset('assets/images/dry/con_01.jpg'),),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10),),
              Container(child: Image.asset('assets/images/dry/con_02.jpg'),),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10),),
            ],
          ),
        ),
      ),
    );
  }
}


