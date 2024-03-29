import 'package:envied/envied.dart';

part 'app_config.g.dart';

@Envied()
abstract class AppConfig {
  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static final String supabaseAnonKey = _AppConfig.supabaseAnonKey;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _AppConfig.supabaseUrl;
}