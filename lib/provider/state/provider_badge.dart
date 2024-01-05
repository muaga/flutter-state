import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

// ProviderBadge는 count 속성만 가지면 된다.

class ProviderBadge extends ChangeNotifier {

  ProviderBadge({required this.providerCart}) {
    // 2) 생성자 몸체
    providerCart.addListener(providerCartListener); // 청취
  }

  // 상태 속성
  int counter = 0;

  // 청취(cartList에 따라 상태가 변경되므로) - 1) 듣고 있으라는 명령어를 내려줘야 한다.
  final ProviderCart providerCart;

  // 3) 상태 변경 로직 구현
  // 청취하고 있다가 ProviderCart가 변경이 되면 어떤 동작을 할 지 결정
  void providerCartListener(){
    // cartList의 length를 가져오면 된다.
    counter = providerCart.catalogCartList.length;

    // 알림 처리
    notifyListeners();
  }

  // 4) 메모리 해제 처리
  @override
  void dispose() {
    // 부모 클래스 함수 호출 전, 메모리에서 제거 처리
    providerCart.removeListener(providerCartListener);
    // 부모 클래스에 함수 호출
    super.dispose();
  }
}