import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> storeAttendance(String studentID, Position position) async {
    try {
      await _db.collection("attendance").add({
        "studentID": studentID,
        "timestamp": DateTime.now(),
        "latitude": position.latitude,
        "longitude": position.longitude
      });
      return true;
    } catch (e) {
      print("Error storing attendance: $e");
      return false;
    }
  }
}
