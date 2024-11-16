import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:star_fashion/screens/login.dart';

import '../utils/app_color.dart';
import '../utils/text_style.dart';

class TopContainerWidget extends StatelessWidget {
  final String title;
  final String searchBarTitle;

  TopContainerWidget({
    super.key,
    required this.title,
    required this.searchBarTitle,
  });
  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyles.normalStyle.copyWith(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Container(
              height: 40.0,
              width: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.greyColor.withOpacity(0.8),
              ),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.bell, size: 20.0),
                    color: Colors.black87,
                  ),
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.orangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.greyColor.withOpacity(0.8),
              ),
              child: IconButton(
                onPressed: () => signOut(context),
                icon: const Icon(
                  Icons.logout_rounded,
                  size: 25.0,
                ),
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColor.greyColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              const Icon(FontAwesomeIcons.magnifyingGlass, size: 20.0),
              const SizedBox(width: 10),
              Text(
                searchBarTitle,
                style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
