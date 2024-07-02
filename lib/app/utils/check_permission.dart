import 'package:permission_handler/permission_handler.dart';

Future<bool> checkAudioPermission() async {
  var status = await Permission.microphone.status;
  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    return false;
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
    return false;
  }
  return false;
}

Future<bool> requestAudioPermission() async {
  var permission = await Permission.microphone.request();
  if (permission.isGranted) {
    return true;
  } else {
    return false;
  }
}