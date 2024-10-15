import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realestate/features/home/presentation/ui/home_screen.dart';
import 'package:realestate/features/home/presentation/ui/home_shell.dart';
import 'package:realestate/features/search/presentation/ui/search_screen.dart';


class AppRoutes {
  static const home = '/home';
  static const chat = '/chat';
  static const search = '/search';
  static const favourite = '/favourite';
  static const profile = '/profile';
}

CustomTransitionPage buildPageWithTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  SharedAxisTransitionType transition = SharedAxisTransitionType.horizontal,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SharedAxisTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      transitionType: transition,
      child: child,
    ),
  );
}

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// the private shell for Home Bottom Navigation  [HomeShell] this handle stacked navigation triggered form
/// the Home Bottom Navigation bar
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeShell');

/// the private shell for Search Bottom Navigation  [SearchShell] this handle stacked navigation
/// triaged form the Search Bottom Navigation bar
final _shellNavigatorReportsKey =
    GlobalKey<NavigatorState>(debugLabel: 'searchShell');

/// the private shell for Profile Bottom Navigation  [ProfileShell] this handle stacked navigation
/// triaged form the profile Bottom Navigation bar
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'profileShell');

/// the private shell for Chat Bottom Navigation [ChatShell] this handle stacked navigation
/// triaged form the Chat Bottom Navigation bar
final _shellNavigatorChatKey =
    GlobalKey<NavigatorState>(debugLabel: 'chatShell');

/// the private shell for Favourite Bottom Navigation [FavouriteShell] this handle stacked navigation
/// triaged form the Favourite Bottom Navigation bar
final _shellNavigatorFavouriteKey =
    GlobalKey<NavigatorState>(debugLabel: 'favouriteShell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return ScaffoldWithNestedNavigation(navigationShell: child);
        },
        branches: [
          StatefulShellBranch(navigatorKey: _shellNavigatorReportsKey, routes: [
            GoRoute(
              name: AppRoutes.search,
              path: AppRoutes.search,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithTransition(
                    child: const SearchScreen(),
                    context: context,
                    state: state);
              },
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorChatKey, routes: [
            GoRoute(
              name: AppRoutes.chat,
              path: AppRoutes.chat,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return  NoTransitionPage(child: Container());
              },
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: [
            GoRoute(
              name: AppRoutes.home,
              path: AppRoutes.home,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return buildPageWithTransition(
                    child: const HomeScreen(), context: context, state: state);
              },
            )
          ]),
          StatefulShellBranch(
              navigatorKey: _shellNavigatorFavouriteKey,
              routes: [
                GoRoute(
                  name: AppRoutes.favourite,
                  path: AppRoutes.favourite,
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    return NoTransitionPage(child: Container());
                  },
                ),
              ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorProfileKey, routes: [
            GoRoute(
              name: AppRoutes.profile,
              path: AppRoutes.profile,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(child: Container());
              },
            ),
          ]),
        ]),
  ],
);

//  return NoBarScaffold(child: child);
