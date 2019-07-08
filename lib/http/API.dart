import 'package:rubblish_app/http/http_request.dart';

import 'package:rubblish_app/bean/search_rubblish_entity.dart';
typedef RequestCallBack<T> = void Function(T value);

class API {
  static const BASE_URL = 'http://47.97.184.227';
  
  var _request = HttpRequest(API.BASE_URL);

  void getRubblishCategory(name, RequestCallBack requestCallBack) async {
    final result = await _request.get('/garbage/classified?name=$name');
    var resultList = result['data'];
    List<SearchRubblishEntity> list = resultList.map<SearchRubblishEntity>((item) => SearchRubblishEntity.fromMap(item)).toList();
    requestCallBack(list);
  }
}
