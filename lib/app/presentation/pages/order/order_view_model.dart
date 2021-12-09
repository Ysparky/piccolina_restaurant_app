import 'package:piccolina_restaurant_app/core/base/base_view_model.dart';
import 'package:piccolina_restaurant_app/core/di/injector.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/services/order_service.dart';

class OrderViewModel extends BaseViewModel {
  OrderViewModel();

  final orderService = inject<OrderService>();

  Orders get order => orderService.order.value;
}
