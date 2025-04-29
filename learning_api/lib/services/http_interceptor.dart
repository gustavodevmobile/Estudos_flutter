import 'package:http_interceptor/http_interceptor.dart';
// import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  // Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    print('----- Request -----');
    print(request.toString());
    print(request.headers.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    print('----- Response -----');

    print('Code: ${response.statusCode}');
    if (response is Response) {
      print((response).body);
    }
    return response;
  }
}
