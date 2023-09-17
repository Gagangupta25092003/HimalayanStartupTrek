import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/pages/about.dart';
import 'package:hst/pages/contacts.dart';
import 'package:hst/pages/directory.dart';
import 'package:hst/pages/event_schedule.dart';
import 'package:hst/pages/home.dart';
import 'package:hst/pages/error.dart';
import 'package:hst/pages/investors.dart';
import 'package:hst/pages/splash.dart';
import 'package:hst/pages/sponsors.dart';
import 'package:hst/pages/sponsorsdetail.dart';

class MyAppRouter{


GoRouter router =  GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context,state) {
        return MaterialPage(child: Home());
      }
    ),
    GoRoute(
      path: '/contacts',
      name: 'Contacts',
      pageBuilder: (context,state) {
        return MaterialPage(child: Contacts());
      }
    ),
    GoRoute(
      path: '/about',
      name: 'About',
      pageBuilder: (context,state) {
        return MaterialPage(child: About());
      }
    ),
    GoRoute(
      path: '/directory',
      name: 'Directory',
      pageBuilder: (context,state) {
        return MaterialPage(child: Directory());
      }
    ),
    GoRoute(
      path: '/event_schedule',
      name: 'EventSchedule',
      pageBuilder: (context,state) {
        return MaterialPage(child: EventSchedule());
      }
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      pageBuilder: (context,state) {
        return MaterialPage(child: Splash());
      }
    ),
    GoRoute(
      path: '/error',
      name: 'error',
      pageBuilder: (context,state) {
        return MaterialPage(child: Error());
      }
    ),
    GoRoute(
      path: '/investor',
      name: 'investor',
      pageBuilder: (context,state) {
        return MaterialPage(child: Investor());
      }
    ),

    GoRoute(
      path: '/sponsorsdetail',
      name: 'Sponsorsdetail',
      pageBuilder: (context,state) {
        return MaterialPage(child: SponsorsDetail());
      }
    ),
    GoRoute(
      path: '/',
      name: 'Sponsors',
      pageBuilder: (context,state) {
        return MaterialPage(child: Sponsors());
      }
    )
  ],
  errorPageBuilder: (context,state) {
        return MaterialPage(child: Error());
      }
);
}