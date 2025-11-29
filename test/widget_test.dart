import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('App', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
    });
  });

  group('OrderScreen - Quantity', () {
    testWidgets('shows initial quantity and title',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      expect(find.text('Sandwich Counter'), findsOneWidget);
    });

    testWidgets('increments quantity when Add is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
    });

    testWidgets('decrements quantity when Remove is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('does not decrement below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('does not increment above maxQuantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      for (int i = 0; i < 10; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      expect(find.text('5 white footlong sandwich(es): 🥪🥪🥪🥪🥪'),
          findsOneWidget);
    });
  });

  group('OrderScreen - Controls', () {
    testWidgets('toggles sandwich type with Switch',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.textContaining('footlong sandwich'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(find.textContaining('six-inch sandwich'), findsOneWidget);
    });
    testWidgets('changes bread type with DropdownMenu',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byType(DropdownMenu<BreadType>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();
      expect(find.textContaining('wheat footlong sandwich'), findsOneWidget);
      await tester.tap(find.byType(DropdownMenu<BreadType>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('wholemeal').last);
      await tester.pumpAndSettle();
      expect(
          find.textContaining('wholemeal footlong sandwich'), findsOneWidget);
    });

    testWidgets('updates note with TextField', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.enterText(
          find.byKey(const Key('notes_textfield')), 'Extra mayo');
      await tester.pump();
      expect(find.text('Note: Extra mayo'), findsOneWidget);
    });
  });

  group('StyledButton', () {
    testWidgets('renders with icon and label', (WidgetTester tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Add',
        backgroundColor: Colors.blue,
      );
      const testApp = MaterialApp(
        home: Scaffold(body: testButton),
      );
      await tester.pumpWidget(testApp);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Add'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('OrderItemDisplay', () {
    testWidgets('shows correct text and note for zero sandwiches',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 0,
        itemType: 'footlong',
        breadType: BreadType.white,
        orderNote: 'No notes added.',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      expect(find.text('Note: No notes added.'), findsOneWidget);
    });

    testWidgets('shows correct text and emoji for three sandwiches',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 3,
        itemType: 'footlong',
        breadType: BreadType.white,
        orderNote: 'No notes added.',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(
          find.text('3 white footlong sandwich(es): 🥪🥪🥪'), findsOneWidget);
      expect(find.text('Note: No notes added.'), findsOneWidget);
    });

    testWidgets('shows correct bread and type for two six-inch wheat',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 2,
        itemType: 'six-inch',
        breadType: BreadType.wheat,
        orderNote: 'No pickles',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(find.text('2 wheat six-inch sandwich(es): 🥪🥪'), findsOneWidget);
      expect(find.text('Note: No pickles'), findsOneWidget);
    });

    testWidgets('shows correct bread and type for one wholemeal footlong',
        (WidgetTester tester) async {
      const widgetToBeTested = OrderItemDisplay(
        quantity: 1,
        itemType: 'footlong',
        breadType: BreadType.wholemeal,
        orderNote: 'Lots of lettuce',
      );
      const testApp = MaterialApp(
        home: Scaffold(body: widgetToBeTested),
      );
      await tester.pumpWidget(testApp);
      expect(
          find.text('1 wholemeal footlong sandwich(es): 🥪'), findsOneWidget);
      expect(find.text('Note: Lots of lettuce'), findsOneWidget);
    });
  });

  group('Cart - Add to Cart', () {
    testWidgets('adds item to cart and shows confirmation SnackBar',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Increase quantity to 2
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      // Tap "Add to Cart" button
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      // Verify SnackBar appears with confirmation message
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.textContaining('Added 2 footlong'), findsOneWidget);
    });

    testWidgets('adds multiple different sandwiches to cart',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Add 1 footlong
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      // Toggle to six-inch
      await tester.tap(find.byType(Switch));
      await tester.pump();
      // Add 2 six-inch
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      // Verify SnackBar for second add
      expect(find.textContaining('Added 2 six-inch'), findsOneWidget);
    });
  });

  group('Cart - Display', () {
    testWidgets('displays cart item count and total price initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Initial cart should show 0 items and $0.00
      expect(find.text('Items in cart: 0'), findsOneWidget);
      expect(find.textContaining('Total: \$0.00'), findsOneWidget);
    });

    testWidgets('updates cart count when footlong item is added',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Increase quantity to 1
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      // Tap "Add to Cart"
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      // Cart should show 1 item
      expect(find.text('Items in cart: 1'), findsOneWidget);
    });

    testWidgets('calculates correct total for single footlong sandwich',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Add 1 footlong sandwich (1 x $11 = $11.00)
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Total: \$11.00'), findsOneWidget);
    });

    testWidgets('calculates correct total for multiple footlong sandwiches',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Add 3 footlong sandwiches (3 x $11 = $33.00)
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Total: \$33.00'), findsOneWidget);
      expect(find.text('Items in cart: 3'), findsOneWidget);
    });

    testWidgets('calculates correct total for six-inch sandwich',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Toggle to six-inch
      await tester.tap(find.byType(Switch));
      await tester.pump();
      // Add 2 six-inch sandwiches (2 x $7 = $14.00)
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Total: \$14.00'), findsOneWidget);
      expect(find.text('Items in cart: 2'), findsOneWidget);
    });

    testWidgets('calculates correct total for multiple six-inch sandwiches',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Toggle to six-inch
      await tester.tap(find.byType(Switch));
      await tester.pump();
      // Add 4 six-inch sandwiches (4 x $7 = $28.00)
      for (int i = 0; i < 4; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Total: \$28.00'), findsOneWidget);
      expect(find.text('Items in cart: 4'), findsOneWidget);
    });

    testWidgets('adds multiple different sandwich types and updates total',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      // Add 2 footlong sandwiches (2 x $11 = $22.00)
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Total: \$22.00'), findsOneWidget);
      expect(find.text('Items in cart: 2'), findsOneWidget);

      // Toggle to six-inch and add 3 more (3 x $7 = $21.00, total = $43.00)
      await tester.tap(find.byType(Switch));
      await tester.pump();
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Total: \$43.00'), findsOneWidget);
      expect(find.text('Items in cart: 5'), findsOneWidget);
    });
  });
}
