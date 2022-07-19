import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
//Future
Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
