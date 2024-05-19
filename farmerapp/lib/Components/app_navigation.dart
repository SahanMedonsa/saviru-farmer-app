import 'package:farmerapp/Components/NavigationBar.dart';
import 'package:farmerapp/Pages/Home.dart';
import 'package:farmerapp/Pages/Profile.dart';
import 'package:farmerapp/Pages/VegeState.dart';
import 'package:farmerapp/Pages/infomation.dart';
import 'package:farmerapp/Signup/Login/login.dart';
import 'package:farmerapp/fertilizer/Alertdialogbox.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initRoute = '/home';

  // Private navigation key
  static final GlobalKey<NavigatorState> _rootNavigationKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _rootNavigationHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');

  static final GlobalKey<NavigatorState> _rootNavigationVegestat =
      GlobalKey<NavigatorState>(debugLabel: 'shellvege');

  static final GlobalKey<NavigatorState> _rootNavigationBlog =
      GlobalKey<NavigatorState>(debugLabel: 'shellinfor');

  static final GlobalKey<NavigatorState> _rootNavigationlogin =
      GlobalKey<NavigatorState>(debugLabel: 'shelllogin');

  // Define the routes for GoRouter
  static final GoRouter router = GoRouter(
    initialLocation: initRoute,
    navigatorKey: _rootNavigationKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      //Main navbar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CustomBottomNavigationBar(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          //Home
          StatefulShellBranch(navigatorKey: _rootNavigationHome, routes: [
            GoRoute(
              path: '/home',
              name: 'Home',
              builder: (context, state) {
                return HomeScreen(
                  key: state.pageKey,
                );
              },
            )
          ]),

          //vege stat
          StatefulShellBranch(navigatorKey: _rootNavigationVegestat, routes: [
            GoRoute(
              path: '/vegestatus',
              name: 'Vegestatus',
              builder: (context, state) {
                return VegeStatScreen(
                  key: state.pageKey,
                  data: {},
                );
              },
            )
          ]),

          //blog
          StatefulShellBranch(navigatorKey: _rootNavigationBlog, routes: [
            GoRoute(
                path: '/info',
                name: 'Info',
                builder: (context, state) {
                  return infomationpage(
                    key: state.pageKey,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'vegedetails',
                    name: 'vegedetails',
                    builder: (context, state) {
                      return vegedetail(
                        key: state.pageKey,
                      );
                    },
                  )
                ]),
          ]),

          //Login
          StatefulShellBranch(navigatorKey: _rootNavigationlogin, routes: [
            GoRoute(
                path: '/login',
                name: 'Login',
                builder: (context, state) {
                  return LoginPage(
                    key: state.pageKey,
                  );
                },
                //profileview
                routes: [
                  GoRoute(
                    path: 'Profile',
                    name: 'Profile',
                    builder: (context, state) {
                      return Profilescreen(
                        key: state.pageKey,
                      );
                    },
                  )
                ]),
          ])
        ],
      )
    ],
  );
}
