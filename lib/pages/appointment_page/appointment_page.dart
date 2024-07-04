import 'package:asgar_ali_hospital/constant/color.dart';
import 'package:asgar_ali_hospital/constant/const.dart';

import 'package:asgar_ali_hospital/custom_widget/custom_cached_network_image.dart';
import 'package:asgar_ali_hospital/custom_widget/custom_dropdown.dart';
import 'package:asgar_ali_hospital/custom_widget/custom_textbox.dart';
import 'package:asgar_ali_hospital/pages/appointment_page/controller/appointment_page_controller.dart';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../common_model/model_doctor_master.dart';
import '../../custom_widget/custom_widget_list.dart';

class DoctorAppointment extends StatelessWidget {
  const DoctorAppointment({super.key, required this.doctorMaster});
  final ModelDoctorMobMaster doctorMaster;
  @override
  Widget build(BuildContext context) {
    try {
     if (Get.isRegistered<DoctorAppointmentController>()) {
       Get.delete<DoctorAppointmentController>();
        }
    } catch (e) {}
    // DoctorPageController dcontroller = Get.find<DoctorPageController>();
    DoctorAppointmentController controller =
        Get.put(DoctorAppointmentController(docId: doctorMaster.docId!));
    controller.context = context;
    controller.doctorMaster = doctorMaster;

    return Scaffold(
      //backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              30.heightBox,
              Align(alignment: Alignment.topLeft, child: customBackButton(context,(){Get.delete<DoctorAppointmentController>();})),
              8.heightBox,
              // 4.heightBox,
              _doctorDatails(controller, doctorMaster),
              // 4.heightBox,
              Expanded(
                child: Obx(() {
                  return controller.isLoading.value
                      ? const Center(child: CupertinoActivityIndicator())
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomGroupBox(
                                  bgColor: Colors.white,
                                  textColor: appColorLogoDeep,
                                  textHeaderFontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  groupHeaderText:
                                      "Appointment Date: ${controller.chkDate.value}",
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _datePart(controller),
                                      12.heightBox,
                                      Text(
                                        "Time Slot",
                                        style: customTextStyle.copyWith(
                                            color: appColorLogoDeep,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Divider(
                                        height: 0.8,
                                        color:
                                            appColorGrayDark.withOpacity(0.2),
                                      ),
                                      8.heightBox,
                                      _timePart(controller),
                                      12.heightBox,
                                      Text(
                                        "Patient Details",
                                        style: customTextStyle.copyWith(
                                            color: appColorLogoDeep,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Divider(
                                        height: 0.8,
                                        color:
                                            appColorGrayDark.withOpacity(0.2),
                                      ),
                                      8.heightBox,
                                      _patientDetails(controller),
                                      12.heightBox,
                                    ],
                                  )),

                              //  Spacer()
                            ],
                          ),
                        );
                }),
              ),
            ],
          )),
    );
  }
}

