import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class STTEndpointCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? audiofile,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'STT Endpoint',
      apiUrl: 'https://rainconnect-cool-api.onrender.com/stt-v2-turbo',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'audiofile': audiofile,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TranslateEndpointCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? lang = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$text",
  "lang": "$lang"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'translate endpoint',
      apiUrl: 'https://rainconnect-cool-api.onrender.com/translate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? value(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.text''',
      ));
}

class SummarizeEndpointCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "text": "HERE THE TEXT THAT NEEDS TO BE SUMMARIZED"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'summarize endpoint',
      apiUrl: 'https://rainconnect-cool-api.onrender.com/summarize',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BusinessCardReaderEndpointCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Business Card Reader endpoint',
      apiUrl: 'https://rainconnect-cool-api.onrender.com/decrypt-bcr',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
