import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/models/vo_catalog.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    // Provider에 접근하는 방법
    // context.read();
     ProviderCart providerCart = context.watch<ProviderCart>();

    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: providerCart.catalogCartList.length,
            itemBuilder: (context, index) {
              // 하나에 오브젝트만 뽑자.
              Catalog catalog = providerCart.catalogCartList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  onPressedCatalog: providerCart.onPressedCatalog);
            },
          ),
        ),
        // 구분선
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        // 합계 - 텍스트
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${providerCart.catalogCartList.length}',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}