// ignore_for_file: non_constant_identifier_names

import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/data/data_api.dart';
 

import 'package:asgar_ali_hospital/pages/doctor_page/doctor_page_controller/model/model_doctor_unit.dart';
 
import 'package:asgar_ali_hospital/pages/main_home_page/model/model_doctor_master.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import '../../../common_model/model_doctor_master.dart';

class DoctorPageController extends GetxController {
  late BuildContext context;
  late data_api api;
  var list_docunit = <ModelDoctorUnit>[].obs;
  var isLoading = false.obs;
  var selectedUnit = '0'.obs;
  // var list_doctor_master = <ModelDoctorMaster>[].obs;
  // var list_doctor_master_temp = <ModelDoctorMaster>[].obs;

  final TextEditingController txt_search = TextEditingController();
  late ModelDoctorMobMaster doctorMaster;

  //var doctor_list = <ModelDoctorMobMaster>[].obs;

  var list_doctor_all = <ModelDoctorMobMaster>[].obs;
  var list_doctor_temp = <ModelDoctorMobMaster>[].obs;
  var list_unit = <_unit>[].obs;
 

  void search() {
    selectedUnit.value = '';
   
    list_doctor_temp.clear();
    list_doctor_temp.addAll(list_doctor_all.where((p0) =>
        p0.deptName!.toUpperCase().contains(txt_search.text.toUpperCase()) ||
        p0.docName!.toUpperCase().contains(txt_search.text.toUpperCase())));
  }

  void unitClick() {
    if (selectedUnit.value == '0') {
      list_doctor_temp.clear();
      list_doctor_temp.addAll(list_doctor_all);
      return;
    }
    
    list_doctor_temp.clear();
    list_doctor_temp.addAll(list_doctor_all.where((p0) => p0.deptId == selectedUnit.value));
  }

  @override
  void onInit() async {
    api = data_api();
    try {
      isLoading.value = true;
      var x = [];

      x = await api.createLead([
        {"tag": "121"}
      ]);
      // print(x);
      list_doctor_all.addAll(x.map((e) => ModelDoctorMobMaster.fromJson(e)));
      list_doctor_temp.addAll(list_doctor_all);
      list_unit.addAll(list_doctor_all
          .map((e) => _unit(id: e.deptId!, name: e.deptName!))
          .toSet()
          .toList());
       list_unit.insertT(0, _unit(id: "0", name: "All"));
     // list_unit_temp.addAllT(list_unit);
      // print(list_doctor_all.length);
      // print(list_unit.length);R

      // x = await api.createLead([
      //   {"tag": "57"}
      // ]);
      // list_docunit.addAll(x.map((e) => ModelDoctorUnit.fromJson(e)));
      // list_docunit.insert(0, ModelDoctorUnit(NITID: "0", NITTITLE: "All"));
      // x = await api.createLead([
      //   {"tag": "63"}
      // ]);
      // var img = await getDoctorImageList();
      // // print(x);
      // var t = x.map((e) => ModelDoctorMaster.fromJson(e)).toList();

      // t.forEach((item1) {
      //   var image = img.firstWhere((item2) => item2.id == item1.dOCID,
      //       orElse: () => DoctorImage(
      //           id: item1.dOCID,
      //           image:
      //               "https://web.asgaralihospital.com/assets/img/media-user.png"));
      //   item1.iMAGE = image.image!;
      //   list_doctor_master.add(item1);
      // });
      // list_doctor_master_temp.addAll(list_doctor_master);
      // x = await api.get_mysql_doctor();
      // list_doctor_list.addAll(x.map((e) => ModelDoctorList.fromJson(e)));
      // print(list_doctor_list.length);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
    super.onInit();
  }
}

class _unit extends Equatable {
  final String id;
  final String name;

  _unit({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
