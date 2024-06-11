// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/data/data_api.dart';
import 'package:asgar_ali_hospital/data/data_static_user.dart';
import 'package:asgar_ali_hospital/pages/login_page/auth_provider/auth-provider.dart';
import 'package:asgar_ali_hospital/pages/login_page/login_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/main_home_page_controller.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/model/model_doctor_master.dart';

import 'package:get/get.dart';

import '../../../common_model/model_common.dart';
import '../../../common_model/model_doctor_master.dart';
import '../../../common_model/model_mysql_doctor.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;
  late data_api api;
  late BuildContext context;
  late Timer? _timer;
  final scrollController = ScrollController();

  var list_doctor_all = <ModelDoctorMobMaster>[].obs;
  var list_doctor_top = <ModelDoctorMobMaster>[].obs;
  var lis_banner = <ModelCommon>[].obs;

  var currentIndex = 0.obs;
  var list_doctor_mysql = <ModelMySqlDoctor>[].obs;

  void viewAll() {
    MainHomePagaeController c = Get.find<MainHomePagaeController>();
    c.currentIndex.value = 1;
  }

  var list_doctor_master = <ModelDoctorMaster>[].obs;

  void startAutoScroll() {
 try{
    _timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (scrollController.hasClients) {

        double maxScroll = scrollController.position.maxScrollExtent;
        double currentScroll = scrollController.position.pixels;
        double nextScroll =
            currentScroll + 100.0; // Change this value to control scroll speed

        if (nextScroll >= maxScroll) {
          scrollController.jumpTo(0.0); // Scroll to top
        } else {
          scrollController.animateTo(nextScroll,
              duration: const Duration(seconds: 1), curve: Curves.easeInSine);
        }
      }
    });
 }catch(e){}
  }

//  var imgList = <String>[].obs;

  //  [
  //   "assets/images/slide1.webp",
  //   "assets/images/slide2.webp",
  //   "assets/images/slide3.webp",
  // ];

  @override
  void onInit() async {
    isLoading.value = true;
    api = data_api();
    try {
      var x = [];
      // if (lis_banner.isEmpty) {
      x = await api.createLead([
        {"tag": "117"}
      ]);
      // print(x);
      lis_banner.addAll(x.map((e) => ModelCommon.fromJson(e)));
      // }
      //if (list_doctor_top.isEmpty) {
      x = await api.createLead([
        {"tag": "120", "is_top": "1"}
      ]);
      list_doctor_top.addAll(x.map((e) => ModelDoctorMobMaster.fromJson(e)));
      //  }
      //  if (list_doctor_all.isEmpty) {
      isLoading.value = false;
      // x = await api.createLead([
      //   {"tag": "113", "is_top": "0"}
      // ]);
      // list_doctor_all.addAll(x.map((e) => ModelDoctorMobMaster.fromJson(e)));

      // x = await api.createLead([
      //   {"tag": "63"}
      // ]);

      // list_doctor_master.addAll(x.map((e) => ModelDoctorMaster.fromJson(e)));
      // isLoading.value = false;
      // print('doctor call from oracle');
      // if (DataStaticUser.doc_list == []) {
      //   var y = await api.get_mysql_doctor();
      //   DataStaticUser.doc_list =
      //       y.map((e) => ModelMySqlDoctor.fromJson(e)).toList();
      // }
      startAutoScroll();
      //print(y);
      // print(x);
    } catch (e) {
      isLoading.value = false;
    }
    super.onInit();
  }

@override
  void onClose() {
    _timer?.cancel();
    scrollController.dispose();
     super.onClose();
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
