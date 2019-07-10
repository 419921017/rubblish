import 'package:flutter/material.dart';
import 'package:rubblish_app/routers/router.dart';
// import 'package:rubblish_app/http/http_request.dart';
// import 'package:rubblish_app/widgets/search_text_field_widget.dart';
import 'package:rubblish_app/widgets/loading_widget.dart';
// import 'package:rubblish_app/constant/constant.dart';
import 'package:rubblish_app/widgets/search_bar_clean.dart';
import 'package:rubblish_app/http/API.dart';
import 'package:rubblish_app/bean/search_rubblish_entity.dart';

final API _api = API();


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String hintText = '请输入您的垃圾或者材质';
  bool init = false;
  bool loading = false;
  String _searchContent = '';
  List<SearchRubblishEntity> rubblisData = [];

  @override
  Widget build(BuildContext context) {
    print('_HomePageState init');
    return Scaffold(
      appBar: SearchBar(
        // backgroundColor: Colors.blue,
        hintText: hintText,
        onPressed: (text){
          print("搜索内容：$text");
          _api.getRubblishCategory(text, (map){
            print('getRubblishCategory----- $map');
            setState(() {
              _searchContent = text;
              rubblisData = map;
              init = true;
              print('_rubblisData $rubblisData');
            });
          });
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(child: LoadingWidget.containerLoadingBody(_getBody(), loading: loading),)
            ]
        )
      )
    );
  }

  Widget _getBody() {
    if (rubblisData.length > 0) {
      return ListView.builder(
        itemCount: rubblisData.length,
        // physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          SearchRubblishEntity current = rubblisData[index];
          return Padding(
            padding: const EdgeInsets.only(right: 6.0, left: 6.0, top: 12.0, bottom: 12.0),
            child: _RubblishCard(item: current),
          );
        },
      );
    } else {
      return init ? 
        ListView(children: <Widget>[
          Padding(
            child: Text('暂无搜索结果', textAlign: TextAlign.center,),
            padding: EdgeInsets.only(right: 6.0, left: 6.0, top: 30.0, bottom: 20.0),
          ),
          Padding(
            child: _getCategory(),
            padding: EdgeInsets.only(right: 6.0, left: 6.0, top: 13.0, bottom: 13.0),
          )
        ],)
       : Padding(
          child: _getCategory(),
          padding: EdgeInsets.only(right: 6.0, left: 6.0, top: 13.0, bottom: 13.0),
      );
    }
   
  }

  Widget _getCategory() {
    return Column(children: <Widget>[
      Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1,child: _getCategoryItem('wet'),),
          Expanded(flex: 1,child: _getCategoryItem('dry'),),
      ],),
      Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1,child: _getCategoryItem('hazardous'),),
            Expanded(flex: 1,child: _getCategoryItem('recyclable'),),
          ]
      )
    ],);
  }

  Widget _getCategoryItem(String category) {
    return GestureDetector(
      child: Container(
//        width: 180,
//        height: 180,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Image.asset('assets/images/${category}_item.jpg'),
        ),
      ),
      onTap: () {
        switch(category){
          case 'wet':
            Router.pushNoParams(context, Router.wetPage);
            break;
          case 'dry':
            Router.pushNoParams(context, Router.dryPage);
            break;
          case 'hazardous':
            Router.pushNoParams(context, Router.hazarousPage);
            break;
          case 'recyclable':
            Router.pushNoParams(context, Router.recycledPage);
            break;
        }
      },
    );
  }

}


class _RubblishCard extends StatelessWidget {
  _RubblishCard({Key key, this.item}) : super(key: key);

  SearchRubblishEntity item;

  @override
  Widget build(BuildContext context) {
    return new Card(
    ///增加点击效果
    child: new FlatButton(
      onPressed: (){print("点击了哦");},
      child: new Padding(
        padding: new EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                ///文本描述
                new Container(
                    child: new Text(
                      "${item.name}",
                      style: TextStyle(
                        // color: Color(GSYColors.subTextColor),
                        fontSize: 22.0,
                      ),
                      ///最长三行，超过 ... 显示
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                    alignment: Alignment.center
                ),
                new Padding(padding: EdgeInsets.only(top: 10)),
                // 垃圾归属
                new Container(
                    child: new Text(
                      "${item.classify}",
                      style: TextStyle(
                        // color: Color(GSYColors.subTextColor),
                        fontSize: 24.0,
                      ),
                      ///最长三行，超过 ... 显示
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                    alignment: Alignment.center),
                new Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
          )
        )
      );
    }
}


