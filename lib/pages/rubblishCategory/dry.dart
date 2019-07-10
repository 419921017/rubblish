


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DryPageContainer();
  }
}

class DryPageContainer extends StatefulWidget {
  @override
  _DryPageContainerState createState() => _DryPageContainerState();
}

class _DryPageContainerState extends State<DryPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('干垃圾'),),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
//              Text('干垃圾')
              Container(child: Image.asset('assets/images/dry/dry_info.jpg'),),
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




