import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/core/rest_client.dart';

class MockRestClient extends Mock implements RestClient {
  // Overrides to avoid null-safety mocking errors.
  @override
  Future<Map<String, dynamic>> get({String? path}) =>
      super.noSuchMethod(Invocation.method(#get, [], {#path: path}),
          returnValue: Future.value({'': ''}));
}
