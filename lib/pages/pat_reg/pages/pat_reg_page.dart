import 'package:asgar_ali_hospital/custom_widget/custom_textbox.dart';
import 'package:asgar_ali_hospital/custom_widget/custom_widget_list.dart';
import 'package:get/get.dart';

import '../../../constant/const.dart';
import '../controller/pat_reg_controller.dart';

class PatientReg extends StatelessWidget {
  const PatientReg({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientRegController controller = Get.put(PatientRegController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
             customBackButton(context),
               12.heightBox,
               Expanded(
                 child: SingleChildScrollView(
                   child: CustomGroupBox(
                    bgColor:Colors.white,
                    borderRadius: 8,
                    groupHeaderText: "Patient Registration", child: Padding(
                     padding: const EdgeInsets.all(12),
                     child: Column(
                      children: [
                        8.heightBox,
                         Row(
                        children: [
                          Expanded(child: CustomTextBox(caption: "Patient's Name", controller: TextEditingController(), onChange: (v){})),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(child: CustomTextBox(caption: "Father's Name", controller: TextEditingController(), onChange: (v){})),
                        ],
                      ),
                       10.heightBox,
                      Row(
                        children: [
                          Expanded(child: CustomTextBox(caption: "Mother's Name", controller: TextEditingController(), onChange: (v){})),
                        ],
                      ),
                     
                      ],
                     ),
                   )),
                 ),
               )
            ]))
    );
  }
}

 