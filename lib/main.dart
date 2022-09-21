import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/theme/app_colors.dart';
import 'package:simple_app/widgets/auth/auth_widget.dart';
import 'package:simple_app/widgets/auth/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simple app',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainColorForMyApp,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.mainColorForMyApp,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey)),
      routes: {
        '/': (context) => MainScreenWidget(),
        '/main_screen_widget': (context) => AuthWidget(),
      },
    );
  }
}
