import 'package:flutter/material.dart';
import 'package:rubblish_app/widgets/search_text_field_widget.dart';
import 'package:rubblish_app/constant/constant.dart';
import 'package:rubblish_app/widgets/loading_widget.dart';

///小组
class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String hintText = '搜索书影音 小组 日记 用户等';
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SearchTextFieldWidget(
            margin: EdgeInsets.all(Constant.MARGIN_RIGHT),
            hintText: hintText,
            onTab: () {
              // Router.push(context, Router.searchPage, hintText);
            },
          ),
          Expanded(
            child: _GroupWidget(),
          )
        ],
      )),
    );
  }
}

class _GroupWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<_GroupWidget> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget.containerLoadingBody(_getBody(), loading: loading);
  }

  Widget _getBody() {
      return Container(
        child: Image.asset(Constant.ASSETS_IMG + 'ic_group_top.png'),
      );
  }
}
