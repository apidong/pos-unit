import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class SecureKey {
  Future generate() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    var keyBox =
        await Hive.openBox('encryptionKeyBox', path: documentDirectory.path);
    if (!keyBox.containsKey('key')) {
      var key = Hive.generateSecureKey();
      keyBox.put('key', key);
    }
    return keyBox.get('key') as Uint8List;
  }

  Future password() async {
    final key = await generate();
    var encryptedBox =
        await Hive.openBox('vaultBox', encryptionCipher: HiveAesCipher(key));
    return encryptedBox.get('password');
  }
}
