import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/theme/theme_config.dart';
import 'package:spotify/utils/providers.dart';
import 'package:spotify/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeConfig.darkTheme,
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
