import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parotia/modules/welcome/presentation/views/welcome_view.dart';

void main() {
  runApp(const MainApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}




class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white
        )
      ),
      home: const WelcomeView(),
    );
  }
}
