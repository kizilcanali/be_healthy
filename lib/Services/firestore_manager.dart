/*import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  FirestoreManager._privateConstructor();

  static final FirestoreManager instance =
      FirestoreManager._privateConstructor();

  CollectionReference smokeTimeProgress =
      FirebaseFirestore.instance.collection('smoke_time_progress');

  Future updateSavedSmokeTime(int isClicked) async {
    var now = DateTime.now();
    String nowDate = now.toString();

    return await smokeTimeProgress
        .doc('njJo851qu6ZSG2rHW0Rq')
        .update({'saved_time': nowDate, 'is_clicked': isClicked})
        .then((value) => print("Date Updated"))
        .catchError((error) => print("Failed To Update Time"));
  }
}
*/