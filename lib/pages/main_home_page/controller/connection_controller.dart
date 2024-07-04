 
 
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  var connectionStatus = Rx<ConnectivityResult>(ConnectivityResult.none);

  var cnt = 0;
  @override
  void onInit() async{
    
    cnt = 0;
    super.onInit();
    await initializeConnectivity();
    print("object");
    print( connectionStatus.value );
    // Subscribe to connection changes
    Connectivity().onConnectivityChanged.listen((result) {
      //print('Connection status changed: $result');
      connectionStatus.value = result;
     
    });
  }

Future<void> initializeConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    connectionStatus.value = result;
  }

  bool get isConnected => connectionStatus.value != ConnectivityResult.none;

  void checkInternetConnection() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    connectionStatus.value = result;
  }
}
