import 'package:course_app/enums/enums.dart';
import 'package:course_app/modules/register/bloc/register_bloc.dart';
import 'package:course_app/modules/register/bloc/register_state.dart';
import 'package:course_app/utils/dm.dart';
import 'package:course_app/widgets/common/primary_filled_btn.dart';
import 'package:course_app/widgets/custom/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_event.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterForm());
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            Dm.boxHeight10,
            _EmailInput(),
            Dm.boxHeight10,
            _PasswordInput(),
            Dm.boxHeight10,
            _ConfirmPasswordInput(),
            Dm.boxHeight10,
            _RegisterButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context, state) {
        return CustomTextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<RegisterBloc>().add(UserNameEvent(username)),
          hintText: 'Enter Name',
          headingText: "Name",
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.userName != current.userName,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (username) =>
              context.read<RegisterBloc>().add(UserNameEvent(username)),
          hintText: 'Enter Email',
          headingText: "Email",
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<RegisterBloc>().add(PasswordEvent(password)),
          hintText: 'Enter Password',
          headingText: "Password",
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (password) =>
              context.read<RegisterBloc>().add(PasswordEvent(password)),
          hintText: 'Enter Confrim Password',
          headingText: "Confrim Password",
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.status == Status.loading
            ? const CircularProgressIndicator()
            : AyushFilledButton(
                onTap: () {
                  print(state);
                  context.read<RegisterBloc>().add(SubmitEvent());
                },
                label: 'Register',
                width: Dm.screenWidth,
                height: Dm.h40,
                padding: Dm.defaultPadding,
                margin: Dm.defaultPadding,
                labelColor: Theme.of(context).textTheme.titleLarge?.color,
              );
      },
    );
  }
}
