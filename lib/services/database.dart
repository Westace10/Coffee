import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});
  // collection reference
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("todo");

  Future updateUserData({
    String? firstName,
    String? lastName,
    String? profession,
    String? userId,
    String? phoneNumb,
    String? dateCreated,
  }) async {
    return await todoCollection.doc(uid).set({
      "firstName": firstName ?? "",
      "lastName": lastName ?? "",
      "userId": userId ?? "",
      "profession": profession ?? "",
      "phone": phoneNumb ?? "",
      "dateCreated": dateCreated ?? "",
    });
  }

  // get brews stream
  Stream<QuerySnapshot> get brews {
    return todoCollection.snapshots();
  }
}
