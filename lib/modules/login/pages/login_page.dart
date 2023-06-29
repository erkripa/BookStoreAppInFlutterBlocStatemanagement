import 'package:course_app/enums/enums.dart';
import 'package:course_app/modules/login/bloc/login_bloc.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/primary_filled_btn.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:course_app/widgets/custom/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginForm());
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
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
            Text("Login Account", style: AppStyles.style16Bold),
            Dimens.boxHeight10,
            _EmailInput(),
            Dimens.boxHeight10,
            _PasswordInput(),
            Dimens.boxHeight20,
            _LoginSubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (email) =>
              context.read<LoginBloc>().add(EmailChange(email)),
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
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (password) =>
              context.read<LoginBloc>().add(PassWordChange(password)),
          hintText: 'Enter Password',
          headingText: "Password",
          suffixIcon: AyushIconButton(
            icon: Icons.remove_red_eye_outlined,
            centerIcon: false,
            onTap: () {},
          ),
        );
      },
    );
  }
}

class _LoginSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == Status.loading
            ? const CircularProgressIndicator()
            : AyushFilledButton(
                onTap: () => context.read<LoginBloc>().add(LoginSubmitEvent()),
                label: 'Login',
                width: Dimens.screenWidth,
                height: Dimens.h40,
                padding: Dimens.defaultPadding,
                margin: Dimens.defaultPadding,
                labelColor: Theme.of(context).textTheme.titleLarge?.color,
              );
      },
    );
  }
}
