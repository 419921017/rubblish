


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WetPageContainer();
  }
}

class WetPageContainer extends StatefulWidget {
  @override
  _WetPageContainerState createState() => _WetPageContainerState();
}

class _WetPageContainerState extends State<WetPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('湿垃圾'),),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
//              Text('干垃圾')
              Container(child: Image.asset('assets/images/wet/wet_info.jpg'),),
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


