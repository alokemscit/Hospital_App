// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, unused_element, unused_element

import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/data/data_static_user.dart';
import 'package:asgar_ali_hospital/pages/login_page/login_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/connection_error_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/connection_controller.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/main_home_page_controller.dart';
import 'package:flutter/cupertino.dart';
 
import 'package:get/get.dart';

class MainHomePagae extends StatelessWidget {
  const MainHomePagae({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomePagaeController controller = Get.put(MainHomePagaeController());
    controller.context = context;

    final ConnectivityService connectivityService =
        Get.find<ConnectivityService>();

    return Obx(() {
      if (!connectivityService.isConnected) {
        //print("fired");
        return const ConnectionErrorPage();
      } else {
        return Scaffold(
          backgroundColor: appGray100,
         // backgroundColor: Colors.white,
          // backgroundColor:appColorPista.withOpacity(0.5),
          body: controller.isLoading.value?const Center(child: CupertinoActivityIndicator()):  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Obx(() {
                return Column(
                  children: [
                    32.heightBox,
                    _logo_and_user_part(controller),
                    18.heightBox,
                    Expanded(
                      child: controller.pageList[controller.currentIndex.value],
                    ),
                  ],
                );
              })),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedFontSize: 11,
                unselectedFontSize: 10,
                unselectedLabelStyle:customTextStyle.copyWith(fontSize: 10,color: Colors.black),
                selectedLabelStyle: customTextStyle.copyWith(color: Colors.black,fontSize: 12),
                type: BottomNavigationBarType.fixed,
                iconSize: 20.0,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline),
                    label: 'Doctor',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.liquor_outlined),
                    label: 'Lab Report',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books_sharp),
                    label: 'Prescription',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box),
                    label: 'Account',
                  ),
                ],
                currentIndex: controller.currentIndex.value,
                selectedItemColor: appColorLogoDeep,
                onTap: (v) {
                  if (v == 2 || v == 3) {
                    if (DataStaticUser.hcn == '') {
                      CustomCupertinoAlertWithYesNo(
                          context,
                          const Text("Alert"),
                          const Text(
                              "You have to login first\n Do you want to log in?"),
                          () {}, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      });
                      return;
                    }
                  }
                  controller.currentIndex.value = v;
                },
              )),
        );
      }
    });
  }
}

_logo_and_user_part(MainHomePagaeController controller) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
            height: 40,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              hoverColor: appColorLogo,
              highlightColor: appColorPista,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                controller.logoClick();
                // print("object");
              },
              child: Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 30,
                  height: 30,
                  // padding: const EdgeInsets.symmetric(horizontal:4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      color: appColorGray200),
                  child: Opacity(
                    opacity: 0.9,
                    child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(50),
                        child: DataStaticUser.img ?? const Icon(Icons.people)),
                  )),
            ),
            Text(
              DataStaticUser.name == '' ? "Geust   " : DataStaticUser.name,
              style: customTextStyleDefault.copyWith(
                  fontSize: 7.5, fontWeight: FontWeight.w600 ),
            )
            //"Aloke Sikder".text.sm.fontFamily(appFontMuli).make()
          ],
        )
      ],
    );



