abstract class ErrorCodeConstants {
  static const int statusSuccess = 200;
  static const int statusUpdated = 202;
  static const int statusCreated = 201;
  static const int statusNoContent = 204;
  static const int statusBadRequest = 400;
  static const int statusFailed = 403;
  static const int statusUnauthorised = 401;
  static const int statusNotFound = 404;
  static const int statusInternalServer = 500;
  static const int serviceNotAvailable = 503;
  static const int appUpdateRequired = 426;
  static const int accessLimit = 412;

  static const statusNoInternet = '504';

  static const String statusNoData = '100';
  static const String statusDataNotPurchased = '101';
}
