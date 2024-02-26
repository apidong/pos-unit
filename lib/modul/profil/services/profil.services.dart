import 'package:dio/dio.dart';
import 'package:pos/utils/services/http_service.dart';
import 'package:path_provider/path_provider.dart';

class Profilservice {
  final HttpService httpservice;

  Profilservice({required this.httpservice});

  Future logout() async {
    Response response;

    try {
      final idDevice = await httpservice.getid();
      response = await httpservice.postRequest('api/mobile/auth/logout', {'device': idDevice});

      if (response.statusCode == 200) {
        final data = response.data;
        return data;
      }
      return {'status': false, 'message': 'hubungi administrator : unknown error at LayananServices'};
    } catch (_) {
      final rError = {'status': false, 'message': _.toString()};
      return rError;
    }
  }

  Future foto(filename) async {
    Response response;

    try {
      response = await httpservice.downloadRequest('api/admin/profil/foto', filename, {});
      final output = await getTemporaryDirectory();
      final savePath = '${output.path}/$filename';

      if (response.statusCode == 200) {
        return {'status': true, 'data': savePath};
      }
      return {'status': false, 'message': 'hubungi administrator : unknown error at LayananServices'};
    } catch (_) {
      final rError = {'status': false, 'message': _.toString()};
      return rError;
    }
  }

  Future gantiPassword(data) async {
    Response response;

    try {
      response = await httpservice.putRequest('api/admin/profil/ganti_password', data);
      if (response.statusCode == 200) {
        return {'status': true, 'message': 'success'};
      }
      return {'status': false, 'message': response};
    } catch (_) {
      return {'status': false, 'message': _.toString()};
    }
  }

  Future updateProfil(data) async {
    Response response;

    try {
      response = await httpservice.putRequest('api/admin/profil/update', data);
      if (response.statusCode == 200) {
        return {'status': true, 'message': 'success'};
      }
      return {'status': false, 'message': response};
    } catch (_) {
      return {'status': false, 'message': _.toString()};
    }
  }
}
