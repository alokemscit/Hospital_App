import 'package:asgar_ali_hospital/custom_widget/custom_widget_list.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/main_home_page.dart';
import 'package:get/get.dart';

import '../../../constant/const.dart';
import '../../../data/data_static_user.dart';
import '../../login_page/auth_provider/auth-provider.dart';
import '../../login_page/login_page.dart';
import '../controller/pat_history_controller.dart';

class PatHistoryPage extends StatelessWidget {
  const PatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PatHistoryController controller = Get.put(PatHistoryController());
    controller.context = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomGroupBox(
          bgColor: Colors.white,
          borderRadius: 8,
          //borderWidth:2,
            groupHeaderText: "Patient Details",
            child: _logo_and_user_part(controller))
      ],
    );
  }
}

// ignore: non_constant_identifier_names
_logo_and_user_part(PatHistoryController controller) =>  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration:  customBoxDecoration.copyWith(color: Colors.white),
        height: 70,
        width: 60,
        child: Opacity(
                      opacity: 0.9,
                      child: ClipRRect(
                          borderRadius: BorderRadiusDirectional.circular(8),
                          child: DataStaticUser.img ?? const Icon(Icons.people)),
                    ),
       ),
      // 8.widthBox,
         
       
         
      
     Expanded(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12,top: 8),
                child: _textC(DataStaticUser.name == '' ? "Login As (Geust)   " : 
                DataStaticUser.name,Colors.black,12,FontWeight.w600),
              ),
            ),
          ],
        ),
        
       12.heightBox,
  const Divider(
          height: 0.8,
          color: appColorGray200,
         ),
     
       4.heightBox,
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             SizedBox(
              width: 70,
              height: 30,
               child: TextButton.icon(
                
                onPressed: (){
            if(DataStaticUser.name==''){
               Navigator.push(
          controller.context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          );
            }else{


           CustomCupertinoAlertWithYesNo(controller.context, const Text("Alert"),
          const Text("Are you sure to Log Out?"), () {}, () {
        AuthProvider().logout();
        Navigator.pushReplacement(
          controller.context,
          MaterialPageRoute(builder: (context) => const MainHomePagae()),
        );
      });
        
         }

                }, label: Text(DataStaticUser.name ==''?"Log In ":"Log Out",
                             style: customTextStyle.copyWith(color:DataStaticUser.name ==''? appColorLogoDeep:appColorIndigoA100,
                             fontSize: 11,fontWeight: FontWeight.bold),)),
             ),
           ],
         )
        ],
       ),
     )
      
  
       
    ],
  ),
);

Widget _textC(String? text,  [Color fontColor=Colors.black87,double fontSize = 11.5, FontWeight fontWeight=FontWeight.w500]) =>
    text == null
        ? const SizedBox()
        : Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: customTextStyle.copyWith(
                    fontSize: fontSize,
                    color: fontColor,
                    fontWeight: fontWeight),
              ),
            ),
          );
