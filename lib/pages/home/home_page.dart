import 'package:flutter/material.dart';
// import 'package:rubblish_app/http/http_request.dart';
import 'package:rubblish_app/widgets/search_text_field_widget.dart';
import 'package:rubblish_app/widgets/loading_widget.dart';
import 'package:rubblish_app/constant/constant.dart';
import 'package:rubblish_app/widgets/search_bar.dart';
import 'package:rubblish_app/http/API.dart';
import 'package:rubblish_app/bean/search_rubblish_entity.dart';
// import 'package:rubblish_app/routers/router.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                child: SearchTextFieldWidget(
                  margin: EdgeInsets.all(Constant.MARGIN_RIGHT),
                  hintText: hintText,
                  onSubmitted: (searchContent) {
                    _api.getRubblishCategory(searchContent, (map){
                      print('getRubblishCategory----- $map');
                      setState(() {
                        _searchContent = searchContent;
                        rubblisData = map;
                        init = true;
                        print('_rubblisData $rubblisData');
                      });
                    });
                  },
                ),
              ),
              Expanded(
                child: LoadingWidget.containerLoadingBody(_getBody(), loading: loading),
              )
            ]
      )));
    // );
    // return LoadingWidget.containerLoadingBody(_getBody(), loading: loading);
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
      print('_searchContent = ${_searchContent}');
      return init ? 
        ListView(children: <Widget>[
          Text('输入内容为: $_searchContent'),
          Text('返回结果为$rubblisData'),
          Padding(
            child: Text('暂无搜索结果', textAlign: TextAlign.center,),
            padding: EdgeInsets.only(right: 6.0, left: 6.0, top: 30.0, bottom: 20.0),
          ),
          Padding(
            child: Image.asset("assets/images/rubblish_category.jpeg"),
            padding: EdgeInsets.only(right: 6.0, left: 6.0, top: 13.0, bottom: 13.0),
          )
        ],)
       : Padding(
          child: Image.asset("assets/images/rubblish_category.jpeg"),
          padding: EdgeInsets.only(right: 6.0, left: 6.0, top: 13.0, bottom: 13.0),
      );
    }
   
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(child: Column(children: <Widget>[
  //     SearchTextFieldWidget(
  //       margin: EdgeInsets.all(Constant.MARGIN_RIGHT),
  //       hintText: hintText,
  //       // onSubmitted:(searchContent) {
  //       //   print(searchContent);
  //       //   // loading = true;
  //       //       // _rubblisData;
  //       //     _api.getRubblishCategory(searchContent, (map){
  //       //       print('getRubblishCategory----- $map');
  //       //       setState(() {
  //       //         _rubblisData = map;
  //       //         print('_rubblisData $_rubblisData');
  //       //       });
  //       //     });
  //       // },
  //       onChanged: (searchContent) {
  //         print(searchContent);
  //           // loading = true;
  //           _api.getRubblishCategory(searchContent, (map){
  //             print('getRubblishCategory----- $map');
  //             setState(() {
  //               _rubblisData = map;
  //               print('_rubblisData $_rubblisData');
  //             });
  //           });
  //       },
  //     ),
  //     // Flex(direction: Axis.vertical, children: <Widget>[],)
  //     // Expanded(child: _HomeWidget(rubblisData: _rubblisData, loading: _loading),)
  //   ],),
  //   );
  // }
}



// class _HomeWidget extends StatelessWidget {
//   _HomeWidget({Key key, this.loading, this.rubblisData}) : super(key: key);

//   bool loading = true;
//   List<SearchRubblishEntity> rubblisData = [];

//   _getResult() {
//     if (loading) {
//       return LoadingWidget.getLoading();
//     } else 
//     if (rubblisData.length > 0) {
//       return _RubblishContainer(rubblisData: rubblisData);
//       // return Column(children: <Widget>[
//       //   _RubblishContainer(rubblisData: rubblisData),
//       //   Container(
//       //     child: Image.asset("assets/images/rubblish_category.jpeg"),
//       //     margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
//       //   )
//       // ]);
//     } else {
//       return Column(children: <Widget>[
//         Container(
//           child: Image.asset("assets/images/rubblish_category.jpeg"),
//           margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
//         )
//       ],);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _getResult()
//       // body: Column(children: <Widget>[
//       //   Container(
//       //     child: Image.asset("assets/images/rubblish_category.jpeg"),
//       //     margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
//       //   )
//       // ],)
//     );
//   }
// }



// class _RubblishContainer extends StatelessWidget {
//   _RubblishContainer({Key key, this.rubblisData}) : super(key: key);
  
//   List<SearchRubblishEntity> rubblisData = [];

//   _getCardList() {
//     List<Widget> widgets = [];
//     for (var i = 0; i < rubblisData.length; i++) {
//       SearchRubblishEntity current = rubblisData[i];
//       print('current.id ${current.id}');
//       widgets.add(_RubblishCard(
//         id: current.id,
//         name: current.name,
//         city: current.city,
//         classify: current.classify,
//         remark: current.remark
//       ));
//     }
//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: _getCardList());
//     // return Column(children: _getCardList(),);
//   }
// }

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
        child: new Column(
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

            // new Container(
            //   child: new Text(
            //     "$city",
            //     style: TextStyle(
            //       // color: Color(GSYColors.subTextColor),
            //       fontSize: 14.0,
            //     ),
            //     ///最长三行，超过 ... 显示
            //     maxLines: 3,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            //   margin: new EdgeInsets.only(top: 6.0, bottom: 6.0),
            //   alignment: Alignment.center),
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
      )));
  }
}



// 根据搜索内容返回数据

// 根据搜索显示垃圾
