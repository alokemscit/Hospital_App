import 'package:get/get.dart';

import '../common_model/model_common.dart';
import '../common_model/model_doctor_master.dart';
import '../constant/const.dart';
import '../data/data_api.dart';

class CommonController extends GetxController {
  late BuildContext context;
  late data_api api;
  var list_doctor_all = <ModelDoctorMobMaster>[].obs;
  var list_doctor_top = <ModelDoctorMobMaster>[].obs;
  var lis_banner = <ModelCommon>[].obs;

  @override
  void onInit() async {
    api = data_api();
    list_doctor_all.clear();
    list_doctor_top.clear();
    lis_banner.clear();
    try {
     // CommonController controller = Get.find<CommonController>();

      var x = [];
      if (lis_banner.isEmpty) {
        x = await api.createLead([
          {"tag": "ii7"}
        ]);
        lis_banner.addAll(x.map((e) => ModelCommon.fromJson(e)));
      }
      if (list_doctor_top.isEmpty) {
        x = await api.createLead([
          {"tag": "120", "is_top": "1"}
        ]);
        list_doctor_top.addAll(x.map((e) => ModelDoctorMobMaster.fromJson(e)));
      } 
      if (list_doctor_all.isEmpty) {
        x = await api.createLead([
          {"tag": "120", "is_top": "0"}
        ]);
        list_doctor_all.addAll(x.map((e) => ModelDoctorMobMaster.fromJson(e)));
      } 
      //print(x);
    } catch (e) {}
    super.onInit();
  }
}
