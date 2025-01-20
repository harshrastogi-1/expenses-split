import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../logger/log_manager.dart';

enum ConnectionType { noInternet, wifi, mobileData }

class NetworkManager extends GetxController {
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  ConnectionType connectionType = ConnectionType.wifi;

  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();

  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  //update internet status
  static StreamController<bool> isInternetConnectedController =
      StreamController.broadcast();

  @override
  void onInit() {
    super.onInit();
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<bool> getConnectionType() async {
    late List<ConnectivityResult> connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      Log.logData(e.toString(), logType: LogType.error);
    }
    return _updateState(connectivityResult);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  bool _updateState(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi)) {
      connectionType = ConnectionType.wifi;

      updateInternetStreamController(true);
      update();
      return true;
    } else if (result.contains(ConnectivityResult.mobile)) {
      connectionType = ConnectionType.mobileData;
      updateInternetStreamController(true);
      update();
      return true;
    } else if (result.contains(ConnectivityResult.none)) {
      connectionType = ConnectionType.noInternet;
      updateInternetStreamController(false);
      update();
      return false;
    } else {
      Log.logData('Network Error', logType: LogType.error);
      return false;
    }
  }

  void updateInternetStreamController(bool isActive) {
    if (!isInternetConnectedController.isClosed) {
      isInternetConnectedController.sink.add(isActive);
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();

    isInternetConnectedController.close();
  }
}
