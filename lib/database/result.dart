abstract class Result<S> {
  factory Result.success(S value) => Success(value);

  factory Result.failure(String? reason, int? code) => Failure(reason, code);
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
