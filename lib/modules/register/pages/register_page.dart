import 'package:course_app/enums/enums.dart';
import 'package:course_app/modules/register/bloc/register_bloc.dart';
import 'package:course_app/modules/register/bloc/register_state.dart';
import 'package:course_app/routes/route_management.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/circular_progress_indicator.dart';
import 'package:course_app/widgets/common/primary_filled_btn.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:course_app/widgets/common/primary_outlined_btn.dart';
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
            Text("Create Account", style: AppStyles.style16Bold),
            Dimens.boxHeight40,
            _UsernameInput(),
            Dimens.boxHeight10,
            _EmailInput(),
            Dimens.boxHeight10,
            _PasswordInput(),
            Dimens.boxHeight10,
            _ConfirmPasswordInput(),
            Dimens.boxHeight20,
            _RegisterButton(),
            AyushOutlinedButton(
              onTap: () => RouteManagement.goToLoginPage(context),
              label: "Login Account",
              padding: Dimens.defaultPadding,
              width: Dimens.screenWidth,
              margin: Dimens.defaultPadding,
            ),
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
          onChanged: (password) =>
              context.read<RegisterBloc>().add(PasswordEvent(password)),
          hintText: 'Enter Password',
          headingText: "Password",
          suffixIcon: AyushIconButton(
            icon: Icons.remove_red_eye_outlined,
            onTap: () {},
          ),
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
          suffixIcon: AyushIconButton(
            icon: Icons.remove_red_eye_outlined,
            onTap: () {},
          ),
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
            ? const AyushCircularProgressIndicator()
            : AyushFilledButton(
                onTap: () => context.read<RegisterBloc>().add(SubmitEvent()),
                label: 'Create Account',
                width: Dimens.screenWidth,
                padding: Dimens.defaultPadding,
                margin: Dimens.defaultPadding,
                labelColor: Theme.of(context).textTheme.titleLarge?.color,
              );
      },
    );
  }
}
