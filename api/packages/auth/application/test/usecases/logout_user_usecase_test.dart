import 'package:flutter_architecture_api_auth_application/application.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late LogoutUserUseCase useCase;

  setUp(() {
    authRepository = MockAuthRepository();
    useCase = LogoutUserUseCase(authRepository);
  });

  test('should call logout on the repository with correct userId', () async {
    when(() => authRepository.logout()).thenAnswer((_) async {});

    await useCase.execute();

    verify(() => authRepository.logout()).called(1);
  });
}
