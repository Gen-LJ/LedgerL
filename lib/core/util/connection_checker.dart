import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isOnline() async {
  List<ConnectivityResult> result = await Connectivity().checkConnectivity();
  return !result.contains(ConnectivityResult.none);
}