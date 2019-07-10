import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:rubblish_app/pages/detail/detail_page.dart';
import 'package:rubblish_app/pages/container_page.dart';
import 'package:rubblish_app/pages/rubblishCategory/dry.dart';
import 'package:rubblish_app/pages/rubblishCategory/hazarous.dart';
import 'package:rubblish_app/pages/rubblishCategory/recycled.dart';
import 'package:rubblish_app/pages/rubblishCategory/wet.dart';

///https://www.jianshu.com/p/b9d6ec92926f

class Router {
  static const homePage = 'app://';
  static const detailPage = 'app://DetailPage';
  static const dryPage = 'app://dryPage';
  static const wetPage = 'app://wetPage';
  static const hazarousPage = 'app://hazarousPage';
  static const recycledPage = 'app://recycledPage';

  // static const playListPage = 'app://VideosPlayPage';
  // static const searchPage = 'app://SearchPage';
  // static const photoHero = 'app://PhotoHero';
  // static const personDetailPage = 'app://PersonDetailPage';

// Widget _router(String url, dynamic params) {
//   String pageId = _pageIdMap[url];
//   return _getPage(pageId, params);
// }

// Map<String, dynamic> _pageIdMap = <String, dynamic>{
//   'app/': 'ContainerPageWidget',
//   detailPage: 'DetailPage',
// };

  Widget _getPage(String url, dynamic params) {
      switch (url) {
        case homePage:
          return ContainerPage();
        case dryPage:
          return DryPage();
        case wetPage:
          return WetPage();
        case hazarousPage:
          return HazarousPage();
        case recycledPage:
          return RecycledPage();
        // case detailPage:
        //   return DetailPage(params);
        // case playListPage:
        //   return VideoPlayPage(params);
        // case searchPage:
        //   return SearchPage(searchHintContent: params);
        // case photoHero:
        //   return PhotoHeroPage(
        //       photoUrl: params['photoUrl'], width: params['width']);
        // case personDetailPage:
        //   return PersonDetailPage(params['personImgUrl'], params['id']);
      }
    return null;
  }

//
//  void push(BuildContext context, String url, dynamic params) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url, params);
//    }));
//  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
