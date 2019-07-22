import 'package:flutter/material.dart';
import 'package:rubblish_app/widgets/search_text_field_widget.dart';
import 'package:rubblish_app/constant/constant.dart';
import 'package:rubblish_app/widgets/loading_widget.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


///小组
// class GroupPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String hintText = '搜索书影音 小组 日记 用户等';
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Column(
//         children: <Widget>[
//           SearchTextFieldWidget(
//             margin: EdgeInsets.all(Constant.MARGIN_RIGHT),
//             hintText: hintText,
//             onTab: () {
//               // Router.push(context, Router.searchPage, hintText);
//             },
//           ),
//           Expanded(
//             child: _GroupWidget(),
//           )
//         ],
//       )),
//     );
//   }
// }

// class _GroupWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _GroupWidgetState();
// }

// class _GroupWidgetState extends State<_GroupWidget> {
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoadingWidget.containerLoadingBody(_getBody(), loading: loading);
//   }

//   Widget _getBody() {
//     return new WebviewScaffold(
//       url: "http://www.anywebsite.com",
//       appBar: new AppBar(
//         title: new Text("Anytitle"),
//       ),
//     );
//   }
// }

bool _closed = false;
bool _isShow = true;
FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

class GroupPage extends StatelessWidget {

  void setShowState(bool isShow) {
    _isShow = isShow;
    if(!isShow){
      _closed = true;
      flutterWebviewPlugin.hide();
      // flutterWebviewPlugin.close();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Widget_WebView_Page();
  }
}
class Widget_WebView_Page extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Widget_WebView_State();
  }

}

class Widget_WebView_State extends State<Widget_WebView_Page>
  with SingleTickerProviderStateMixin {
  var title = "服务推广";
  var tabs;
  TabController controller;
  var choiceIndex = 0;

  //获取h5页面标题
  Future<String> getWebTitle() async {
    String script = 'window.document.title';
    var title = await
    flutterWebviewPlugin.evalJavascript(script);
    setState(() {
      this.title = title;
      print('####################$title');
    });
  }

  //获取h5页面标题
  // Future<String> getWebTitle2({String url}) async {
  //   var client = http.Client();
  //   client
  //       .get(url)
  //       .then(
  //           (response) {
  //         String title = RegExp(
  //             r"<[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}(\s.*)?>([^<]*)</[t|T]{1}[i|I]{1}[t|T]{1}[l|L]{1}[e|E]{1}>")
  //             .stringMatch(response.body);
  //         if (title != null) {
  //           title =
  //               title.substring(title.indexOf('>') + 1, title.lastIndexOf("<"));
  //         } else {
  //           title = "";
  //         }
  //         print("####################  " + title);
  //       })
  //       .catchError(
  //           (error) {
  //         print(error);
  //       })
  //       .whenComplete(client.close,);
  // }


  @override
  void initState() {
    super.initState();

    //监听web页加载状态
     
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged webViewState) async {
//      setState(() {
//        title = webViewState.type.toString();
//      });
      switch (webViewState.type) {
        case WebViewState.finishLoad:
          handleJs();

          // getWebTitle();

          break;
        case WebViewState.shouldStart:
          break;
        case WebViewState.startLoad:
          break;
        case WebViewState.abortLoad:
          break;
      }
    });

    // 监听页面加载url
     
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
//      getWebTitle(url: url);

//      setState(() {
//        title = url;
//      });
    });

    //监听x轴滑动距离 好像没什么用
//    flutterWebviewPlugin.onScrollXChanged.listen((double offsetX) {
//      title = offsetX.toString();
//    });

//    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
//      title = offsetY.toString();
//    });

    tabs = <Widget>[
      Tab(
        child: GestureDetector(
          child: Text("刷新"),
          onTap: () {
            flutterWebviewPlugin.reload();
          },
        ),
      ),
      Tab(
        child: GestureDetector(
          child: Text("返回"),
          onTap: () {
            flutterWebviewPlugin.goBack();
          },
        ),
      ),
      Tab(
        child: GestureDetector(
          child: Text("加载指定url"),
          onTap: () {
            flutterWebviewPlugin.reloadUrl("https://www.360.com");
          },
        ),
      ),
    ];
    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return !_isShow ? Container():
    WebviewScaffold(
      url: "http://www.baidu.com",
      //默认加载地址
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
        // leading: GestureDetector(
        //   child: Icon(Icons.arrow_back),
        //   onTap: () {
        //     flutterWebviewPlugin.goBack();
        //   },
        // ),
        // bottom: TabBar(
        //   tabs: tabs,
        //   controller: controller,
        //   indicatorColor: Colors.red,
        // ),
        actions: <Widget>[],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         title: Text(
      //           "首页", /*style: TextStyle(color: Color(0xff333333)),*/),
      //         activeIcon: Icon(
      //           Icons.home,
      //           color: Color(0xffDE331F),
      //         ),
      //         backgroundColor: Color(0xffff0000),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.devices_other),
      //         title: Text(
      //           "其他", /*style: TextStyle(color: Color(0xff333333)),*/),
      //         activeIcon: Icon(
      //           Icons.devices_other,
      //           color: Color(0xffDE331F),
      //         ),
      //         backgroundColor: Color(0xffff0000),
      //       ),
      //     ],
      //     currentIndex: choiceIndex,
      //     fixedColor: Color(0xffDE331F),
      //     onTap: (index) {
      //       if (index == 0) {
      //         setState(() {
      //           choiceIndex = 0;
      //           flutterWebviewPlugin.reloadUrl("https://www.qq.com/");
      //         });
      //       } else {
      //         setState(() {
      //           flutterWebviewPlugin.reloadUrl("https://www.alipay.com/");
      //           choiceIndex = 1;
      //         });
      //       }
      //     }
      // ),
      scrollBar: false,
      withZoom: false,
    );
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  void handleJs() {
    flutterWebviewPlugin.evalJavascript(
        "abc(${title}')")
        .then((result) {

    });
  }
}


/**
 *
 * const WebviewScaffold({
    Key key,
    this.appBar,
    @required this.url,
    this.headers,//
    this.withJavascript,//是否允许执行js代码
    this.clearCache,//
    this.clearCookies,//
    this.enableAppScheme,//
    this.userAgent,//
    this.primary = true,//
    this.persistentFooterButtons,//
    this.bottomNavigationBar,//
    this.withZoom,//是否允许网页缩放
    this.withLocalStorage,//是否允许LocalStorage
    this.withLocalUrl,//
    this.scrollBar,//是否显示滚动条
    this.supportMultipleWindows,//
    this.appCacheEnabled,//
    this.hidden = false,//
    this.initialChild,//
    this.allowFileURLs,//
    this.resizeToAvoidBottomInset = false,//
    this.invalidUrlRegex,//
    this.geolocationEnabled//
    })
 */
