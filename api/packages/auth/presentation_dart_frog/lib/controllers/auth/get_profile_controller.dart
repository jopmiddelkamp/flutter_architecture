import 'package:dart_frog/dart_frog.dart';
import 'package:flutter_architecture_api_shared_domain/domain.dart';
import 'package:flutter_architecture_api_shared_presentation_dart_frog/presentation.dart';

import '../../models/profile_response.dart';

class GetProfileController {
  const GetProfileController();

  Future<Response> handle(RequestContext context) async {
    final invalidMethod = await validateGetMethod(context);
    if (invalidMethod != null) {
      return invalidMethod;
    }

    final user = context.read<AuthUser>();

    return Response.json(
      body: ProfileResponse(
        id: user.id,
        emailAddress: user.emailAddress.value,
      ).toJson(),
    );
  }
}
