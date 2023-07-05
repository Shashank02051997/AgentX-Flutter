import 'package:agentx/utils/snackbar_status.dart';
import 'package:dio/dio.dart';

import 'app_utils.dart';

class ErrorHandingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
    super.onError(err, handler);
  }
}
