import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_coach_app/router/routes.dart';
import 'package:sport_coach_app/screens/custom_profile_screen.dart';
import 'package:sport_coach_app/screens/custom_sign_in_screen.dart';
import 'package:sport_coach_app/screens/host_connection_screen.dart';
import 'package:sport_coach_app/screens/match_details_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/${Routes.hostConnection.name}',
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    if (!isLoggedIn) {
      return '/${Routes.signIn.name}';
    }
    return state.location;
  },
  routes: [
    GoRoute(
      path: '/${Routes.signIn.name}',
      name: Routes.signIn.name,
      builder: (context, state) => const CustomSignInScreen(),
    ),
    GoRoute(
      path: '/${Routes.hostConnection.name}',
      name: Routes.hostConnection.name,
      builder: (context, state) => const HostConnectionScreen(),
    ),
    GoRoute(
      path: '/${Routes.matchDetails.name}',
      name: Routes.matchDetails.name,
      builder: (context, state) => const MatchDetailsScreen(),
    ),
    GoRoute(
      path: '/${Routes.profile.name}',
      name: Routes.profile.name,
      builder: (context, state) => const CustomProfileScreen(),
    ),
  ],
);
