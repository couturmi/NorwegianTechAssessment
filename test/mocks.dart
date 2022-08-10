import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:norwegian_tech_assessment/core/rest_client.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {
  // Overrides to avoid null-safety mocking errors.
  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#get, [route, previousRoute]));
}

class MockRestClient extends Mock implements RestClient {
  // Overrides to avoid null-safety mocking errors.
  @override
  Future<Map<String, dynamic>> get({String? path}) =>
      super.noSuchMethod(Invocation.method(#get, [], {#path: path}),
          returnValue: Future.value({'': ''}));
}
