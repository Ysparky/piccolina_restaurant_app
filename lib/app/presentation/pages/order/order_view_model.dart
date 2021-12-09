import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/services/order_service.dart';

class OrderViewModel extends BaseViewModel {
  OrderViewModel() {
    _onGoingState = true;
    setLoading(true);
    orderService.getOrders();
    setLoading(false);
  }

  var _onGoingState = true;

  final orderService = inject<OrderService>();

  bool get onGoingState => _onGoingState;
  Orders get order => orderService.order.value;

  Stream<List<Orders>> get orders => orderService.orders;

  void exit() => ExtendedNavigator.root.pop();

  void toggleState(bool value) {
    _onGoingState = value;
    notifyListeners();
  }

  String formatFecha(DateTime orderDate) {
    return DateFormat('yyyy-MM-dd – kk:mm').format(orderDate);
  }

  String formatStatus(String orderStatus) {
    String status = '';
    switch (orderStatus) {
      case 'NEW':
        status = 'Atendido';
        break;
      case 'CHECKOUT':
        status = 'Pagado';
        break;
      case 'SHIPPED':
        status = 'En camino';
        break;
    }
    return status;
  }
}
