
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:secondnumber/core/app_export.dart';
import 'package:secondnumber/core/network/network_info.dart';
import 'package:secondnumber/core/utils/pref_utils.dart';
import 'package:secondnumber/data/apiClient/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
  //  Get.put(PrefUtils());
    Get.put(ApiClient());
  //  Connectivity connectivity = Connectivity();
  //  Get.put(NetworkInfo(connectivity));
  }
}
