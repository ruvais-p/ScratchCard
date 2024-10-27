import 'package:flutter/material.dart';
import 'package:haleo/core/theme/theme.dart';
import 'package:haleo/Scratch_card/scratch_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: AppTheme.lightThemeMode,
//       debugShowCheckedModeBanner: false,
//       home: ScratchCardScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScratchCardProvider(), // Provide the ScratchCardProvider
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightThemeMode,
        debugShowCheckedModeBanner: false,
        home: ScratchCardScreen(),
      ),
    );
  }
}