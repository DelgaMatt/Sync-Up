import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_up/app/config/app_config.dart';
import 'package:sync_up/app/theme/sync_up_colors.dart';
// import 'package:sync_up/app/router/sync_router.dart';
import 'package:sync_up/entities/providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppConfig.supabaseUrl,
    anonKey: AppConfig.supabaseAnonKey,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});
  static const String title = 'Sync Up';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: theme,
      // routerDelegate: syncRouter.routerDelegate,
      // routeInformationParser: syncRouter.routeInformationParser,
      // routeInformationProvider: syncRouter.routeInformationProvider,
    );
  }
}
