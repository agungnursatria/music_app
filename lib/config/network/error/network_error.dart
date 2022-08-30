import 'package:music_app/config/network/constant/constant.dart';
import 'package:music_app/config/network/error/network_error_type.dart';

class NetworkError {
  String message;
  NetworkErrorType type;

  NetworkError([
    this.message = NetworkConstant.unknownErrorMessage,
    this.type = NetworkErrorType.Undefined,
  ]);

  NetworkError copyWith({
    String? message,
    NetworkErrorType? type,
  }) {
    return NetworkError(
      message ?? this.message,
      type ?? this.type,
    );
  }

  @override
  String toString() => 'NetworkError(message: $message, type: $type)';
}
