import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/data/data_api.dart';
import 'package:get/get.dart';

class LabReportPageController extends GetxController{
   late BuildContext context;
  late data_api api;
  var isLoading = false.obs;
}