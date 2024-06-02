import 'package:in_app_update/in_app_update.dart';
import 'package:url_launcher/url_launcher.dart';

Future<AppUpdateInfo?> checkForUpdate() async {
  AppUpdateInfo? _updateInfo;
  InAppUpdate.checkForUpdate().then((info) {
    _updateInfo = info;

    if (_updateInfo!.updateAvailability == UpdateAvailability.updateAvailable) {
      InAppUpdate.performImmediateUpdate().catchError((e) {
        print('error: '+ e.toString());
        // Handle the error
      });
    }
    return _updateInfo;
  }).catchError((e) {
    return _updateInfo;
  });
}

void _launchURL() async {
  const url =
      'https://play.google.com/store/apps/details?id=com.aghapp.eHealth&hl=en_US';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
