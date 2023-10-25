import 'package:auth_ui/customs/constants.dart';
import 'package:flutter/cupertino.dart';

Widget verificationWidget({required Color color}){
  return Padding(
    padding: const EdgeInsets.only(top: 10.0,bottom: 10,right: 20),
    child: Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: SizedBox(
          height: 15,
          child: Image.asset('images/icons/check.png'),
        ),
      ),
    ),
  );
}

Widget socialContainer({required String image}){
  return CupertinoButton(
    minSize: 0,
    padding: EdgeInsets.zero,
    onPressed: (){},
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Center(
        child: SizedBox(
          height: 30,
          child: Image.asset(image),
        ),
      ),
    ),
  );
}


Widget socialWidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      socialContainer(image: 'images/icons/google.png'),
      const SizedBox(width: 70),
      socialContainer(image: 'images/icons/apple.png'),
      const SizedBox(width: 70),
      socialContainer(image: 'images/icons/facebook.png'),
    ],
  );
}

