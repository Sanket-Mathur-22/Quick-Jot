import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_jot/screens/home_screen.dart';
import 'package:quick_jot/screens/splash_screen.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VxApp(
        store: Mystore(),
        builder: (context, vxData) => GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness:
                    vxData.isDarkMode ? Brightness.dark : Brightness.light,
                useMaterial3: true,
              ),
              home: const SpalshScreen(),
            ));
  }
}

class Mystore extends VxStore {}
