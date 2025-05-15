import "./widgets.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//Main App
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Roboto',
      ),
    );
  }
}
//---------------------------------------------

//Routes
final GoRouter _router = GoRouter(routes: <RouteBase>[
  ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: const CustomAppBar(
            title: 'Beu Assignments',
            showBackButton: false,
          ),
          body: child,
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/a1',
          builder: (BuildContext context, GoRouterState state) {
            return const AnswerForQ1();
          },
        ),
        GoRoute(
          path: '/a2',
          builder: (BuildContext context, GoRouterState state) {
            return const AnswerForQ2();
          },
        ),
        GoRoute(
          path: '/a3',
          builder: (BuildContext context, GoRouterState state) {
            return const AnswerForQ3();
          },
        ),
        GoRoute(
          path: '/a4',
          builder: (BuildContext context, GoRouterState state) {
            return const AnswerForQ4();
          },
        ),
        GoRoute(
            path: '/a5',
            builder: (BuildContext context, GoRouterState state) {
              return const AnswerForQ5();
            },
            routes: [
              GoRoute(
                path: '/the-home-page',
                builder: (BuildContext context, GoRouterState state) {
                  return const TheHomePage();
                },
              ),
              GoRoute(
                path: '/about-page',
                builder: (BuildContext context, GoRouterState state) {
                  return const AboutPage();
                },
              ),
              GoRoute(
                path: '/settings-page',
                builder: (BuildContext context, GoRouterState state) {
                  return const SettingsPage();
                },
              ),
            ]),
        GoRoute(
          path: '/a6',
          builder: (BuildContext context, GoRouterState state) {
            return const AnswerForQ6();
          },
        ),
        GoRoute(
          path: '/a7',
          builder: (BuildContext context, GoRouterState state) {
            return const AnswerForQ7();
          },
        ),
      ])
]);
//---------------------------------------------