import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
//Future
Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString)async{
    return await FirebaseFirestore.instance.collection("top").where("name",isGreaterThanOrEqualTo: queryString).get();


  }
}
