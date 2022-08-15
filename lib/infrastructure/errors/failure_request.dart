class FailureRequest implements Exception {
  final String _message;

  const FailureRequest({required String message}) : _message = message;

  factory FailureRequest.badRequest([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.forbidden([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.notFound([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.serverError([String value = '']) {
    return FailureRequest(message: value);
  }

  factory FailureRequest.conflict([String value = '']) {
    return FailureRequest(message: value);
  }

  List<Object?> get props => [_message];

  factory FailureRequest.unknownError([String? value]) {
    return const FailureRequest(message: 'unknownError');
  }

  @override
  String toString() {
    return _message;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FailureRequest && other._message == _message;
  }

  @override
  int get hashCode => _message.hashCode;
}
