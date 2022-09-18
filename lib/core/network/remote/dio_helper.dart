import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constatns_manager.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstatns.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //*******getDat*****
  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
