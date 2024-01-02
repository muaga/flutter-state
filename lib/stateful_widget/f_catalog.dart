import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

class CatalogWidget extends StatelessWidget {
  // 1. 통신을 통해 받은 데이터가 필요(통신)
  final List<Catalog> responseListData;

  // 2. 내 cart에 담은 데이터 정보가 필요(로컬)
  final List<Catalog> cartCatalogList;

  // 3. 상태 변경 메소드가 필요
  final void Function(Catalog catalog) onPressedCatalog;

  const CatalogWidget(
      {super.key,
      required this.responseListData,
      required this.cartCatalogList,
      required this.onPressedCatalog});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: responseListData.length,
        itemBuilder: (context, index) {
          // 넘겨 받은 리스트 중에 하나의 object 이다.
          Catalog catalog = responseListData[index];
          return CatalogItem(
              catalog: catalog,
              isInCart: cartCatalogList.contains(catalog),
              onPressedCatalog: onPressedCatalog);
        });
  }
}
