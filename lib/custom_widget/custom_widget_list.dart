import 'package:asgar_ali_hospital/constant/const.dart';
 

class CustomGroupBox extends StatelessWidget {
  const CustomGroupBox(
      {super.key,
      required this.groupHeaderText,
      required this.child,
      this.textColor = Colors.black,
      this.borderWidth = 0.6,
      this.bgColor = kWebBackgroundColor,
      this.borderRadius = 3,
      this.textHeaderFontSize = 10,
      this.fontWeight = FontWeight.w500});
  final String groupHeaderText;
  final Color textColor;
  final Widget child;
  final double borderWidth;
  final Color bgColor;
  final double borderRadius;
  final double textHeaderFontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                  decoration: customBoxDecoration.copyWith(
                    color: bgColor,
                    border: Border.all(
                      width: borderWidth,
                      color: appColorGrayDark.withOpacity(0.28),
                    ),
                    // color: kWebBackgroundColor,
                    borderRadius:
                        BorderRadiusDirectional.circular(borderRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 6,
            top: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              //  padding: EdgeInsets.symmetric(horizontal: 6),
              // width: 100,
              height: borderWidth,
              color: bgColor,
              child: Text(
                groupHeaderText,
                style: customTextStyle.copyWith(
                    fontSize: textHeaderFontSize,
                    fontWeight: fontWeight,
                    color: bgColor,
                    fontStyle: FontStyle.italic),
              ),
            )),
        Positioned(
            left: 6,
            top: 0.5,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                //  color: bgColor,
                child: Text(
                  groupHeaderText,
                  style: customTextStyle.copyWith(
                      fontSize: textHeaderFontSize,
                      fontWeight: fontWeight,
                      color: textColor,
                      fontStyle: FontStyle.italic),
                ))),
      ],
    );
  }
}

BoxDecoration customBoxDecoration = BoxDecoration(
  // color: appColorBlue.withOpacity(0.05),
  color: kWebBackgroundColor,
  borderRadius:
      const BorderRadius.all(Radius.circular(8)), // Uncomment this line
  border: Border.all(
      color: appColorGrayDark,
      width: 0.108,
      strokeAlign: BorderSide.strokeAlignCenter),
  boxShadow: [
    BoxShadow(
      color: appColorBlue.withOpacity(0.0085),
      spreadRadius: 0.1,
      blurRadius: 5.2,
      //offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: appColorBlue.withOpacity(0.0085),
      spreadRadius: 0.2,
      blurRadius: 3.2,
      //offset: const Offset(1, 0),
    ),
  ],
);

class CustomTextHeader extends StatelessWidget {
  const CustomTextHeader(
      {super.key,
      required this.text,
      this.textSize = 13,
      this.textColor = Colors.black,
      this.fontweight = FontWeight.bold});
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: customTextStyle.copyWith(
          fontWeight: fontweight, fontSize: textSize, color: textColor),
    );
  }
}

Widget customBackButton(BuildContext context, [Function? onTapCallback,bool isPading=true]) => Row(
      children: [
        InkWell(
          borderRadius:BorderRadius.circular(50),
            focusColor: Colors.transparent,
            hoverColor:appColorBlue,
            highlightColor: Colors.transparent,
            splashColor: appColorPista,
            onTap: () {
              Navigator.pop(context);
              if (onTapCallback != null) {
                onTapCallback();
              }
              // Get.delete<OnlinePaymentController>();
            },
            child: Container(
              
              color: Colors.transparent,
              padding: isPading?const EdgeInsets.all(  4):EdgeInsets.zero,
              // ignore: prefer_const_constructors
              child: Icon(Icons.arrow_back_ios_new,size: 20,),
            )),
      ],
    );
