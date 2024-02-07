import 'package:feature_auth_data/bootstrap.dart' as auth_data;
import 'package:feature_profile_data/bootstrap.dart' as profile_data;
import 'package:feature_project_management_data/bootstrap.dart'
    as feature_project_management_data;
import 'package:feature_user_management_data/bootstrap.dart'
    as feature_user_management_data;
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:middelkamp_dev_app/src/routing/go_router_router_navigator.dart';
import 'package:middelkamp_dev_app/src/routing/routes.dart';
import 'package:shared_data/bootstrap.dart' as shared_data;
import 'package:shared_domain/bootstrap.dart' as shared_domain;
import 'package:shared_domain/models.dart';
import 'package:shared_domain/routing.dart';

Future<void> mainDelegate({
  required Environment environment,
  required String authMicroServiceBaseUrl,
  required String userMicroServiceBaseUrl,
  required String projectMicroServiceBaseUrl,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await shared_domain.setupDependencyInjection();

  await shared_data.bootstrap(
    authMicroServiceBaseUrl: authMicroServiceBaseUrl,
    userMicroServiceBaseUrl: userMicroServiceBaseUrl,
    projectMicroServiceBaseUrl: projectMicroServiceBaseUrl,
  );

  await auth_data.bootstrap(
    authApiBaseUrl: authMicroServiceBaseUrl,
  );
  await Future.wait([
    profile_data.bootstrap(),
    feature_project_management_data.bootstrap(),
    feature_user_management_data.bootstrap(),
  ]);

  await shared_domain.bootstrap();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    _router = GoRouter(
      routes: routes,
      initialLocation: routes.first.path,
    );
    DomainRouter.instance = GoRouterRouterNavigator(
      router: _router,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<ActionBloc>.value(value: Di.instance.get()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
