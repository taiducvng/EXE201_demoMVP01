import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metravel_demo1/PageThree.dart';
import 'package:metravel_demo1/app_bar.dart';
import 'package:metravel_demo1/app_style.dart';
import 'package:metravel_demo1/constants/app_constants.dart';
import 'package:metravel_demo1/constants/custom_textfield.dart';
import 'package:metravel_demo1/custom_btn.dart';
import 'package:metravel_demo1/height_spacer.dart';
import 'package:metravel_demo1/login_provider.dart';
import 'package:metravel_demo1/reusable_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:metravel_demo1/bottom_bar_states.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(url as Uri, mode: LaunchMode.externalApplication)) {
      throw "Can not launch url";
    }
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              automaticallyImplyLeading: false,
              // title: Text("Login"),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(CupertinoIcons.clear),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeightSpacer(
                  size: 50,
                ),
                ReusableText(
                  text: "Sign in",
                  style: appstyle(28, Color(kDark.value), FontWeight.w400),
                ),
                HeightSpacer(
                  size: 30,
                ),
                ReusableText(
                  text: "Email address or mobile number ",
                  style: appstyle(14, Color(kDark.value), FontWeight.w400),
                ),
                HeightSpacer(
                  size: 15,
                ),
                CustomTextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email or mobile number",
                  validator: (email) {
                    if (email!.isEmpty || !email.contains("@")) {
                      return "Ẹnter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
                HeightSpacer(
                  size: 10,
                ),
                ReusableText(
                  text: "Password ",
                  style: appstyle(14, Color(kDark.value), FontWeight.w400),
                ),
                HeightSpacer(
                  size: 15,
                ),
                CustomTextField(
                  controller: password,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: loginNotifier.obscureText,
                  hintText: "Password",
                  validator: (password) {
                    if (password!.isEmpty || password.length < 8) {
                      return "Ẹnter a valid email";
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginNotifier.obscureText = !loginNotifier.obscureText;
                    },
                    child: Icon(
                      loginNotifier.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(kDark.value),
                    ),
                  ),
                ),
                HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: null,
                    child: ReusableText(
                        text: "Forgot password?",
                        style:
                            appstyle(14, Color(kDark.value), FontWeight.w400)),
                  ),
                ),
                HeightSpacer(size: 20),
                CustomButton(
                  onTap: () {
                    Get.to(
                      () => const MainScreen(),
                    );
                  },
                  text: "Login",
                ),
                HeightSpacer(size: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchURL("www.messenger.com");
                      },
                      child: ReusableText(
                        text: "Need help signing in",
                        style:
                            appstyle(14, Color(kDark.value), FontWeight.w400),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Color(kDark.value),
                    ),
                  ],
                ),
                HeightSpacer(size: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: "Data privacy center",
                      style: appstyle(14, Color(kDark.value), FontWeight.w400),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Color(kDark.value),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
