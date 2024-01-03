import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';
// inheritedWidget을 사용할 3가지 규칙

// 1. 공유 상태로 관리할 데이터를 결정한다 --> cart 데이터

/// 규칙 1 공유 상태로 만들 데이터를 InheritedWidget 상속 받아야 한다.
class InheritedCartWidget extends InheritedWidget {
  // 카트에 담긴 리스트 데이터를 관리
  final List<Catalog> cartList;
  // 이벤트가 일어났는 지 알람을 받아야 함 = 콜백 함수 필요
  final void Function(Catalog catalog) onPressedCatalog;

  const InheritedCartWidget(
      {required this.cartList,
      required this.onPressedCatalog,
      required super.child}); // 부모 클래스의 생성자 호출(super.child)

  // 외부에서 쉽게 접근할 수 있는 static 메소드를 만들어 준다.
  // BuildContext - 어디에서 접근을 하는 지 정보를 파악할 수 있음
  // * 개발모드에서만 권장
  // static InheritedCartWidget of(BuildContext context) {
  //   final InheritedCartWidget? result =
  //       context.dependOnInheritedWidgetOfExactType<InheritedCartWidget>();
  //   assert(result != null, "Not found InheritedCartWidget in context");
  //   return result!;
  // }

  // * release 모드
  static InheritedCartWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCartWidget>();
  }

  // 위젯 트리에서 해당 위젯이 변경(업데이트)되었을 때 호출되는 메소드(이전 상태와 현재 상태를 비교)
  // 위젯 트리가 다시 빌드할 필요가 있는 지 알려 준다.
  // true or false
  // true --> 재 빌드 / false --> 멈춤
  // oldWidget = 이전 데이터
  // cartList = 현재 데이터
  // 두 데이터가 다르다면, true -> build를 호출
  @override
  bool updateShouldNotify(covariant InheritedCartWidget oldWidget) {
    print("호출 시점 확인");
    print("oldWidget : ${oldWidget.hashCode}");
    print("newBuildWidget : ${cartList.hashCode}");
    print("현재 갯수 : ${cartList.length} / ${oldWidget.cartList.length}");

    /// home에서 해당 함수가 호출 될 때, const가 붙으면 데이터가 변경되어도 주소값의 변경이 없어서(얕은 복사) 무조건 false를 반환한다.
    return cartList != oldWidget.cartList;
  }
}
