abstract class ResultState<T> {}

class Success<T> extends ResultState<T> {
  final T? data;

  Success({this.data});
}

class Error extends ResultState {
  Error({this.message, this.errorCode, this.data});

  String? message;
  String? errorCode;
  final dynamic data;
}

class Loading extends ResultState {
  final bool isLoading;

  Loading(this.isLoading);
}
