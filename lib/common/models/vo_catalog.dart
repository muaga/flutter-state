import 'package:flutter/material.dart';

// Catalog 클래스 설계 시에 Cart에 담긴 여부는 가지고 있으면 안된다(객체지향)

class Catalog {
  Color color;
  String title;

  // Name 생성자
  Catalog.name({required this.color, required this.title});
}

// 샘플 데이터 (이번 프로젝트에서는 통신을 통해서 받았다고 가정 합니다)
List<Catalog> catalogListSample = [
  Catalog.name(color: Colors.red, title: 'Item 1'),
  Catalog.name(color: Colors.green, title: 'Item 2'),
  Catalog.name(color: Colors.blue, title: 'Item 3'),
  Catalog.name(color: Colors.yellow, title: 'Item 4'),
  Catalog.name(color: Colors.pink, title: 'Item 5'),
  Catalog.name(color: Colors.purple, title: 'Item 6'),
  Catalog.name(color: Colors.orange, title: 'Item 7'),
  Catalog.name(color: Colors.cyan, title: 'Item 8'),
  Catalog.name(color: Colors.brown, title: 'Item 9'),
  Catalog.name(color: Colors.black, title: 'Item 10'),
  Catalog.name(color: Colors.purple, title: 'Item 11'),
  Catalog.name(color: Colors.orange, title: 'Item 12'),
  Catalog.name(color: Colors.cyan, title: 'Item 13'),
  Catalog.name(color: Colors.brown, title: 'Item 14'),
  Catalog.name(color: Colors.black, title: 'Item 15'),
];
