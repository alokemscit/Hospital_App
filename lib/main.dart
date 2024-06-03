import 'package:asgar_ali_hospital/constant/const.dart';

import 'package:asgar_ali_hospital/pages/login_page/auth_provider/auth-provider.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/connection_error_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/connection_controller.dart';

import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:provider/provider.dart';

import 'pages/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set status bar to transparent
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,

    //systemNavigationBarColor: Colors.transparent,
  ));

  final userProvider = AuthProvider();
  await userProvider.loadUser();

  runApp(MyApp(
    userProvider: userProvider,
  ));
}

class MyApp extends StatelessWidget {
  final AuthProvider userProvider;
  MyApp({super.key, required this.userProvider});
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => userProvider,
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, AuthProvider authNotifier, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: appName,
              theme: ThemeData(
                appBarTheme:
                    const AppBarTheme(backgroundColor: Colors.transparent),
                scaffoldBackgroundColor: appGray100,
                brightness: Brightness.light,
                //brightness:Brightness.dark,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                useMaterial3: true,
              ),
              home: Obx(() {
                if (!connectivityService.isConnected) {
                  return const ConnectionErrorPage();
                } else {
                  return const SplashScreen();
                  // return userProvider.user == null
                  //     ? const DefaultPage()
                  //     : const MainHomePagae();
                }
              }));
        },
      ),
    );
  }
}
