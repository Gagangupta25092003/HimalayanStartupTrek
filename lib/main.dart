import 'package:flutter/material.dart';
import 'package:hst/pages/contacts.dart';
import 'package:hst/pages/directory.dart';
import 'package:hst/pages/home.dart';
import 'package:hst/pages/splash.dart';
import 'package:hst/project/routes/app_route_config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRouter().router.routeInformationParser,
      routerDelegate: MyAppRouter().router.routerDelegate,
    );
  }
}

