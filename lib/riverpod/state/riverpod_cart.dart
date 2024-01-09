import 'package:riverpod/riverpod.dart';

import '../../common/models/vo_catalog.dart';

// 포인트 - 리버팟은 상태 클래스와 상태 변경 로직 클래스를 분리한다.
/// 2. 전역 변수 설계 : 상태 클래스 접근 로직
// 런타임 시점에서 초기화가 되어야 하기 때문에 final을 사용해야 한다.
final cartProvider = NotifierProvider<RiverpodCart, List<Catalog>>((){
  // 컴파일 시점에서 cartProvider가 어디에 접근을 할 수 있게 하는 지
  // 알려야 하기 때문에, NotifierProvier에 제네릭 변수로 <상태 클래스 이름, 상태 객체>를
  // 지정해 놓아야 한다.
  // ! 외부에서 전역 변수로 접근하기 때문에, 전역 변수에서 상태 클래스에 접근해야 한다.
  return RiverpodCart();
});



/// 1. 상태 클래스에 설계
class RiverpodCart extends Notifier<List<Catalog>>{

  // 이전에는 이렇게 상태 속성을 지정했는데
  // List<Catalog> list = [];
  // 아래처럼 변경한다.
  // build()는 Notifier 객체가 처음 생성될 때 한 번 호출되어 상태를 설정한다(State)
  // 내부에서 T _state;가 있다.
  @override
  List<Catalog> build() {
    return [];
  }

  // 행위
  void onCatalogPressed(Catalog catalog) {
    // Notifier 객체에는 state가 있어서
    // 이전에는 list라는 변수 이름에서 contains를 사용했지만,
    // 이번에는 Notifier 객체를 통해 삭제, 등록을 가능하게 하기 때문에
    // Notifier 안의 state를 사용해 삭제, 등록을 가능하게 한다.
    // 현재 Notifier의 객체 타입은 List<Catalog>이므로, contains를 사용할 수 있다.

    if(state.contains(catalog)){
      state = state.where((element) {
        return element != catalog;
      }).toList();
    }else{
      state = [...state, catalog];
    }
  }
}