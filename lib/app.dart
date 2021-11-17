import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme:
          ThemeData.light().copyWith(textTheme: GoogleFonts.nunitoTextTheme()),
      title: 'Piccolina App',
    );
  }
}
