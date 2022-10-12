import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:davincafe/network/request-exception.dart';
import 'package:davincafe/provider/auth-provider.dart';
import 'package:davincafe/provider/local_storage.dart';
import 'package:davincafe/util/custom-toast.dart';
import 'package:provider/provider.dart';

Future<bool> isTokenExpire(BuildContext context) async {
  final tokenData = await LocalStorage.instance.getJson("tokenData");
  int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  // print(now);
  // print(tokenData['token_detail']['exp']);
  if (now > tokenData['token_detail']['exp']) {
    showCustomToast(
      context: context,
      alertType: "failed",
      message: "กรุณาเข้าสู่ระบบใหม่",
      milli: 3000,
    );
    Future.delayed(
      Duration(milliseconds: 3000),
      () {
        context.read<AuthProvider>().logout(context);
      },
    );
    return true;
  }
  return false;
}

Future<dynamic> postRequest({
  required String path,
  BuildContext? context,
  Map? data,
}) async {
  BaseOptions options = BaseOptions(
    connectTimeout: 7000,
    receiveTimeout: 7000,
    sendTimeout: 7000,
  );
  var dio = Dio(options);
  try {
    final res = await dio.post(
      path,
      data: data,
    );
    return res.data;
  } on DioError catch (e) {
    print("error request : $path");
    errorFilter(e);
  }
}

Future<dynamic> getRequest({
  required String path,
  BuildContext? context,
  Map<String, dynamic>? queryParameters,
}) async {
  BaseOptions options = BaseOptions(
    connectTimeout: 9000, //70 seconds
    receiveTimeout: 9000, //70 seconds
    sendTimeout: 9000, //70 seconds
  );
  var dio = Dio(options);
  try {
    final res = await dio.get(
      path,
      queryParameters: queryParameters,
    );
    //print(res.data.runtimeType);
    return res.data;
  } on DioError catch (e) {
    print(e.type);
    print("error request : $path");
    errorFilter(e);
  }
}

Future<dynamic> patchRequest({
  required String path,
  required BuildContext context,
  int? timeout,
  Map? data,
}) async {
  var dio = Dio();
  try {
    final res = await dio.patch(
      path,
      data: data,
      options: Options(
        sendTimeout: timeout,
      ),
    );
    return res.data;
  } on DioError catch (e) {
    errorFilter(e);
  }
}

Future<dynamic> putRequest({
  required String path,
  BuildContext? context,
  Map? data,
}) async {
  BaseOptions options = BaseOptions(
    connectTimeout: 7000,
    receiveTimeout: 7000,
    sendTimeout: 7000,
  );
  var dio = Dio(options);
  try {
    final res = await dio.put(
      path,
      data: data,
    );
    return res.data;
  } on DioError catch (e) {
    print("error request : $path");
    errorFilter(e);
  }
}

errorFilter(DioError e) {
  if (e.type == DioErrorType.receiveTimeout ||
      e.type == DioErrorType.connectTimeout ||
      e.type == DioErrorType.sendTimeout) {
    throw RequestException(
      statusCode: 503,
      data: e.response?.data,
      message: "ไม่สามารถเชื่อมต่อเซิฟเวอร์ได้\n(time out)",
      subMessage: "กรุณาลองใหม่อีกครั้ง",
    );
  }
  if (e.error is SocketException) {
    throw RequestException(
      statusCode: 503,
      data: e.response?.data,
      message: "ไม่สามารถเชื่อมต่ออินเตอร์เน็ตได้",
      subMessage: "กรุณาเชื่อมต่ออินเตอร์เน็ตแล้วลองอีกครั้ง",
    );
  }
  if (e.response != null) {
    if (e.response!.statusCode! >= 500) {
      throw RequestException(
        statusCode: e.response!.statusCode!,
        data: e.response?.data,
        message: "ไม่สามารถเชื่อมต่อเซิฟเวอร์ได้",
        subMessage: "ไม่สามารถเชื่อมต่อเซิฟเวอร์ได้กรุณาลองใหม่อีกครั้ง",
      );
    } else {
      throw RequestException(
        statusCode: e.response!.statusCode!,
        data: e.response?.data,
        message: "เกิดข้อผิดพลาด",
        subMessage: "เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง",
      );
    }
  } else {
    throw RequestException(
      statusCode: 0,
      data: null,
      message: "มีข้อผิดพลาดเกิดขึ้น",
      subMessage: "เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง",
    );
  }
}
