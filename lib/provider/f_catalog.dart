import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/models/vo_catalog.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});


  @override
  Widget build(BuildContext context) {
    ProviderCart providerCart = context.watch<ProviderCart>();

    return ListView.builder(
      itemCount: catalogListSample.length,
      itemBuilder: (context, index) {
        // 넘겨 받은 리스트 중에 하나의 오브젝트이다.
        Catalog catalog = catalogListSample[index];
        return CatalogItem(
            catalog: catalog,
            isInCart: providerCart.catalogCartList.contains(catalog),
            onPressedCatalog: providerCart.onPressedCatalog);
      },
    );
  }
}