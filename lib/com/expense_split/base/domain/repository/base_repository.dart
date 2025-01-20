import '../../data/api/model/result_state.dart';

typedef T = Function();

abstract class BaseRepository {
  Future<ResultState> checkNetwork(T body);
}
