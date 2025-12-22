class AppConfig {
  final String appName;
  final String version;
  final String lastUpdated;
  final Map<String, dynamic> features;
  final ApiConfig apiConfig;

  AppConfig({
    required this.appName,
    required this.version,
    required this.lastUpdated,
    required this.features,
    required this.apiConfig,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      appName: json['app_name'] ?? 'Notes to Quiz AI',
      version: json['version'] ?? '0.1.0',
      lastUpdated: json['last_updated'] ?? '',
      features: Map<String, dynamic>.from(json['features'] ?? {}),
      apiConfig: ApiConfig.fromJson(json['api_config'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'app_name': appName,
      'version': version,
      'last_updated': lastUpdated,
      'features': features,
      'api_config': apiConfig.toJson(),
    };
  }
}

class ApiConfig {
  final String baseUrl;
  final int timeout;
  final Map<String, String> endpoints;
  final bool enableCache;
  final int cacheHours;

  ApiConfig({
    required this.baseUrl,
    required this.timeout,
    required this.endpoints,
    required this.enableCache,
    required this.cacheHours,
  });

  factory ApiConfig.fromJson(Map<String, dynamic> json) {
    return ApiConfig(
      baseUrl: json['base_url'] ?? 'https://api.notestoquizai.com',
      timeout: json['timeout'] ?? 30,
      endpoints: Map<String, String>.from(json['endpoints'] ?? {}),
      enableCache: json['enable_cache'] ?? true,
      cacheHours: json['cache_hours'] ?? 3,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base_url': baseUrl,
      'timeout': timeout,
      'endpoints': endpoints,
      'enable_cache': enableCache,
      'cache_hours': cacheHours,
    };
  }
}

class FeatureFlag {
  final String name;
  final bool enabled;
  final String description;
  final Map<String, dynamic> config;

  FeatureFlag({
    required this.name,
    required this.enabled,
    required this.description,
    required this.config,
  });

  factory FeatureFlag.fromJson(Map<String, dynamic> json) {
    return FeatureFlag(
      name: json['name'] ?? '',
      enabled: json['enabled'] ?? false,
      description: json['description'] ?? '',
      config: Map<String, dynamic>.from(json['config'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'enabled': enabled,
      'description': description,
      'config': config,
    };
  }
}