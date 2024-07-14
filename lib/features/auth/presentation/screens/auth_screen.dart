
import 'package:flutter/material.dart';
import 'package:untitled1/features/auth/presentation/widgets/login_body.dart';

import '../../../../core/constants/dimensions.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
              padding:  EdgeInsets.fromLTRB(Dimensions.screenHeight * 0.03,Dimensions.screenHeight * 0.1,Dimensions.screenHeight * 0.03,0),
              child: LoginBody(),
            )));
  }
}
