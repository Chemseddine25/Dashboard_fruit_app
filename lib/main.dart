import 'package:bloc/bloc.dart';
import 'package:dechbord_fruit_app/core/errors/services/bloc_observer.dart';
import 'package:dechbord_fruit_app/core/errors/services/get_it.dart';
import 'package:dechbord_fruit_app/core/errors/services/supbase_storage.dart';
import 'package:dechbord_fruit_app/core/helper_functions/on_generate_routes.dart';
import 'package:dechbord_fruit_app/features/dashboard/presentation/views/dashboard.dart';
import 'package:flutter/material.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await StorageSupbaseService.initSupabase();

  setupGetit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
