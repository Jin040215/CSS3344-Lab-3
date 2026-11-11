import 'package:flutter/material.dart';
import 'viewmodels/cruise_viewmodel.dart';
import 'views/cruise_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final CruiseViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CruiseViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          title: 'Rajang River Cruise',
          debugShowCheckedModeBanner: false,
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.teal,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.teal,
            brightness: Brightness.dark,
          ),
          home: CruiseDetailScreen(viewModel: _viewModel),
        );
      },
    );
  }
}
