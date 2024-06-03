import 'package:lottie/lottie.dart';

import '../../constant/const.dart';
import '../main_home_page/main_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _isLarge = false;
  @override
  void initState() {
    super.initState();
    _setText();
    _navigateToHome();
    
  }

  _setText() async {
    await Future.delayed(const Duration(seconds: 1), () {setState(() {
      _isLarge = true;
    });});
    
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4), () {});
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const MainHomePagae()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Opacity(
            opacity: 0.8,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
              height: 50,
            ),
            ),
          ),
          1.heightBox,
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 2),
            style: _isLarge
                ? const TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)
                : const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
             child: const Text('Asgar Ali Hospital'),
          ),
          12.heightBox,
          Center(
            child: Lottie.asset('assets/lotti/lotti.json',
                width: 250, height: 250, fit: BoxFit.fill, repeat: false),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
