import 'package:doculex_ai/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../widgets/buttons/rounded_text_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/landing.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: size.width * 0.333,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [cardColor, cardColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Full Name',
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(
                        color: grey500Color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Email Address',
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email address',
                      hintStyle: TextStyle(
                        color: grey500Color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Password',
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: grey500Color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Password Confirmation',
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm your password',
                      hintStyle: TextStyle(
                        color: grey500Color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedTextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-up');
                        },
                        label: 'Create my account',
                        withGradient: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkResponse(
                        onTap: () {},
                        child: const Text(
                          'I already have an account',
                          style: TextStyle(color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ).padding(horizontal: 24),
            ),
          ),
        ),
      ),
    );
  }
}
