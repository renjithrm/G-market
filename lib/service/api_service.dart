// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:user_app/constant/api_servics_links.dart';

class ApiServics {
  final _dio = Dio();
  final _apiLink = ApiLink();
  ApiServics() {
    _dio.options = BaseOptions(
      baseUrl: _apiLink.BASE_URL,
      responseType: ResponseType.plain,
    );
  }
  Future getRespose(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
      if (response.statusCode == 200) {
        //  print(response.data);
        return response.data;
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        print("response${err.message}");
      } else if (err.type == DioErrorType.cancel) {
        print("cancel${err.message}");
      } else if (err.type == DioErrorType.connectTimeout) {
        print("connect timeout${err.message}");
      } else if (err.type == DioErrorType.other) {
        print("other${err.message}");
      } else if (err.type == DioErrorType.receiveTimeout) {
        print("receiveTimeout${err.message}");
      } else if (err.type == DioErrorType.sendTimeout) {
        print("sendTimeout${err.message}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future postData(String url, dynamic userData) async {
    Response response;
    try {
      response = await _dio.post(
        url,
        data: userData,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        print("response${err.message}");
      } else if (err.type == DioErrorType.cancel) {
        print("cancel${err.message}");
      } else if (err.type == DioErrorType.connectTimeout) {
        print("connect timeout${err.message}");
      } else if (err.type == DioErrorType.other) {
        print("other${err.message}");
      } else if (err.type == DioErrorType.receiveTimeout) {
        print("receiveTimeout${err.message}");
      } else if (err.type == DioErrorType.sendTimeout) {
        print("sendTimeout${err.message}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future delectItems({required String url}) async {
    try {
      var response = await _dio.delete(url);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        print("response${err.message}");
      } else if (err.type == DioErrorType.cancel) {
        print("cancel${err.message}");
      } else if (err.type == DioErrorType.connectTimeout) {
        print("connect timeout${err.message}");
      } else if (err.type == DioErrorType.other) {
        print("other${err.message}");
      } else if (err.type == DioErrorType.receiveTimeout) {
        print("receiveTimeout${err.message}");
      } else if (err.type == DioErrorType.sendTimeout) {
        print("sendTimeout${err.message}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateItems({required String url}) async {
    try {
      var response = await _dio.put(url);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.response) {
        print("response${err.message}");
      } else if (err.type == DioErrorType.cancel) {
        print("cancel${err.message}");
      } else if (err.type == DioErrorType.connectTimeout) {
        print("connect timeout${err.message}");
      } else if (err.type == DioErrorType.other) {
        print("other${err.message}");
      } else if (err.type == DioErrorType.receiveTimeout) {
        print("receiveTimeout${err.message}");
      } else if (err.type == DioErrorType.sendTimeout) {
        print("sendTimeout${err.message}");
      }
    } catch (e) {
      print(e);
    }
  }
}
