import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../utils/logger_utils.dart';

class FirebaseRemoteConfigService{
  final _TAG = "FirebaseRemoteConfigService";
  final _logger = LoggerUtils();

  FirebaseRemoteConfigService._() : _remoteConfig = FirebaseRemoteConfig.instance;

  static FirebaseRemoteConfigService? _instance;
  factory FirebaseRemoteConfigService() => _instance ??= FirebaseRemoteConfigService._();

  final FirebaseRemoteConfig _remoteConfig;

  String getString(String key) => _remoteConfig.getString(key);
  bool getBool(String key) =>_remoteConfig.getBool(key);
  int getInt(String key) =>_remoteConfig.getInt(key);
  double getDouble(String key) =>_remoteConfig.getDouble(key);

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 6),
    ),
  );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      _logger.log(TAG: _TAG, message: 'The config has been updated.');
    } else {
      _logger.log(TAG: _TAG, message:'The config is not updated..');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await fetchAndActivate();
  }

}