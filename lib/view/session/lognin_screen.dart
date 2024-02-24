import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution_challenge/constants/app_color.dart';
import 'package:solution_challenge/constants/general_constants.dart';
import 'package:solution_challenge/constants/text_style.dart';
import 'package:solution_challenge/services/auth_service.dart';
import 'package:solution_challenge/view/session/signup_screen.dart';
import 'package:solution_challenge/widgets/custom_button_widget.dart';
import 'package:solution_challenge/widgets/custom_text_field.dart';

class LogInScrren extends StatefulWidget {
  const LogInScrren({super.key});

  @override
  State<LogInScrren> createState() => _LogInScrrenState();
}

class _LogInScrrenState extends State<LogInScrren> {
  final Color _loginIconColor = Colors.red;
  final double _loginScreenPaddin = screenPadding;
  final double _verticalMargin = verticalMargin;
  bool paswordState = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(
              _loginScreenPaddin,
            ),
            width: deviceWidth,
            height: deviceHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    'welcome',
                    style: GoogleFonts.roboto(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: _verticalMargin,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: CustomTextField(
                    formeData: email,
                    obscureText: false,
                    hintText: "E-Mail",
                    formIcon: Icon(
                      Icons.email_outlined,
                      size: 30,
                      color: _loginIconColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: _verticalMargin,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          formeData: password,
                          obscureText: paswordState,
                          hintText: "Passsword",
                          formIcon: Icon(
                            Icons.vpn_key_outlined,
                            size: 28,
                            color: _loginIconColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            paswordState = !paswordState;
                          });
                        },
                        icon: Icon(
                          paswordState
                              ? Icons.remove_red_eye_outlined
                              : Icons.close,
                          size: 28,
                          color: _loginIconColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // const CustomElevatedButton(),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: _verticalMargin,
                  ),
                  width: deviceWidth - (2 * _loginScreenPaddin),
                  height: 50,
                  constraints: BoxConstraints(
                    maxWidth: deviceWidth,
                  ),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      AuthService().lognIn(context, email: email.text, password: password.text);
                      
                    },
                    child: const Text(
                      'LOGN IN',
                      style: sesionBtnTextStyle,
                    ),
                  ),
                ),
                CustomButtonWidget(
                  verticalMargin: _verticalMargin,
                  btnChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Logn in with Google',
                        style: customBtnTextStyle,
                      )
                    ],
                  ),
                ),
                //sign up
                CustomButtonWidget(
                  onTap: pushSignUpScrren,
                  verticalMargin: _verticalMargin,
                  btnChild: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t have an account?'),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pushSignUpScrren() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }
}
