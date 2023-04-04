import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_domain/dependency_injection.dart';
import 'package:shared_domain/src/dependency_injection/get_it_dependency_injection_container.dart';
import 'package:shared_domain/storage.dart';

Future<void> setupDependencyInjection() async {
  if (Di.isInitialized) {
    return;
  }
  Di.instance = GetItDependencyInjectionContainer();
}

Future<void> bootstrap() async {
  HydratedBloc.storage = Di.instance.get<StorageManager>();
}
