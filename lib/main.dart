import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_provider_streambuilder/model/ad_manager.dart';
import 'package:firebase_provider_streambuilder/notifier/food_notifier.dart';
import 'package:firebase_provider_streambuilder/screens/feed.dart';
import 'package:firebase_provider_streambuilder/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifier/auth_notifier.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      Admob.initialize(AdManager.appId),
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => FoodNotifier(),
          ),
        ],
        child: MyApp(),
      ))
    };

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding with Curry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
      ),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? Feed() : Login();
        },
      ),
    );
  }
}
