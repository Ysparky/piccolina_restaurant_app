import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/app/presentation/pages/order/order_view_model.dart';
import 'package:piccolina_restaurant_app/core/base/base_loading_overlay.dart';
import 'package:piccolina_restaurant_app/core/models/orders.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OrderViewModel(),
      child: const BaseLoadingOverlay<OrderViewModel>(
        child: OrderPageBase(),
      ),
    );
  }
}

class OrderPageBase extends StatelessWidget {
  const OrderPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<OrderViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFDFBF9),
            Color(0xFFFFF3ED),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _vm.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Pedidos',
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20),
          ),
          leading: IconButton(
            onPressed: _vm.exit,
            splashRadius: wp(5),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF556574),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(8)),
            child: Column(
              children: [
                SizedBox(height: hp(2)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF5F3F3),
                  ),
                  padding: EdgeInsets.symmetric(vertical: hp(1)),
                  child: Row(
                    children: [
                      SizedBox(width: wp(3)),
                      OrdersStateChip(
                        active: !_vm.onGoingState,
                        text: 'Anteriores',
                        onTap: () => _vm.toggleState(false),
                      ),
                      const Spacer(),
                      OrdersStateChip(
                        active: _vm.onGoingState,
                        text: 'En camino',
                        onTap: () => _vm.toggleState(true),
                      ),
                      SizedBox(width: wp(3)),
                    ],
                  ),
                ),
                SizedBox(height: hp(2)),
                Expanded(
                  child: StreamBuilder<List<Orders>>(
                    stream: _vm.orders,
                    builder: (context, AsyncSnapshot<List<Orders>> snapshot) {
                      if (snapshot.hasData) {
                        final orders = snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.only(bottom: hp(1)),
                          physics: BouncingScrollPhysics(),
                          itemCount: orders.length,
                          itemBuilder: (_, int index) => OrderCard(
                            order: orders[index],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Orders order;

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<OrderViewModel>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: hp(1)),
      child: Card(
        elevation: 5,
        color: Color(0xFFF5F3F3),
        child: ExpansionTile(
          title: Text(
            _vm.formatFecha(order.statusLog.first.createdAt),
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Color(0xFF526371),
                  fontWeight: FontWeight.bold,
                ),
          ),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: wp(2), vertical: hp(2)),
              child: Column(
                children: [
                  ...order.items
                      .map(
                        (i) => OrderDetailRow(item: i),
                      )
                      .toList(),
                  SizedBox(height: hp(2)),
                  Row(
                    children: [
                      SizedBox(width: wp(5)),
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Color(0xFF526371),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        'S/. ${order.totalPrice}',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Color(0xFF526371),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(width: wp(2)),
                    ],
                  ),
                  SizedBox(height: hp(2)),
                  OrderStatusRow(order: order),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderStatusRow extends StatelessWidget {
  const OrderStatusRow({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Orders order;

  @override
  Widget build(BuildContext context) {
    final _vm = Provider.of<OrderViewModel>(context);
    return Row(
      children: [
        SizedBox(width: wp(5)),
        Text(
          'Estado',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Color(0xFF526371),
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFECDF),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: wp(2),
            vertical: hp(1),
          ),
          child: Text(
            _vm.formatStatus(order.statusLog.first.status),
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Color(0xFF526371),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}

class OrderDetailRow extends StatelessWidget {
  const OrderDetailRow({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: hp(1), horizontal: wp(2)),
      child: Row(
        children: [
          SizedBox(
            width: wp(18),
            child: Image.network(item.product.imageUrl),
          ),
          SizedBox(width: wp(3)),
          Expanded(
            child: Text(
              '${item.quantity}  ${item.product.name}',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Color(0xFF526371),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Text(
            'S./ ${item.totalPrice}',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Color(0xFF526371),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class OrdersStateChip extends StatelessWidget {
  const OrdersStateChip({
    Key key,
    @required this.active,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  final bool active;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: active ? Color(0xFFFFA001) : Colors.transparent,
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(
          horizontal: wp(3),
          vertical: hp(1),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: active ? Colors.white : Color(0xFF526371),
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
