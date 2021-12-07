import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piccolina_restaurant_app/core/routes/routes.gr.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator<AppRouter>(
        router: AppRouter(),
      ),
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.light().copyWith(textTheme: GoogleFonts.nunitoTextTheme()),
      title: 'Piccolina App',
    );
  }
}
