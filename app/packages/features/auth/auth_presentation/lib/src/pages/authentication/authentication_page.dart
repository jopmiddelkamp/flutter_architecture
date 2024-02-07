import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_presentation/widgets.dart';

import 'bloc/authentication_bloc.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherBuilder(builder: (context) {
      final authenticating = context.select<AuthenticationCubit, bool>(
        (bloc) => bloc.state.authenticating,
      );
      if (authenticating) {
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 4),
              Text('Logging in, please wait...'),
            ],
          ),
        );
      }
      final usernameTextController = useTextEditingController();
      final passwordTextController = useTextEditingController();
      final obscureText = useState(true);
      return Column(
        children: [
          TextField(
            controller: usernameTextController,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
          ),
          TextField(
            controller: passwordTextController,
            obscureText: obscureText.value,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: obscureText.value,
                onChanged: (value) {
                  obscureText.value = value!;
                },
              ),
              const Text('Show Password'),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationCubit>().logIn(
                    username: usernameTextController.text,
                    password: passwordTextController.text,
                  );
            },
            child: const Text('Log In'),
          ),
        ],
      );
    });
  }
}
