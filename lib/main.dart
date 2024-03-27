import 'package:drivelink_admin/locator.dart';
import 'package:drivelink_admin/provider/app_provider.dart';
import 'package:drivelink_admin/provider/auth_provider.dart';
import 'package:drivelink_admin/provider/tables.dart';
import 'package:drivelink_admin/routing/route_names.dart';
import 'package:drivelink_admin/routing/router.dart';
import 'package:drivelink_admin/views/auth/login.dart';
import 'package:drivelink_admin/views/home/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAzxKNeAUddgC83VLSzclLJOVP3Di0edO4",
            appId: "1:572226846941:web:64f2af745d37239013db34",
            messagingSenderId: "572226846941",
            projectId: "drivelinkapp-f32cd",
            storageBucket: "drivelinkapp-f32cd.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppProvider.init()),
      ChangeNotifierProvider.value(value: AuthProvider.initialize()),
      ChangeNotifierProvider.value(value: TablesProvider.init()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: pageControllerRoute,
      home: LoginScreen(),
    );
  }
}

class AppPagesController extends StatelessWidget {
  const AppPagesController({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Something went wrong")],
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print(authProvider.status.toString());
          switch (authProvider.status) {
            case Status.Uninitialized:
              return const LoginScreen();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return const LoginScreen();
            case Status.Authenticated:
              return const DashboardScreen();
            default:
              return const LoginScreen();
          }
        }

        return const Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
