import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';

import 'connectivity_status.dart';
class DataConnectivityService {
  // Create our public controller
  StreamController<DataConnectionStatus> connectivityStreamController = StreamController<DataConnectionStatus>();
  DataConnectivityService() {
    DataConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
      connectivityStreamController.add(dataConnectionStatus);
    });
  }
}