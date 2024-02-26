import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HttpCommonService {
  var dio = Dio();
  final String url;

  HttpCommonService(this.url) {
    dio.options
      ..connectTimeout = const Duration(seconds: 50)
      ..receiveTimeout = const Duration(seconds: 50)
      ..headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

    initializeInterceptors();
  }

  Future getUrlBackend() async {
    return url;
  }

  Future getToken() async {
    var keyBox = await Hive.openBox('encryptionKeyBox');
    if (!keyBox.containsKey('key')) {
      return "";
    }

    var key = keyBox.get('key') as Uint8List;
    var encryptedBox =
        await Hive.openBox('vaultBox', encryptionCipher: HiveAesCipher(key));
    var token = encryptedBox.get('secret').toString();
    return "Bearer $token";
  }

  Future getid() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.id; // unique ID on Android
      } else if (Platform.isIOS) {
        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor; // unique ID on iOS
      }
    } on PlatformException {
      return '';
    }
  }

  Future<Response> getRequest(String endPoint,
      {Map<String, dynamic>? data}) async {
    Response response;
    final token = await getToken();
    final String baseUrl = await getUrlBackend();
    final String idDevice = await getid();

    dio.options.headers["Authorization"] = token;
    dio.options.headers["Device"] = idDevice;
    dio.options.baseUrl = baseUrl;
    try {
      response = await dio.get(endPoint, queryParameters: data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw (errorMessage);
    }

    return response;
  }

  Future<Response> postRequest(String endPoint, Object data) async {
    final token = await getToken();
    final String baseUrl = await getUrlBackend();
    final String idDevice = await getid();

    dio.options.headers["Authorization"] = token;
    dio.options.headers["Device"] = idDevice;
    dio.options.baseUrl = baseUrl;

    try {
      final response = await dio.post(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Response> deleteRequest(String endPoint, Object data) async {
    Response response;
    final token = await getToken();
    final String baseUrl = await getUrlBackend();
    final String idDevice = await getid();

    dio.options.headers["Device"] = idDevice;
    dio.options.headers["Authorization"] = token;
    dio.options.baseUrl = baseUrl;

    try {
      response = await dio.delete(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Response> putRequest(String endPoint, Object data) async {
    Response response;
    final token = await getToken();
    final String baseUrl = await getUrlBackend();
    final String idDevice = await getid();

    dio.options.headers["idDevice"] = idDevice;
    dio.options.headers["Authorization"] = token;
    dio.options.baseUrl = baseUrl;

    try {
      response = await dio.put(endPoint, data: data);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<Response> downloadRequest(String endPoint, filename, Object data,
      {Options? option}) async {
    Response response;
    final token = await getToken();
    final String baseUrl = await getUrlBackend();
    dio.options.headers["Authorization"] = token;

    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    dio.options.baseUrl = baseUrl;

    // final savePath = 'storage/emulated/0/Download/' + filename;
    final output = await getTemporaryDirectory();
    final savePath = '${output.path}/$filename';
    try {
      response =
          await dio.download(endPoint, savePath, data: data, options: option);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/$uniqueFileName';
    return path;
  }

  initializeInterceptors() {
    dio.interceptors
      ..add(InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ))
      ..add(LogInterceptor(
          responseBody: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true)); //Open log;
  }
}

class DioExceptions implements Exception {
  String message = 'Something went wrong';

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message =
            _handleError(dioError.response!.statusCode, dioError.response);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        if (dioError.error is HandshakeException ||
            dioError.error is SocketException) {
          message = dioError.error.toString();
        } else {
          message = dioError.message.toString();
        }

        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(statusCode, dynamic error) {
    error = json.decode(error.toString());
    switch (statusCode) {
      case 400:
        return error["message"];
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      case 403:
      case 401:
      case 422:
        var pesan = '';
        if (error['messages'] != null) {
          pesan = error['messages'].toString();
        } else {
          pesan = error[error.keys.elementAt(0)].toString();
        }
        return pesan;
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
