import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/riverpod/state/riverpod_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 2. 전역 변수 설계(축약)
final badgeProvider = NotifierProvider<RiverpodBadge, int>(() => RiverpodBadge());
// 더 축약
// final badgeProvider = NotifierProvider<RiverpodBadge, int>(RiverpodBadge.new);

/// 1. 상태 클래스 만들기
// 다른 상태 클래스와 상호 작용
// [] <- CatalogList와 상호 작용을 해야 한다.
class RiverpodBadge extends Notifier<int> {

  // 메모리에 올라 갈 때 단 한번만 호출되는 메소드
  // Notifier -> T State
  @override
  int build() {
    // 청취()
    List<Catalog> cartCatalogList = ref.watch(cartProvider);
    return cartCatalogList.length;
  }
  // 상태 속성 ---> int(User)


// Riverpod을 쓰면 더 좋은 이유
// Riverpod 자체는 메모리 누수에 대해 걱정할 필요가 없이 설계가 되어있다.
}