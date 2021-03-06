import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/pages/login/login_repository.dart';
import 'package:unasp_ht/app/shared/utils/string_extensions.dart';

class SigninBloc extends BlocBase {
  final LoginRepository repo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AnimationController animationController;

  SigninBloc(this.repo) {
    emailController.addListener(validator);
    passwordController.addListener(validator);
  }

  final BehaviorSubject<bool> isValidForm = BehaviorSubject<bool>();

  void validator() => isValidForm.add(!emailController.text.isNullOrEmpty &&
      !passwordController.text.isNullOrEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text));

  Future<String> login() async {
    animationController.forward();
    return await repo.login(emailController.text, passwordController.text);
  }

  @override
  void dispose() {
    isValidForm.close();
    super.dispose();
  }
}
