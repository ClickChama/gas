import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_result.freezed.dart';

@freezed
class UserResult<T> with _$UserResult<T> {
  factory UserResult.success(T data) = success;
  factory UserResult.error(String message) = Error;

}
