import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_mate/core/di/dependency_injection.dart';
import 'package:market_mate/core/routing/routing.dart';
import 'package:market_mate/core/services/hive_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Digite aqui seu nome',
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: (_name != null && _name != '')
                    ? () async {
                        final hiveService = getIt<HiveService>();
                        final result = await Future.wait([
                          hiveService.save('userName', _name),
                          hiveService.get('userName'),
                        ]);
                        final userName = result[1] as String?;
                        if (userName != null) {
                          if (mounted) {
                            context.pushNamed(AppRoutes.home.name, params: {
                              'userName': userName,
                            });
                          }
                        }
                      }
                    : null,
                child: const Text('Prosseguir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
