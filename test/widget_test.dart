// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_statefull/core/my_app.dart';

/////////////////////////////// Flutter Testing Example ///////////////////////////////

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

/////////////////////////////// Asynchronous Programming Dart ///////////////////////////////

// void main(List<String> args) async {
//   print(await getUserName());
//   print(await getUserAddress());
//   print(await getPhoneNumber());
//   print(await getCity());
//   print(await getCountry());
//   print(await getContinent());
// }

// // String getUserName() {
// //   return 'john doe';
// // }

// // Future<String> getUserName() async {
// //   return 'john doe';
// // }

// Future<String> getUserName() async => 'john doe';
// Future<String> getUserAddress() => Future.value('123 main st');
// Future<String> getPhoneNumber() =>
//     Future<String>.delayed(const Duration(seconds: 1), () => '0912 123 5248');
// Future<String> getCity() async {
//   await Future.delayed(const Duration(seconds: 1));
//   return 'new york';
// }

// Future<String> getCountry() async => 'usa';
// Future<String> getContinent() => Future.value('amerika');

/////////////////////////////// Factory Pattern Example ///////////////////////////////

// abstract class Empolyee {
//   void work();
//   factory Empolyee(String type) {
//     switch (type) {
//       case 'programmer':
//         return Programmer();
//       case 'hr':
//         return HRManager();
//       case 'boss':
//         return Boss();
//       default:
//         Programmer();
//     }
//   }
// }

// enum EmployeeType {
//   programmer,
//   boss,
//   hr,
// }

// class Programmer implements Empolyee {
//   @override
//   void work() {
//     print('codeing an app');
//   }
// }

// class HRManager implements Empolyee {
//   @override
//   void work() {
//     print('recruiting people');
//   }
// }

// class Boss implements Empolyee {
//   @override
//   void work() {
//     print('leading the people');
//   }
// }

// class FactoryMethod {
//   static Empolyee getEmployee(EmployeeType type) {
//     switch (type) {
//       case EmployeeType.programmer:
//         return Programmer();
//       case EmployeeType.hr:
//         return HRManager();
//       case EmployeeType.boss:
//         return Boss();
//       default:
//         return Programmer();
//     }
//   }
// }

/////////////////////////////// Method Overriding Dart ///////////////////////////////
//uncomplete

// void main() {
//   var dog = Dog();
//   dog.eat();
// }

// class Animal {
//   late String color;

//   void eat() {
//     print('animal is eating');
//   }
// }

// class Dog extends Animal {
//   late String breed;

//   void bark() {
//     print('barking');
//   }

//   void eat() {
//     super.eat;
//     print('dog is eating');
//   }
// }
