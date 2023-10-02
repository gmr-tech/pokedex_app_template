import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

// Inicialização da instância do GeIt e criação de método de inicialização.
/// [getIt] is the GetIt instanc
final GetIt getIt = GetIt.I;

@InjectableInit(preferRelativeImports: false)

/// [configureInjection] it the GetIt configuration
void configureInjection() {
  getIt.init();
}
