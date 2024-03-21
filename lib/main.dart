import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:amazon_clone/common/widget/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
// import 'package:amazon_clone/features/home/screens/home.dart';
import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<UserProvider>(context).user.token);
    return MaterialApp(
        title: 'Amazon Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "user"
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen()
        // Builder(builder: (context) {
        //   return FutureBuilder(
        //       future: authService.getUserData(context),
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.done) {
        //           return Provider.of<UserProvider>(context)
        //                   .user
        //                   .token
        //                   .isNotEmpty
        //               ? const HomeScreen()
        //               : const AuthScreen();
        //         }
        //         return const Center(child: CircularProgressIndicator());
        //       });
        // },),
        );
  }
}
