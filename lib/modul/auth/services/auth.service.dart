import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos/modul/auth/models/desa/desa_model.dart';
import 'package:pos/modul/auth/models/login_success/login_success.dart';
import 'package:pos/modul/auth/models/login_success/pamong.dart';
import 'package:pos/utils/services/http_service.dart';
import 'package:path_provider/path_provider.dart';

class AuthService {
  final HttpService httpservice;

  AuthService({required this.httpservice});

  Future<dynamic> login(username, password) async {
    try {
      final response = await httpservice.postRequest(
          'api/auth/login', {'email': username, 'password': password});

      if (response.statusCode == 200) {
        var result = LoginSuccess.fromJson(response.data);

        if (result.success == true) {
          final token = result.data!.token;
          final documentDirectory = await getApplicationDocumentsDirectory();
          var keyBox = await Hive.openBox('encryptionKeyBox',
              path: documentDirectory.path);
          if (!keyBox.containsKey('key')) {
            var key = Hive.generateSecureKey();
            keyBox.put('key', key);
          }

          var key = keyBox.get('key') as Uint8List;
          var encryptedBox = await Hive.openBox('vaultBox',
              encryptionCipher: HiveAesCipher(key));
          encryptedBox.put('secret', token);
          encryptedBox.put('password', password);

          var userJson = result.data!.toJson();

          var box = await Hive.openBox('user');
          box.putAll(userJson);

          setTokenFCM(); // simpan token ke database

          return {'status': true, 'message': 'success'};
        } else {
          return {'status': false, 'message': result.message};
        }
      }

      return false;
    } catch (_) {
      return {'status': false, 'message': _.toString()};
    }
  }

  setTokenFCM() async {
    // final messaging = FirebaseMessaging.instance;
    // String? fcmToken = await messaging.getToken();
    // final idDevice = await httpservice.getid();
    // httpservice.postRequest(
    //     'api/admin/fcm/register', {'device': idDevice, 'token': fcmToken});
  }

  lupaPassword(email) async {
    final response = await httpservice
        .postRequest('api/admin/resetpassword', {'email': email});

    if (response.statusCode == 200) {
      return {'status': true, 'message': 'success'};
    } else {
      return {'status': false, 'message': 'gagal mengirimkan link ke email'};
    }
  }
}
