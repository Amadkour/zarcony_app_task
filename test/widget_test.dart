// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:zarcony_app_task/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarcony_app_task/modules/cart/provider/repo/mock_cart_repo.dart';
import 'package:zarcony_app_task/modules/home/provider/category/model/CategoryModel.dart';
import 'package:zarcony_app_task/modules/home/provider/category/repo/mock_category_repo.dart';
import 'package:zarcony_app_task/modules/home/provider/deal/model/deal_model.dart';
import 'package:zarcony_app_task/modules/home/provider/deal/repo/mock_deal_repo.dart';

import 'fake.dart';
void main() {
  late FutureProvider fakeHomeControllerProvider;
  late FutureProvider  fakeProfileControllerProvider ;
  setUp(() {
    ///----------------category setup
    final repositoryProvider = Provider((ref) => MockCategoryRepo());
    //-------------------listen data--------------///
    fakeHomeControllerProvider =
        FutureProvider<List<CategoryModel>>((ref) async {
          final repository = ref.read(repositoryProvider);
          return repository.fetchData();
        });
    group('Home Testing', () {
      testWidgets('Home Screen Testing ui and integration testing', (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: Consumer(builder: (context, ref, _) {
                  final persons = ref(fakeHomeControllerProvider);
                  // The list of todos is loading or in error
                  return persons.when(
                      data: (data) {
                        return ListView(
                          children: [
                            for (final todo in data) CategoryItem(todo: todo)
                          ],
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (_, e) => Text(e.toString()));
                }),
              ),
            ),
          ),
        );

        // The first frame is a loading state.
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        // Re-render. TodoListProvider should have finished fetching the todos by now
        await tester.pump();

        // No longer loading
        expect(find.byType(CircularProgressIndicator), findsNothing);

        expect(tester.widgetList(find.byType(CategoryItem)), [
          isA<CategoryItem>()
              .having((s) => s.todo.id, 'check id', '1')
              .having((s) => s.todo.name, 'check name','fruits')
        ]);
      });
    });
  });
      }
