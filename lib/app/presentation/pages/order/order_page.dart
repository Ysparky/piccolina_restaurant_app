import 'package:flutter/material.dart';
import 'package:piccolina_restaurant_app/core/values/responsive.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFF5F3), Color(0xFFFFEFEF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: hp(3)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(8)),
                child: Text(
                  'Pedidos',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                ),
              ),
              SizedBox(height: hp(2)),
              const OrderStatusRow(),
              SizedBox(height: hp(2)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(8)),
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      highlightElevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(2.5),
                        vertical: hp(1.5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                'En Cocina',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                'id: 224665',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(height: hp(1)),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Repartidor',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                    Text(
                                      'Giancarlo Ruiz',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'Fecha',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                    Text(
                                      '18 de noviembre, 03:09 PM',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStatusRow extends StatelessWidget {
  const OrderStatusRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFDCD9),
      padding: EdgeInsets.symmetric(vertical: hp(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              // padding: Edg
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: wp(3),
                  vertical: hp(1.5),
                ),
              ),
            ),
            child: Text(
              'En Delivery (2)',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: wp(3),
                  vertical: hp(1.5),
                ),
              ),
            ),
            child: Text(
              'Completados',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color(0xFFC0493F),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
