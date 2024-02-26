class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message ';
  }
}

class InternetExceptions extends AppExceptions {
  InternetExceptions([String? message]) : super(message, 'No Internet');
}

class RequestTimeoutExceptions extends AppExceptions {
  RequestTimeoutExceptions([String? message])
      : super(message, 'Request Timeout');
}

class InternalServerExceptions extends AppExceptions {
  InternalServerExceptions([String? message])
      : super(message, 'Internal Server Error : ');
}

class InvalidUrlExceptions extends AppExceptions {
  InvalidUrlExceptions([String? message]) : super(message, 'Invalid Url');
}

class FetchDataExceptions extends AppExceptions {
  FetchDataExceptions([String? message])
      : super(message, 'Error while fetching data from server');
}