Widget _patientDetails(DoctorAppointmentController controller) {
  bool b = false;
  return Stack(
    children: [
      Column(
          //isExpansion: false,
          // headerName: "Patient Details",
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Have a HCN?",
                  style: customTextStyle.copyWith(fontSize: 12),
                ),
                12.widthBox,
                SizedBox(
                  //  color: Colors.red,
                  height: 30, //set desired REAL HEIGHT
                  width: 55, //set desired REAL WIDTH
                  child: Transform.scale(
                    transformHitTests: false,
                    scale: .5,
                    child: CupertinoSwitch(
                      value: controller.isHCN.value,
                      onChanged: (value) {
                        controller.isHCN.value = value;
                        if (!value) {
                          controller.txt_hcn.text = '';
                        }
                      },
                      activeColor: appColorLogo,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                controller.isHCN.value
                    ? Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextBox(
                                  height: 34,
                                  isCapitalization: true,
                                  caption: "HCN",
                                  maxlength: 11,
                                  controller: controller.txt_hcn,
                                  onChange: (v) {
                                    controller.txt_mobile.text = '';
                                    controller.txt_name.text = '';
                                    controller.date_of_birth.value = '';
                                    controller.genderID.value = '';
                                    controller.bloodGroupID.value = '';
                                    if (v.length == 11) {
                                      controller.onHCnSubmitted();
                                    }
                                  },
                                  onSubmitted: (v) {
                                    // print("called");
                                  }),
                            ),
                            //2.widthBox,
                            !controller.isLogin.value
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      controller.loadRegHCN();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: const Border(
                                            top: BorderSide(
                                                color: appColorGrayDark,
                                                width: 0.3),
                                            right: BorderSide(
                                                color: appColorGrayDark,
                                                width: 0.3),
                                            bottom: BorderSide(
                                                color: appColorGrayDark,
                                                width: 0.3),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Colors.white,
                                          // boxShadow: const [
                                          //   BoxShadow(blurRadius: 0, spreadRadius: 0.05, color: Colors.black)
                                          // ]
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4.5,
                                        ),
                                        child:
                                            const Icon(Icons.arrow_drop_down)),
                                  )
                          ],
                        ),
                      )
                    : const SizedBox(),
                controller.isHCN.value ? 12.widthBox : const SizedBox(),
                Expanded(
                  flex: 5,
                  child: CustomTextBox(
                    textInputType: TextInputType.phone,
                    height: 34,
                    caption: "Mobile Number",
                    maxlength: 11,
                    controller: controller.txt_mobile,
                    onChange: (v) {},
                  ),
                ),
              ],
            ),
            8.heightBox,
            CustomTextBox(
                height: 34,
                caption: "Patient Name",
                width: double.infinity,
                maxlength: 100,
                controller: controller.txt_name,
                onChange: (v) {}),
            8.heightBox,
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Approx",
                      style: customTextStyle.copyWith(
                          fontSize: 11, color: appColorLogoDeep),
                    ),
                    Text(
                      "Age",
                      style: customTextStyle.copyWith(
                          fontSize: 11, color: appColorLogoDeep),
                    )
                  ],
                ),
                8.widthBox,
                CustomTextBox(
                    caption: "Age",
                    textAlign: TextAlign.center,
                    textInputType: TextInputType.number,
                    height: 34,
                    enabledBorderwidth :0.5,
                    width: 40,
                    maxLine: 1,
                    maxlength: 3,
                    controller: controller.txt_age,
                    onChange: (v) {}),
                //8.widthBox,
                CustomDropDown(
                    labeltext: "Year",
                    width: 100,
                    height: 34,
                    id: controller.selectedAgeType.value,
                    list: controller.list_age_type
                        .map((f) => DropdownMenuItem<String>(
                            value: f.id,
                            child: Text(
                              f.name!,
                              style: customTextStyle.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.w500),
                            )))
                        .toList(),
                    onTap: (v) {
                      controller.selectedAgeType.value = v!;
                    }),
                8.widthBox,

                Flexible(
                  child: CustomDropDown(
                      labeltext: "Gender",
                      height: 34,
                      width: 120,
                      id: controller.genderID.value,
                      list: controller.list_gender
                          .map((e) => DropdownMenuItem<String>(
                              value: e.iD, child: Text(e.nAME!)))
                          .toList(),
                      onTap: (v) {
                        controller.genderID.value = v!;
                      }),
                ),
              ],
            ),
            16.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

// ElevatedButton(onPressed: (){}, child: Text("Continue"),
// style: ElevatedButton.styleFrom(
//   backgroundColor:appColorBlue,
//   foregroundColor: appColorGrayDark,

