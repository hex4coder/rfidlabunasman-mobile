import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:rfidlabunasman/model/history_model.dart';

class HistoryController extends GetxController {
  /// observable data list
  var $listData = <Object>[].obs;
  var $isLoading = false.obs;

  /// fungsi memanggil data dari server
  Future<void> fetchData() async {
    $isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    FirebaseDatabase.instance
        .reference()
        .child('history/')
        .onValue
        .listen((event) {
      $isLoading.value = true;
      final dataMap = event.snapshot.value;
      final keys = dataMap.keys;
      List<HistoryModel> listModels = [];
      keys.forEach((key) {
        final id = key;
        final data = dataMap[id];
        data.putIfAbsent('id', () => id);
        final HistoryModel model = HistoryModel.fromJson(data);
        listModels.add(model);
      });
      $listData.value = listModels;
      $isLoading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    // init method
    this.fetchData();
  }
}
