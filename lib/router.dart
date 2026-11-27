import 'package:go_router/go_router.dart';
import 'package:nema/pages/create_account_page.dart';
import 'package:nema/pages/home_page.dart';
import 'package:nema/pages/sign_in_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/sign-in',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(path: '/sign-in', builder: (context, state) => SignInPage()),
    GoRoute(
      path: '/create-account',
      builder: (context, state) => CreateAccountPage(),
    ),
  ],
);
