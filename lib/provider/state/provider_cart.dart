import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';


// 상태 클래스 제공자 설계
class ProviderCart extends ChangeNotifier {
  // 상태 속성
  List<Catalog> catalogCartList = [];

  // 상태 변경 로직 설계
  void onPressedCatalog(Catalog catalog){
    if(catalogCartList.contains(catalog)){
      // 얕 - catalogCartList.remove(catalog);
      catalogCartList = catalogCartList.where((e) {
        return e != catalog;
      }).toList();
    }else{
      // 얕 - catalogCartList.add(catalog);
      catalogCartList = [...catalogCartList, catalog];
    }

    // 상태 클래스를 듣고(리스너) 객체들에게 상태 변경을 알리고 싶다면
    notifyListeners();
    // notifyListeners = 참조 비교(얕은 복사 개념)
    // catalogCartList에 값을 넣어줘야(깊은 복사) 화면이 변한다.
  }
}