import 'package:asgar_ali_hospital/custom_widget/custom_widget_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:get/get.dart';

import '../../../common_model/model_doctor_master.dart';
import '../../../constant/const.dart';
import '../../../custom_widget/custom_cached_network_image.dart';

import '../controller/doctor_profile_controller.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key, required this.doctorMaster});
  final ModelDoctorMobMaster doctorMaster;
  @override
  Widget build(BuildContext context) {
    try {
      if (Get.isRegistered<DoctorProfileController>()) {
        Get.delete<DoctorProfileController>();
      }
    } catch (e) {}
    // DoctorPageController dcontroller = Get.find<DoctorPageController>();
    DoctorProfileController controller = Get.put(DoctorProfileController());
    controller.context = context;
    bool isDropdownReady = false;
    controller.doctorMaster = doctorMaster;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isDropdownReady) {
        // controller.selectedHCN.value = DataStaticUser.hcn;
        isDropdownReady = true;
        controller.html.value = '';
        Future.delayed(
            const Duration(
              microseconds: 300,
            ),
            () => controller.load());
      }
    });
    //

    return Scaffold(
      //backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  30.heightBox,
                  Align(
                      alignment: Alignment.topLeft,
                      child: customBackButton(context, () {
                        //    print('object');
                        controller.html.value = '';
                        Get.delete<DoctorProfileController>();
                      })),
                  8.heightBox,
                  // 4.heightBox,
                  _doctorDatails(controller, doctorMaster),
                  // 4.heightBox,

                  Expanded(
                    child: controller.html.value == ''
                        ? const Center(child: CupertinoActivityIndicator())
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: const [
                                  BoxShadow(
                                      color: appColorGray200,
                                      blurRadius: 1,
                                      spreadRadius: 3)
                                ]),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HtmlWidget(controller.html.value),
                              ),
                            ),
                          ),
                  ),

                  12.heightBox,
                  //  Container(height: 50,color: appColorBlue,width: 100,)
                ],
              ))),
    );
  }
}

BoxDecoration _decoraton = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          blurRadius: 2,
          spreadRadius: 1,
          color: appColorGrayDark.withOpacity(0.2)),
    ]);
Widget _doctorDatails(
  DoctorProfileController controller,
  ModelDoctorMobMaster dcontroller,
) =>
    Column(
      children: [
        Container(
            height: 100,
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            // height: 150,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: _decoraton,
            child: Row(children: [
              Hero(
                tag: dcontroller.docId!,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  child: CustomCachedNetworkImageSquareShape(
                    img:
                        'http://web.asgaralihospital.com/pub/doc_image/${dcontroller.imagePath!}',
                    height: 80,
                    width: 65,
                    errorIconSize: 50,
                  ),
                ),
              ),
              4.widthBox,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dcontroller.docName!,
                        overflow: TextOverflow.ellipsis,
                        style: customTextStyle.copyWith(
                            fontSize: 16,
                            color: appColorLogoDeep,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    _degree(dcontroller.desig, Colors.black87, 13),
                    _degree(dcontroller.special, appColorGrayDark, 12),
                    _degree(dcontroller.deptName, appColorGrayDark),
                    // _degree(dcontroller.doctorMaster.dEGREE3, appColorGrayDark),
                    const Spacer(),
                    4.heightBox,
                  ],
                  // color: Colors.grey,
                ),
              )
            ])),
      ],
    );

// Widget _backButton(BuildContext context, [Function? onTap]) => Row(
//       children: [
//         InkWell(
//             focusColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
//               if (onTap != null) {
//                 onTap();
//               }
//               Navigator.pop(context);

//               // Get.delete<OnlinePaymentController>();
//             },
//             child: Container(
//               color: Colors.transparent,
//               padding: const EdgeInsets.only(right: 50, top: 8, bottom: 4),
//               // ignore: prefer_const_constructors
//               child: Icon(Icons.arrow_back_ios_new),
//             )),
//       ],
//     );

_degree(String? degree, Color fontColor, [double fontSize = 11.5]) =>
    degree == null
        ? const SizedBox()
        : Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                degree,
                overflow: TextOverflow.ellipsis,
                style: customTextStyle.copyWith(
                    fontSize: fontSize,
                    color: fontColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
