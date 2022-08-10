abstract class RestClient {
  Future<Map<String, dynamic>> get({required String path});
}