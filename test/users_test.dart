// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_ceiba_flutter/domain/user_gateway.dart';
import 'package:prueba_ceiba_flutter/domain/user_usecase.dart';

import 'package:prueba_ceiba_flutter/main.dart';
import 'package:prueba_ceiba_flutter/widgets/home_page.dart';

import 'test_app.dart';
import 'user_test_data.dart';

class UserMockApi extends Mock implements UserGateway {}

class UserMockCache extends Mock implements UserGateway {}

class PostMockApi extends Mock implements UserGateway {}

void main() {
  testWidgets('Queries api when cache returns no users',
      (WidgetTester tester) async {
    final mockApi = UserMockApi();
    final mockCache = UserMockCache();

    when(() => mockCache.listUsers()).thenAnswer((_) async => []);
    when(() => mockCache.saveUsers([user1])).thenAnswer((_) async {});

    when(() => mockApi.listUsers()).thenAnswer((_) async => [user1]);

    await tester.pumpWidget(
      TestApp(
        child: HomePage(usecase: UserUsecase(mockApi, mockCache)),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Tulio'), findsOneWidget);
  });

  testWidgets('Queries cache when it is not empty',
      (WidgetTester tester) async {
    final mockApi = UserMockApi();
    final mockCache = UserMockCache();

    when(() => mockCache.listUsers()).thenAnswer((_) async => [user2]);
    when(() => mockCache.saveUsers([user1])).thenAnswer((_) async {});
    when(() => mockApi.listUsers()).thenAnswer((_) async => [user1]);

    await tester.pumpWidget(
      TestApp(
        child: HomePage(usecase: UserUsecase(mockApi, mockCache)),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Ramona'), findsOneWidget);
  });
}
