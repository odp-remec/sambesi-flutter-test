import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sambesi_flutter/application/sambesi_bloc.dart';
import 'package:sambesi_flutter/injection.dart';
import 'package:sambesi_flutter/presentation/overview_page.dart';
import 'package:sambesi_flutter/theme.dart';

import 'injection.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sambesi Flutter',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: BlocProvider(
        create: (BuildContext context) => serviceLocator<SambesiBloc>(),
        child: const OverviewPage(),
      ),
    );
  }
}
