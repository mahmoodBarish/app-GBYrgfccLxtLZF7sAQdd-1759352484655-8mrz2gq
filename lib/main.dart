import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/high_fidelity_order_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/high_fidelity_order',
  routes: [
    GoRoute(
      path: '/high_fidelity_order',
      builder: (BuildContext context, GoRouterState state) {
        return const HighFidelityOrderScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}
