import 'package:dio/dio.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/common/utils/tost_mesage.dart';
import 'package:ulearning/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._interanal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._interanal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {

          return handler.next(response);
        },
        onError: (DioException e, handler) {

          ErrorEntity eInfo = createErrorEntity(e);
          toastInfo(eInfo.message);
          onError(eInfo);
        },
      ),
    );
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    final headers = <String, dynamic>{};
    final accessToken = Global.storageServices.getUserToken();

    if (accessToken.isNotEmpty) {
      headers["Authorization"] = ['Bearer $accessToken'];
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      print(authorization);
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");

    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timed out");

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timed out");

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificates");

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Bad request");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Server internal error");
      }
      return ErrorEntity(
          code: error.response!.statusCode!, message: "Server bad response");

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Server canceled it");

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  switch (eInfo.code) {
    case 400:
      break;
    case 401:
      break;
    case 500:
      break;
    default:
      break;
  }
}
