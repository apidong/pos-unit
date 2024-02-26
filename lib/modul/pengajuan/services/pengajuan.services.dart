import 'package:dio/dio.dart';
import 'package:pos/utils/services/http_service.dart';
import 'package:pos/utils/services/secure_key.dart';

class PengajuanServices {
  final HttpService httpservice;
  PengajuanServices({required this.httpservice});

  Future<dynamic> getData(int limit, int page) async {
    try {
      Response response = await httpservice.getRequest('/api/mobile/pengajuan', data: {'length': limit, 'start': page});
      if (response.statusCode == 200) {
        return {'status': true, 'data': response.data};
      }

      return {'status': false, 'message': response.statusMessage};
    } catch (_) {
      final rError = {'status': false, 'message': _.toString()};
      return rError;
    }
  }

  Future<dynamic> getDatarinci(id) async {
    try {
      Response response = await httpservice.getRequest('/api/mobile/pengajuan/' + id);
      if (response.statusCode == 200) {
        return {'status': true, 'data': response.data};
      }

      return {'status': false, 'message': response.statusMessage};
    } catch (_) {
      final rError = {'status': false, 'message': _.toString()};
      return rError;
    }
  }
}
