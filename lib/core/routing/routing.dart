import 'package:go_router/go_router.dart';
import 'package:market_mate/app/modules/history/history_page.dart';
import 'package:market_mate/core/di/dependency_injection.dart';
import 'package:market_mate/core/services/hive_service.dart';

import '../../app/modules/home/home_page.dart';
import '../../app/modules/welcome/welcome_page.dart';

enum AppRoutes { signIn, home, welcome }

final GoRouter routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  restorationScopeId: 'router',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.welcome.name,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/home/:userName',
      name: AppRoutes.home.name,
      builder: (context, state) {
        return HomePage(
          userName: state.params['userName'],
        );
      },
    ),
    GoRoute(
      path: '/signin',
      name: AppRoutes.signIn.name,
      builder: (context, state) => const HistoryPage(),
    ),
  ],
  redirect: (context, state) async {
    // if the user is not logged in, they need to login
    await getIt.isReady<HiveService>();
    final hiveService = getIt.get<HiveService>();

    final String? hasUser = await hiveService.get('userName');

    final bool loggedIn = (hasUser != null && hasUser != '');
    final bool loggingIn = state.subloc == '/';
    if (!loggedIn) {
      return '/';
    }

    // if the user is logged in but still on the login page, send them to
    // the home page
    if (loggingIn) {
      return '/home';
    }

    // no need to redirect at all
    return null;
  },
);
