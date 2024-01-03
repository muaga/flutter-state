import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

/// InheritedWidget을 활용하면 생성자 의존 주입을 하지 않아도 된다.
class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("여기는 CatalogWidget Build 함수 실행");

    /// BuildContext 안에서 사용해서 공유 데이터 받아오기
    InheritedCartWidget? inheritedCartWidget = InheritedCartWidget.of(context)!;

    return ListView.builder(
        itemCount: catalogListSample.length,
        itemBuilder: (context, index) {
          // 넘겨 받은 리스트 중에 하나의 object 이다.
          Catalog catalog = catalogListSample[index];
          return CatalogItem(
              catalog: catalog,
              isInCart: inheritedCartWidget.cartList.contains(catalog),
              onPressedCatalog: inheritedCartWidget.onPressedCatalog);
        });
  }
}
