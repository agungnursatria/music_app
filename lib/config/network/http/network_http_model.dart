/// [NetworkModel] is used a response model, result from fetch API
class NetworkModel {
  int? code;
  Map<String, dynamic>? response;

  NetworkModel({
    required this.code,
    required this.response,
  });
}
