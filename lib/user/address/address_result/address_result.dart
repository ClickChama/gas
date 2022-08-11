import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_result.freezed.dart';

@freezed
class AddressResult<T> with _$AddressResult<T> {
  factory AddressResult.success(T data) = success;
  factory AddressResult.error(String message) = Error;

}
