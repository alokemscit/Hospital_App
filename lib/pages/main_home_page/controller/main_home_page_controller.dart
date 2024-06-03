import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/data/data_api.dart';
import 'package:asgar_ali_hospital/data/data_static_user.dart';
import 'package:asgar_ali_hospital/pages/doctor_page/doctor_page.dart';
import 'package:asgar_ali_hospital/pages/home_page/home_page.dart';
import 'package:asgar_ali_hospital/pages/lab_report_page/lab_report_page.dart';
import 'package:asgar_ali_hospital/pages/login_page/auth_provider/auth-provider.dart';
import 'package:asgar_ali_hospital/pages/login_page/login_page.dart';
import 'package:asgar_ali_hospital/pages/prescription_page/prescription_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class MainHomePagaeController extends GetxController {
  var isLoading = false.obs;
  late data_api api;
  late BuildContext context;
  var currentIndex = 0.obs;
  List<Widget> pageList = [
    const HomePage(),
    const DoctorPage(),
    const LabReportPage(),
    const PrescriptionPage(),
    Container(
      color: Colors.black,
    ),
  ];

  @override
  void onInit() async {
    isLoading.value = true;
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    isLoading.value = false;
    super.onInit();
  }

  void doctorAll() {
    currentIndex.value = 1;
  }

  void logoClick() {
    if (DataStaticUser.hcn == '') {
      Get.to(() => const LoginPage());
    } else {
      CustomCupertinoAlertWithYesNo(context, const Text("Alert"),
          const Text("Are you sure to Log Out?"), () {}, () {
        AuthProvider().logout();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      });
    }
  }
}
