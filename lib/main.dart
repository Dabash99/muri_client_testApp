import 'package:flutter/material.dart';
import 'package:muri_client/shared/network/remote/dio_helper.dart';
import 'package:muri_client/shared/styles/themes.dart';

import 'modules/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muri Client',
      theme: AppTheme.lightTheme,
      home: Splashscreen(),
    );
  }
}

