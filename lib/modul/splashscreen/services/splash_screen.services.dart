import 'package:pos/modul/auth/services/auth.service.dart';
import 'package:pos/utils/services/http_service.dart';

class SplashscreenService {
  final HttpService httpservice;
  SplashscreenService({required this.httpservice});

  Future<dynamic> auth() async {
    try {
      final cekToken =
          await httpservice.getRequest('api/mobile/validate-token');

      if (cekToken.data['success'] == 'true') {
        // AuthService(httpservice: httpservice).setTokenFCM(); //perbarui token jika terjadi pembaharuan token di FCM
        return true;
      }
      return false;
    } catch (_) {
      return _;
    }
  }
}
