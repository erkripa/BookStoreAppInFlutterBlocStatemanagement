import 'package:kahani_box/enums/enums.dart';
import 'package:kahani_box/modules/login/bloc/login_bloc.dart';
import 'package:kahani_box/routes/route_management.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/widgets/common/circular_progress_indicator.dart';
import 'package:kahani_box/widgets/common/primary_filled_btn.dart';
import 'package:kahani_box/widgets/common/primary_icon_btn.dart';
import 'package:kahani_box/widgets/common/primary_outlined_btn.dart';
import 'package:kahani_box/widgets/common/primary_text_btn.dart';
import 'package:kahani_box/widgets/custom/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBgColor,
      body: LoginForm(),
    );
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text("Login Account", style: AppStyles.style16Bold)),
              Dimens.boxHeight10,
              _EmailInput(),
              Dimens.boxHeight10,
              _PasswordInput(),
              Dimens.boxHeight10,
              _LoginSubmitButton(),
              const _DontHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DontHaveAnAccount extends StatelessWidget {
  const _DontHaveAnAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Dimens.boxHeight10,
        Center(
          child: Text(
            "You Don't have account?",
            style: AppStyles.style14Bold,
          ),
        ),
        AyushOutlinedButton(
          onTap: () => RouteManagement.goToRegisterPage(context),
          label: 'Create Account',
          padding: Dimens.defaultPadding,
          width: Dimens.screenWidth,
          margin: Dimens.defaultPadding,
        ),
      ],
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
        return Column(
          children: [
            CustomTextField(
              onChanged: (password) =>
                  context.read<LoginBloc>().add(PassWordChange(password)),
              hintText: 'Enter Password',
              headingText: "Password",
              suffixIcon: AyushIconButton(
                icon: Icons.remove_red_eye_outlined,
                onTap: () {},
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AyushTextButton(
                label: "Forgot Password",
                onTap: () {},
                margin: Dimens.onlyRight8,
                padding: Dimens.edgeA4,
              ),
            )
          ],
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
            ? const AyushCircularProgressIndicator()
            : AyushFilledButton(
                onTap: () => context.read<LoginBloc>().add(LoginSubmitEvent()),
                label: 'Login Account',
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
