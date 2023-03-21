import 'package:get_it/get_it.dart';

import '../services/hive_service.dart';

final getIt = GetIt.instance;

setUpProviders() {
  getIt.registerSingletonAsync<HiveService>(() async {
    final configService = HiveService();
    await configService.init();
    return configService;
  });
}
