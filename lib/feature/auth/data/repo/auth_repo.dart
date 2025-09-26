import 'dart:developer';
import 'package:dio/dio.dart';

class AuthRepo {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://codingarabic.online/api",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  /// Login
  static Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "/login",
        data: {"email": email, "password": password},
      );

      // نجاح
      if (response.statusCode == 200) {
        return response.data; // رجّع الداتا نفسها
      }

      // أكواد غير 200 (نادر توصل هنا لو Dio يرمي Exception)
      final msg = _extractErrorMessage(response);
      log("Login error: $msg");
      return msg;
    } on DioException catch (e) {
      // أخطاء السيرفر/الشبكة/التحقق
      final msg = _extractDioError(e);
      log("Login dio error: $msg");
      return msg;
    } catch (e) {
      log("Login unknown error: $e");
      return "Unexpected error, try again.";
    }
  }

  /// Register
  static Future<dynamic> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String? phone,
  }) async {
    try {
      final response = await dio.post(
        "/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
          if (phone != null && phone.isNotEmpty) "phone": phone,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data; // نجاح
      }

      final msg = _extractErrorMessage(response);
      log("Register error: $msg");
      return msg;
    } on DioException catch (e) {
      final msg = _extractDioError(e);
      log("Register dio error: $msg");
      return msg;
    } catch (e) {
      log("Register unknown error: $e");
      return "Unexpected error, try again.";
    }
  }

  // ===== Helpers =====
  static String _extractErrorMessage(Response response) {
    try {
      final data = response.data;
      if (data is Map) {
        // جرّب مفاتيح شائعة
        if (data["message"] is String) return data["message"];
        if (data["error"] is String) return data["error"];
        if (data["errors"] is Map && (data["errors"] as Map).isNotEmpty) {
          // أول رسالة تحقق
          final first = (data["errors"] as Map).values.first;
          if (first is List && first.isNotEmpty) return first.first.toString();
          return first.toString();
        }
      }
      return "Request failed with status ${response.statusCode}";
    } catch (_) {
      return "Request failed with status ${response.statusCode}";
    }
  }

  static String _extractDioError(DioException e) {
    // لو السيرفر رجع Response فيها message
    if (e.response != null) {
      return _extractErrorMessage(e.response!);
    }
    // أخطاء شبكة/Timeout
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return "Connection timeout, please try again.";
      case DioExceptionType.connectionError:
        return "Network error, check your internet.";
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
      return "Something went wrong, please try again.";
    }
  }
}
