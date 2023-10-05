import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

// Inicialização da instância do GeIt e criação de método de inicialização.
final GetIt getIt = GetIt.I;

@InjectableInit(preferRelativeImports: false)
void configureInjection() {
  getIt.init();
}
