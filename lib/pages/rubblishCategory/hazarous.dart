


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HazarousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HazarousPageContainer();
  }
}

class HazarousPageContainer extends StatefulWidget {
  @override
  _HazarousPageContainerState createState() => _HazarousPageContainerState();
}

class _HazarousPageContainerState extends State<HazarousPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('有害垃圾'),),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
//              Text('干垃圾')
              Container(child: Image.asset('assets/images/hazarous/hazarous_info.jpg'),),
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


