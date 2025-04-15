import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Sparke  Buildship Group Code

class SparkeBuildshipGroup {
  static String getBaseUrl() => 'https://27a7ku.buildship.run';
  static Map<String, String> headers = {};
  static CalculateBookScoresCall calculateBookScoresCall =
      CalculateBookScoresCall();
  static GetPagesCall getPagesCall = GetPagesCall();
  static UpdateUserBookCall updateUserBookCall = UpdateUserBookCall();
}

class CalculateBookScoresCall {
  Future<ApiCallResponse> call({
    String? bookId = '',
  }) async {
    final baseUrl = SparkeBuildshipGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CalculateBookScores',
      apiUrl: '${baseUrl}/CalculateBookScores',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'book_id': bookId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPagesCall {
  Future<ApiCallResponse> call({
    String? bookId = '',
    String? chapterId = '',
  }) async {
    final baseUrl = SparkeBuildshipGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPages',
      apiUrl: '${baseUrl}/getPages',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'book_id': bookId,
        'chapter_id': chapterId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserBookCall {
  Future<ApiCallResponse> call({
    int? chapters,
    int? userBookId,
  }) async {
    final baseUrl = SparkeBuildshipGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "chapters": ${chapters},
  "user_book_id": ${userBookId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUserBook',
      apiUrl: '${baseUrl}/updateChapters',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Sparke  Buildship Group Code

/// Start Fast API Group Code

class FastAPIGroup {
  static String getBaseUrl() =>
      'https://doc-to-text-6cfb7f435acb.herokuapp.com';
  static Map<String, String> headers = {};
}

/// End Fast API Group Code

class BuildshipDeleteUserCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    final ffApiRequestBody = '''
${userID}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Buildship Delete User',
      apiUrl: 'https://d7b00i.buildship.run/deleteUser-3b5b1c9fc9a7',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