// )
// ),

          controller.list_slot_selected.isEmpty?Text('Slot Not Available',style: customTextStyle.copyWith(color: Colors.red),):     
          
           InkWell(
                  onTap: () {
                    if (!b) {
                      b = true;
                      controller.saveAppointment();
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          b = false;
                        },
                      );
                    }
                  },
                  child: _continueButton(),
                ),
              ],
            ),
            8.heightBox,
          ]),
      !controller.isDropdownSelected.value
          ? const SizedBox()
          : Positioned(
              left: 0,
              right: 0,
              top: 2,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                color: Colors.white,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(4),
                //     color: Colors.white,
                //     boxShadow: const [
                //       BoxShadow(
                //           color: appColorGray200,
                //           spreadRadius: 1,
                //           blurRadius: 0.1)
                //     ]),
                height: 250,
                child: CustomGroupBox(
                    bgColor: Colors.white,
                    groupHeaderText: "Registered HCN List",
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Table(
                              columnWidths: CustomColumnWidthGenarator(_col),
                              children: controller.list_pat_with_hcn
                                  .map((f) => TableRow(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: appGray100,
                                                  blurRadius: 1,
                                                  spreadRadius: 5,
                                                )
                                              ]),
                                          children: [
                                            TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.setPatient(f);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 2,
                                                        vertical: 10),
                                                    child: Text(
                                                      f.hCN!,
                                                      style: customTextStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ),
                                                )),
                                            TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.setPatient(f);
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4,
                                                        vertical: 10),
                                                    child: Text(
                                                      f.pATNAME!,
                                                      style: customTextStyle
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ),
                                                )),
                                            TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.setPatient(f);
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4,
                                                            vertical: 10),
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      size: 18,
                                                      color: appColorGrayDark,
                                                    ),
                                                  ),
                                                ))
                                          ]))
                                  .toList()),
                        ))
                      ],
                    )),
                // width: 300,
              ),
            ),
      !controller.isDropdownSelected.value
          ? const SizedBox()
          : Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  controller.isDropdownSelected.value = false;
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: appColorGrayLight,
                  ),
                ),
              ))
    ],
  );
}

List<int> _col = [50, 100, 20];

Widget _continueButton() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appColorIndigoA100,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3,
                blurRadius: 1,
                color: Colors.black.withOpacity(0.05))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          "Continue"
              .text
              .fontFamily(appFontMuli)
              .color(appColorGrayLight)
              .fontWeight(FontWeight.w400)
              .make(),
          8.widthBox,
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.forward,
                  size: 18,
                  color: appColorGrayLight,
                ),
              ),
              //4.widthBox,
              Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.chevron_forward,
                  size: 12,
                  color: appColorGrayLight,
                ),
              )
            ],
          )
        ],
      ),
    );

Widget _timePart(DoctorAppointmentController controller) => Wrap(
      children: controller.list_slot_selected
          .map((element) => GestureDetector(
                onTap: () {
                  controller.chkTimeID.value = element.iD!;
                },
                child: AnimatedContainer(
                  //alignment:Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadiusDirectional.all(Radius.circular(4)),
                      color: controller.chkTimeID.value == element.iD
                          ? appColorBlue
                          : Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: appColorGrayDark.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: .1)
                      ]),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    width: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          controller.chkTimeID.value == element.iD
                              ? Icons.check_box_outlined
                              : Icons.crop_square_outlined,
                          size: 18,
                          color: controller.chkTimeID.value == element.iD
                              ? Colors.white
                              : appColorGrayDark,
                        ),
                        Text(
                          element.aPPOINTMENTTIME!,
                          style: customTextStyle.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );

Widget _datePart(DoctorAppointmentController controller) => Column(
      children: [
        // Align(
        //     alignment: Alignment.centerLeft,
        //     child: controller.chkDate.value == ''
        //         ? const SizedBox()
        //         : Text(
        //             "Appointment Date: ${controller.chkDate.value}",
        //             style: customTextStyle.copyWith(fontSize: 10),
        //           )),
        // 2.heightBox,
        Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: controller.dateNames
                    .map((element) => GestureDetector(
                          onTap: () {
                            controller.chkDate.value = element;
                            controller.selectDate();
                          },
                          child: AnimatedContainer(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(4),
                                color: controller.chkDate.value == element
                                    ? appColorLogo
                                    : appColorGrayLight,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      color: appColorGrayDark.withOpacity(0.3))
                                ]),
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              element,
                              style: customTextStyle.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: controller.chkDate.value == element
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        )
      ],
    );

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
  DoctorAppointmentController controller,
  ModelDoctorMobMaster dcontroller,
) =>
    Column(
      children: [
        Container(
            height: 100,
            padding: const EdgeInsets.all(4),
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
                    _degree(dcontroller.deptName, Colors.black87, 13),
                    _degree(dcontroller.desig, appColorGrayDark, 12),
                    _degree(dcontroller.special, appColorGrayDark),
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

// Widget _backButton(BuildContext context) => Row(
//       children: [
//         InkWell(
//             focusColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
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
