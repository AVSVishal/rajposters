import 'dart:convert';
import 'database_service.dart';
import 'http_service.dart';

class ConfigService {
  static final ConfigService _instance = ConfigService._internal();
  factory ConfigService() => _instance;
  ConfigService._internal();

  final DatabaseService _databaseService = DatabaseService();
  final HttpService _httpService = HttpService();

  Future<Map<String, dynamic>?> getConfig(String configUrl, String configType) async {
    try {
      // Check if cache is valid (3 hours following Trickology pattern)
      if (await _databaseService.isCacheValid(configType, 3)) {
        final cached = await _databaseService.getConfigCache(configType);
        if (cached != null) {
          return json.decode(cached['config_data']) as Map<String, dynamic>;
        }
      }

      // Fetch fresh data
      final freshData = await _httpService.fetchJson(configUrl);
      if (freshData != null) {
        // Cache the fresh data
        await _databaseService.saveConfigCache(
          configType,
          json.encode(freshData),
        );
        return freshData;
      }

      // Fallback to cached data if available
      final cached = await _databaseService.getConfigCache(configType);
      if (cached != null) {
        return json.decode(cached['config_data']) as Map<String, dynamic>;
      }

      return null;
    } catch (e) {
      print('Error getting config: $e');
      
      // Try to return cached data as fallback
      final cached = await _databaseService.getConfigCache(configType);
      if (cached != null) {
        return json.decode(cached['config_data']) as Map<String, dynamic>;
      }
      
      return null;
    }
  }

  Future<void> clearCache(String configType) async {
    try {
      final db = await _databaseService.database;
      await db.delete(
        'config_cache',
        where: 'config_type = ?',
        whereArgs: [configType],
      );
    } catch (e) {
      print('Error clearing cache for $configType: $e');
    }
  }

  Future<void> clearAllCache() async {
    try {
      final db = await _databaseService.database;
      await db.delete('config_cache');
    } catch (e) {
      print('Error clearing all cache: $e');
    }
  }
}