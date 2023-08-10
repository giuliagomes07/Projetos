import 'package:estado/pages/customer_page.dart';
import 'package:estado/widgets/drawer_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check if is the right instance', () {
    const drawerWidget = DrawerWidget();

    expect(drawerWidget, isInstanceOf<DrawerWidget>());
  });

  test('Check if is the right instance', () {
    const customerListScreen = CustomerListScreen();

    expect(customerListScreen, isInstanceOf<CustomerListScreen>());
  });
}
