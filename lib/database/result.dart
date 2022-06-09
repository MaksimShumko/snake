abstract class Result<S> {
  factory Result.success(S value) => Success(value);

  factory Result.failure(String? reason, int? code) => Failure(reason, code);

  factory Result.remoteUnknownFailure() => Failure('RemoteUnknown', 1);

  factory Result.localEmptyObjectFailure() => Failure('LocalEmptyObject', 2);
}

class Success<S> implements Result<S> {
  Success(this.value);

  final S value;
}

class Failure<S> implements Result<S> {
  Failure(this.reason, this.code);

  final String? reason;
  final int? code;
}
