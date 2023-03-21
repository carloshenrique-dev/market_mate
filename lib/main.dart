import 'package:flutter/material.dart';
import 'package:market_mate/core/di/dependency_injection.dart';

import 'core/routing/routing.dart';

void main() async {
  setUpProviders();

  runApp(const MarketMate());
}

class MarketMate extends StatelessWidget {
  const MarketMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
    );
  }
}
