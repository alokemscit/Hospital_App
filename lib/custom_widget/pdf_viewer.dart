import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/custom_widget/custom_widget_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
        statusBarBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor:kBgLightColor,
      appBar: AppBar(
        backgroundColor:kBgLightColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: customBackButton(context,(){},false),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: GestureDetector(
                onTap: () async{
                 await savePdf(context,url);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.share,color:Colors.blueAccent,))),
          )
        ],
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
