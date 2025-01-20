abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> getData(TParams params);
}

class UseCaseResult {
  final Exception? exception;
  final String? errorCode;

  UseCaseResult({
    required this.errorCode,
    required this.exception,
  });

  bool get isSuccess => (errorCode == null);
}
