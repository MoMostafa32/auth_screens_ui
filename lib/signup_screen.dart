import 'package:auth_ui/customs/constants.dart';
import 'package:auth_ui/customs/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customs/custom_scaffold.dart';
import 'customs/custom_text_field.dart';
import 'customs/reusable_widgets.dart';
import 'customs/validations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool obscureText = true;
  bool isEmailValid = false;
  bool isNameValid = false;
  bool isPasswordValid = false;

  TextEditingController nameController = TextEditingController();
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
              height: 15,
            ),
            const Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                    fontSize: 35,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                  style: TextStyle(fontSize: 15, color: kWhiteColor),
                  children: <TextSpan>[
                    TextSpan(text: 'Please,fill the details to create an '),
                    TextSpan(
                        text: 'CuoreZen',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' account')
                  ]),
            ),
            const SizedBox(height: 15),
            const Text("Full name",
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              hintText: "Full name",
              onChange: (v){
                setState(() {
                  if(Validations.commonValidation(nameController.text)){
                    isNameValid = true;
                  }else{
                    isNameValid = false;
                  }
                });
              },
              suffix: verificationWidget(
                  color: isNameValid ? kGreenColor : kGreyColor
              ),
              isValid:isNameValid,
            ),
            const SizedBox(height: 10),
            const Text("Email",
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              hintText: "Email",
              onChange: (v){
                setState(() {
                  if(Validations.emailValidationWidthDomain(emailController.text)){
                    isEmailValid = true;
                  }else{
                    isEmailValid = false;
                  }
                });
              },
              suffix: verificationWidget(
                  color: isEmailValid ? kGreenColor : kGreyColor
              ),
              isValid:isEmailValid,
            ),
            const SizedBox(height: 10),
            const Text("Password",
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: obscureText,
                onChange: (v){
                  setState(() {
                    if(Validations.commonValidation(passwordController.text)){
                      isPasswordValid = true;
                    }else{
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
                isValid:isPasswordValid
            ),
            const SizedBox(height: 10),
            const Text(
              'Password must be at least 6 characters',
              style: TextStyle(
                  fontSize: 16,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            CustomButton(title: 'Sign up', onTap: () => {
              Navigator.of(context).pop(),
            }),
            const SizedBox(height: 15),

            const Center(
              child: Text(
                'Or connect with',
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            socialWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
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
                   Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Log in',
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
