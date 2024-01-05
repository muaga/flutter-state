import 'package:class_statement/provider/state/provider_badge.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/models/vo_catalog.dart';
import '../common/w_bottom_bar.dart';
import 'f_cart.dart';
import 'f_catalog.dart';

// 상태 관리 - 프로바이더 활용
class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  // 현재 선택된 index
  int currentIndex = 0;
  // 선택된 카탈로그 정보를 담을 수 있는 자료 구조 선언
  List<Catalog> catalogList = [];

  // 샘플 데이터 (local DB, 통신)
  late List<Catalog> responseListData;

  // 메모리에 올라갈 때 딱 한번만 초기화 되는 부분
  @override
  void initState() {
    super.initState();
    // initState <-- 위젯을 업데이트 하는 코드를 사용하면 안된다. (버그발생)
    // 가능한 데이터 초기화 처리만 사용하자.
    responseListData = catalogListSample;
  }

  // 콜백 받을 메서드 선언
  void onPressedCatalog(Catalog catalog) {
    print("여기 HomeScreen 위젯 이벤트 발생");
    // 콜백이 일어 나면 UI 업데이트 처리
    setState(() {
      if (catalogList.contains(catalog)) {
        // 리스트에 object 포함 하고 있다면 삭제 처리
        catalogList.remove(catalog);
      } else {
        catalogList.add(catalog); // add 처리
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // context.watch()를 설정하면, 아래의 자식 함수가 모두 렌더링이 된다.
    // 그래서 select 또는 consumer()를 사용한다.
    print("HomeScreen build() 함수 호출");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderCart()),
        ChangeNotifierProvider(create: (context) => ProviderBadge(providerCart: context.read()))
        // 종속성때문에 ProviderCart가 먼저 생성되어야 한다.
        // 위의 순서를 보면 ProviderCart가 먼저 생성되었기 때문에
        // providerBadge에서 providerCart는 context를 사용해 read만 해주면 종속 관계를 맺을 수 있다.
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Catalog'),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: [
            CatalogWidget(),
            CartWidget(),
          ],
        ),
        // cousumer에 제네릭으로 Provider를 선언하면, 다운캐스팅을 하지 않아도 된다.
        bottomNavigationBar: Consumer<ProviderBadge>(
          // value = 인스턴스, provider를 넣는다.
          builder: (context, providerBadge, child) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: '${providerBadge.counter}',
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}