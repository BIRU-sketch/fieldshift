import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/home/presentation/home_page.dart';

class FieldShiftApp extends StatelessWidget {
  const FieldShiftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FieldShift',
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}

