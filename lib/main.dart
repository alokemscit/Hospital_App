import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/constant/service/check_update.dart';

import 'package:asgar_ali_hospital/pages/login_page/auth_provider/auth-provider.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/connection_error_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/connection_controller.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/main_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
 
import 'package:provider/provider.dart';
import 'pages/default_page/default_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  // var x = await checkForUpdate();
  // print(x);
  // if (x!.updateAvailability == UpdateAvailability.updateAvailable) {
  //   print('Update available');
  // }

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
// SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
// SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//   statusBarBrightness: Brightness.light,
//   statusBarIconBrightness: Brightness.dark,
//   statusBarColor: Colors.transparent,
//   systemNavigationBarColor: Colors.transparent,
// ));

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarColor: Colors.black,
    //     statusBarBrightness: Brightness.light));

    //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

// final Brightness brightness = Theme.of(context).brightness;
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

//       statusBarColor: brightness == Brightness.dark ? Colors.black : Colors.blue,
//       statusBarIconBrightness: brightness == Brightness.dark ? Brightness.light : Brightness.dark,
//       statusBarBrightness: brightness == Brightness.dark ? Brightness.dark : Brightness.light,
//     ));

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
                // print("Listiner1111");
                // String? token = await messaging.getToken();
                // print(token);

// FirebaseMessaging.instance.onTokenRefresh
//     .listen((fcmToken) {
//       // TODO: If necessary send token to application server.
// print(fcmToken);
//       // Note: This callback is fired at each app startup and whenever a new
//       // token is generated.
//     })
//     .onError((err) {
//       // Error getting token.
//     });

                if (!connectivityService.isConnected) {
                  return const ConnectionErrorPage();
                } else {
                  return userProvider.user == null
                      ? const DefaultPage()
                      : const MainHomePagae();
                }
              }));
        },
      ),
    );
  }
}
