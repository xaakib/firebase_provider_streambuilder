import 'package:firebase_provider_streambuilder/screens/feed.dart';
import 'package:firebase_provider_streambuilder/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/auth_notifier.dart';
import 'notifier/provider_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ignore: missing_required_param
        ChangeNotifierProvider<AuthNotifier>(
          create: (context) => AuthNotifier(),
        ),
        // ignore: missing_required_param
        ChangeNotifierProvider<FoodNotifier>(
          create: (context) => FoodNotifier(),
        ),
        ChangeNotifierProvider<OrangeNotifier>(
          create: (context) => OrangeNotifier(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Consumer<AuthNotifier>(
      //   builder: (context, notifier, child) {
      //     return notifier.user != null ? Feed() : Login();
      //   },
      // ),

      home: Feed(),
    );
  }
}
