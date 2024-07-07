import 'package:data_connection_checker_tv/data_connection_checker.dart';


abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
 final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImp({required this.dataConnectionChecker});
  @override
  Future<bool>? get isConnected => dataConnectionChecker.hasConnection;
}
