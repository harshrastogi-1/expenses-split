import '../../../network/constants/api_constants.dart';
import '../../../network/constants/error_code_constants.dart';
import '../../../network/manager/network_manager.dart';
import '../../domain/repository/base_repository.dart';
import '../api/model/result_state.dart';

class BaseRepositoryImpl extends BaseRepository {
  final NetworkManager _networkManager;

  BaseRepositoryImpl({
    required NetworkManager networkManager,
  }) : _networkManager = networkManager;

  @override
  Future<ResultState> checkNetwork(T body) async {
    bool isConnected = await _networkManager.getConnectionType();
    if (isConnected) {
      return Success(data: body);
    } else {
      return Error(
          errorCode: ErrorCodeConstants.statusNoInternet,
          message: ApiConstants.noInternetMessage);
    }
  }
}
