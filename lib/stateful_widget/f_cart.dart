import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

class CartWidget extends StatelessWidget {
  // 1. 선택된 catalog 정보를 받고, 콜백 함수까지 전달받아야 함
  final List<Catalog> cartList;
  final void Function(Catalog catalog) onPressedCatalog;

  const CartWidget(
      {super.key, required this.cartList, required this.onPressedCatalog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                Catalog catalog = cartList[index];
                return CatalogItem(
                    catalog: catalog,
                    isInCart: true,
                    onPressedCatalog: onPressedCatalog);
              }),
        ),
        // 구분선
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),

        // cart 합계(텍스트)
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "SUM : ${cartList.length}",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
