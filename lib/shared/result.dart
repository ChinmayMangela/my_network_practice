
enum ResultState {
  loading,
  success,
  failure,
}

class Result<T> {
  final ResultState state;
  final T? data;
  final String? message;

  Result.loading() : state = ResultState.loading, data = null, message = null;
  Result.success(this.data) : state = ResultState.success, message = null;
  Result.failure(this.message) : state = ResultState.failure, data = null;
}