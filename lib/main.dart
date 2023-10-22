import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_auth/screen/home_screen.dart';
import 'package:todo_app_auth/theme/colors/light_colors.dart';

void main() async {
  //initalize firebase
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.lightYellow, // navigation bar color
    statusBarColor: Color(0xffffb969), // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: LightColors.darkBlue,
              displayColor: LightColors.darkBlue,
              fontFamily: 'Poppins',
            ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
