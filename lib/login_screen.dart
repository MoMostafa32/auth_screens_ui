import 'package:auth_ui/customs/constants.dart';
import 'package:auth_ui/customs/custom_button.dart';
import 'package:auth_ui/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customs/custom_scaffold.dart';
import 'customs/custom_text_field.dart';
import 'customs/reusable_widgets.dart';
import 'customs/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Log In',
                style: TextStyle(
                    fontSize: 35,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                  style: TextStyle(fontSize: 15, color: kWhiteColor),
                  children: <TextSpan>[
                    TextSpan(text: 'Login with your'),
                    TextSpan(
                        text: ' CuoreZen',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' account')
                  ]),
            ),
            const SizedBox(height: 20),
            const Text("Email",
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            CustomTextField(
              controller: emailController,
              hintText: "Email",
              onChange: (v) {
                setState(() {
                  if (Validations.emailValidationWidthDomain(
                      emailController.text)) {
                    isEmailValid = true;
                  } else {
                    isEmailValid = false;
                  }
                });
              },
              suffix: verificationWidget(
                  color: isEmailValid ? kGreenColor : kGreyColor),
              isValid: isEmailValid,
            ),
            const SizedBox(height: 20),
            const Text("Password",
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: obscureText,
                onChange: (v) {
                  setState(() {
                    if (Validations.commonValidation(passwordController.text)) {
                      isPasswordValid = true;
                    } else {
                      isPasswordValid = false;
                    }
                  });
                },
                suffix: CupertinoButton(
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText
                        ? const Icon(Icons.visibility_off_outlined,
                            color: kWhiteColor)
                        : const Icon(Icons.visibility_outlined,
                            color: kWhiteColor)),
                isValid: isPasswordValid),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget Password?',
                style: TextStyle(
                    fontSize: 16,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
                title: 'Log in',
                onTap: () => {}),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Or connect with',
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            socialWidget(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 20,
                    color: kWhiteColor,
                  ),
                ),
                const SizedBox(width: 10),
                CupertinoButton(
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 20,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
