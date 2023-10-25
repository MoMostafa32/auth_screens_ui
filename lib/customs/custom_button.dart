import 'package:auth_ui/customs/constants.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  String title;
  void Function() onTap;

   CustomButton({
    required this.title,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: onTap,
      child: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(title,style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          )),
        ),
      )

    );
  }
}
