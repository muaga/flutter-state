//f : 플래그먼트 (컴포넌트처럼 전역적으로 사용 가능)
//s : 전체 화면
//w : 위젯

import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';
import '../common/w_bottom_bar.dart';
import 'f_cart.dart';
import 'f_catalog.dart';

// 상태가 있는 위젯 생성
class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  /// 현재 선택된 Index
  int currentIndex = 0;

  /// 선택된 catalog 정보를 담을 수 있는 자료 구조 선언
  // catalogList는 아래 자식 위젯 2개에 모두 사용해야 하기 때문에
  // 현재 자식 위젯에서 catalogList를 사용할 수 있도록 구현 중
  List<Catalog> catalogList = [
    // Catalog.name(color: Colors.red, title: "테스트 아이템 1"),
    // Catalog.name(color: Colors.orange, title: "테스트 아이템 2"),
  ];

  /// 샘플 데이터(local DB, 통신)
  // late : 해당 데이터를 사용할 때 쓸 수 있도록 연결시켜놓는 통신(lazy)
  late List<Catalog> responseListData;

  /// 메모리에 올라갈 때 딱 한번만 초기화 되는 부분
  @override
  void initState() {
    super.initState();

    // initState <-- 위젯을 업데이트 하는 코드를 사용하면 안된다(버그발생)
    // 가능한 데이터 초기화 처리만 사용하자
    responseListData = catalogListSample;
  }

  /// 콜백 받을 메소드 선언
  void onPressedCatalog(Catalog catalog) {
    print("여기 HomeScreen2 위젯 이벤트 발생");

    // 콜백이 일어나면 UI 업데이트 처리
    setState(() {
      // catalogList에 어떠한 객체가 담겼는 지에 따라 UI 업데이트
      // 똑같은 객체가 존재 -> 삭제
      // 똑같은 객체가 없다면 -> 추가

      /// 깊은 복사 개념으로 변경해줘야 한다.
      /// [1, 2, 3, 4] -> [1, 2, 3]
      /// catalogList에서 특정 값만 삭제해야 하므로, catalogList 변수에 새로운 List 객체를 생성해서
      /// 특정 값 제외 기존 값들을 넣는 것이 목표이다.(where - forEach)
      if (catalogList.contains(catalog)) {
        catalogList = catalogList.where((e) {
          return e != catalog;
        }).toList();
      } else {
        /// 새로운 object를 추가 ---> 깊은 복사
        /// [1, 2, 3] + 4
        /// 스프레드 연산자
        catalogList = [...catalogList];
      }

      // 얕은 복사 개념으로 돌아감
      // if (catalogList.contains(catalog)) {
      //   catalogList.remove(catalog);
      // } else {
      //   catalogList.add(catalog);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("HomeScreen2 build() 함수 호출");

    /// 규칙 2 위젯트리에 등록
    return InheritedCartWidget(
      cartList: catalogList,
      onPressedCatalog: onPressedCatalog,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Catalog"),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            CatalogWidget(),
            CartWidget(),
          ],

          /// const : 컴파일 시점에 1번만 올리는 것이라서, re-build 시 변경이 되지 않는다.
          /// 얕은 복사로 데이터 값만 변경되지 주소값을 변경되지 않기 때문이다.
          /// 그래서 깊은 복사를 해서 데이터 변경 시 주소값도 변경이 되도록 해야 한다.
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: currentIndex,
          cartTotal: '${catalogList.length}',
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
