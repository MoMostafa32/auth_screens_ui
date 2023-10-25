import 'package:auth_ui/customs/constants.dart';
import 'package:auth_ui/customs/custom_button.dart';
import 'package:auth_ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/girl.jpg'), fit: BoxFit.cover)),
        child: body(context),
      ),
    );
  }

  Widget body(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Spacer(),
          const Text('Welcome',
              style: TextStyle(
                  fontSize: 40,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold)),
          const Text('to',
              style: TextStyle(
                  fontSize: 40,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold)),
          Text('QuoreZen',
              style: GoogleFonts.redressed(
                  fontSize: 50,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          const SizedBox(height: 20),
          CustomButton(title: 'Getting Started', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          }),
          const SizedBox(height: 20),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontSize: 20,
                  color: kWhiteColor,
                ),
              ),
              const SizedBox(width: 10),

              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
