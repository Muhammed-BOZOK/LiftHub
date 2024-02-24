import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solution_challenge/constants/app_color.dart';
import 'package:solution_challenge/constants/general_constants.dart';
import 'package:solution_challenge/constants/text_style.dart';
import 'package:solution_challenge/services/auth_service.dart';
import 'package:solution_challenge/widgets/custom_button_widget.dart';
import 'package:solution_challenge/widgets/custom_elevatedbutton_widget.dart';
import 'package:solution_challenge/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final double _verticalMargin = verticalMargin;
  final Color _loginIconColor = Colors.red;

  TextEditingController nameData = TextEditingController();
  TextEditingController surnameData = TextEditingController();
  TextEditingController emailData = TextEditingController();
  TextEditingController passwordData = TextEditingController();

  bool paswordState = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.roboto(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              FormThemeWidget(
                verticalMargin: _verticalMargin,
                fromData: nameData,
                loginIconColor: _loginIconColor,
                child: CustomTextField(
                  formeData: nameData,
                  obscureText: false,
                  hintText: "Name",
                  formIcon: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: _loginIconColor,
                  ),
                ),
              ),
              FormThemeWidget(
                verticalMargin: _verticalMargin,
                fromData: surnameData,
                loginIconColor: _loginIconColor,
                child: CustomTextField(
                  formeData: surnameData,
                  obscureText: false,
                  hintText: "Surame",
                  formIcon: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: _loginIconColor,
                  ),
                ),
              ),
              FormThemeWidget(
                verticalMargin: _verticalMargin,
                fromData: emailData,
                loginIconColor: _loginIconColor,
                child: CustomTextField(
                  formeData: emailData,
                  obscureText: false,
                  hintText: "E-Mail",
                  formIcon: Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: _loginIconColor,
                  ),
                ),
              ),
              FormThemeWidget(
                verticalMargin: _verticalMargin,
                fromData: passwordData,
                loginIconColor: _loginIconColor,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        formeData: passwordData,
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
              CustomElevatedButton(
                onTop: () {
                  AuthService().signUp(
                    name: nameData.text,
                    surname: surnameData.text,
                    email: emailData.text,
                    password: passwordData.text,
                  );
                  Navigator.pop(context);
                },
                btnTitle: 'SİGN UP',
                btnHeight: 50,
                btnColor: btnBlueColor,
                btnTextStyle: sesionBtnTextStyle,
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class FormThemeWidget extends StatelessWidget {
  const FormThemeWidget({
    super.key,
    required double verticalMargin,
    required this.fromData,
    required Color loginIconColor,
    required this.child,
  }) : _verticalMargin = verticalMargin;

  final double _verticalMargin;
  final TextEditingController fromData;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: _verticalMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
