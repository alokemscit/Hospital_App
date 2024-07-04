import 'dart:convert';

import 'package:get/get.dart';

import '../../../common_model/model_doctor_master.dart';
import '../../../constant/const.dart';
import '../../../custom_widget/custom_awesome_dialog.dart';
import '../../../custom_widget/custom_bysy_loader.dart';
import '../../../data/data_api.dart';
import '../../../constant/library.dart';


class DoctorProfileController extends GetxController {
  late BuildContext context;
  late data_api api;
  late CustomAwesomeDialog dialog;
  late CustomBusyLoader loader;
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;
  late ModelDoctorMobMaster doctorMaster;
  var html = ''.obs;

//   DoctorProfileController({required this.doctorMaster}){
//  var x1 = jsonDecode(doctorMaster.des!);
//     var x = Delta.fromJson(x1);
//     html.value = x.toHtml();
//   }

  void load() {
    isLoading.value = true;
    var x1 = jsonDecode(doctorMaster.des!);

    var x = Delta.fromJson(x1);
    html.value = x.toHtml();
    isLoading.value = false;
    // print(x.toHtml());
  }

  @override
  void onInit() {
    // List delta = [
    //   {
    //     "insert": "Welcome",
    //     "attributes": {"bold": true, "italic": true, "underline": true}
    //   },
    //   {
    //     "insert": " ",
    //     "attributes": {"italic": true, "underline": true}
    //   },
    //   {
    //     "insert": "to delta to html package",
    //     "attributes": {"bold": true, "italic": true, "underline": true}
    //   },
    //   {"insert": "\n"}
    // ];

    // //final html =  QuillHtmlConverter.convert(delta);
    // // print(html);
    // // ignore: avoid_print
    // //print(Document.fromJson(delta));

    // var x = Delta.fromJson(delta);
    // print(x.toHtml());

    super.onInit();
  }
}
