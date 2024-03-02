import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:amazon_clone/common/widget/custom_button.dart';
import 'package:amazon_clone/common/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signinFormKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            _auth == Auth.signup
                ? Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                        key: _signupFormKey,
                        child: Column(
                          children: [
                            CustomFormField(
                              controller: _nameCtrl,
                              hinttext: "Name",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomFormField(
                              controller: _emailCtrl,
                              hinttext: "Email",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomFormField(
                              controller: _passwordCtrl,
                              hinttext: "Password",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomButton(text: "SignUp", onTap: () {})
                          ],
                        )),
                  )
                : Container(),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign-In",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
            ),
            _auth == Auth.signin
                ? Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                        key: _signinFormKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            CustomFormField(
                              controller: _emailCtrl,
                              hinttext: "Email",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomFormField(
                              controller: _passwordCtrl,
                              hinttext: "Password",
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomButton(text: "SignIn", onTap: () {})
                          ],
                        )),
                  )
                : Container(),
          ],
        ),
      )),
    );
  }
}
