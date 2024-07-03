class ApiResponse<T> {
  final T? _data;
  final String? _error;
  final String? _status;

  const ApiResponse({
    T? data,
    String? error,
    String? status,
  })  : _data = data,
        _error = error,
        _status = status;

  T? get getData => _data;

  String? get getException => _error;

  String? get getStatus => _status;

  bool get hasData => _data != null;

  bool get hasException => _error != null;
}
