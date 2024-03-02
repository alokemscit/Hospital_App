import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/custom_widget/custom_accordian/accordian_header.dart';
import 'package:asgar_ali_hospital/custom_widget/custom_dropdown.dart';
import 'package:asgar_ali_hospital/pages/lab_report_page/controller/lab_report_page_controller.dart';
import 'package:get/get.dart';

class LabReportPage extends StatelessWidget {
  const LabReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    LabReportPageController controller = Get.put(LabReportPageController());
    controller.context = context;
    return Column(
      children: [

       CustomAccordionContainer(headerName: "Patient Details",
       height: 80,
       isExpansion: false,
        children: [
      Row(
        children: [
          Expanded(child: CustomDropDown(
            labeltext: "HCN",
            id: null, list: [], onTap: (v){})),
        ],
       ),
       Row(children: [
        Text("Name: ",style: customTextStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w500),),
        8.widthBox,
        Text("Aloke",style: customTextStyle.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: appColorLogoDeep),)
       ],)
       ]), 

       

      ],
    );
  }
}
