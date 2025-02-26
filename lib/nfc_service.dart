import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  Future<String?> scanNFC() async {
    if (await NfcManager.instance.isAvailable()) {
      String? studentID;
      await NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          studentID = tag.data.toString();
          NfcManager.instance.stopSession();
        },
      );
      return studentID;
    }
    return null;
  }
}
