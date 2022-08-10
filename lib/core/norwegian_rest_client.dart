import 'package:basic_utils/basic_utils.dart';
import 'package:norwegian_tech_assessment/core/rest_client.dart';

class NorwegianRestClient extends RestClient {
  static const String baseUrl = "https://www.ncl.com/cms-service/";

  NorwegianRestClient() : super();

  @override
  Future<Map<String, dynamic>> get({required String path}) async {
    return await HttpUtils.getForJson("$baseUrl$path");
  }

  // implement additional HTTP methods as needed
}
