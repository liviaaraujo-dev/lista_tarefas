import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_de_tarefas/pages/splash/splash_page.dart';
import 'package:lista_de_tarefas/shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.selectTheme(),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
