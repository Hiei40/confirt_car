import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/login_screen.dart';
import '../../../utils/contrrolers.dart';
import '../Widgets/AdminTextFormField.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController1 = TextEditingController();
    TextEditingController passwordController2 = TextEditingController();
    GlobalKey<FormState> formFieldLogin = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Text(
              "Comfortcare",
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            Text(
              ".com",
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ],
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthMainState>(
        listener: (BuildContext context, AuthMainState state) {
          if (state is SignInStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.Error)),
            );
          } else if (state is SignUpState) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formFieldLogin,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      width: (width < 600) ? 400 : (width < 800) ? 600 : 700,
                      height: (width < 600) ? 600 : (width < 1200) ? 670 : 700,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "الانضمام الان",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            width: (width < 600)
                                ? 400
                                : (width < 800)
                                ? 600
                                : 700,
                            height: (width < 600)
                                ? 30
                                : (width < 1200)
                                ? 40
                                : 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          _buildTextField("الاسم", nameController),
                          SizedBox(height: 20),
                          _buildTextField("البريد الألكتروني", emailController, email: true),
                          SizedBox(height: 10),
                          _buildTextField("كلمه المرور", passwordController1, obscure: true),
                          SizedBox(height: 10),
                          _buildTextField("تاكيد كلمه المرور", passwordController2, obscure: true),
                          SizedBox(height: 20),
                          _buildSignUpButton(context, cubit, emailController, passwordController1, passwordController2, nameController, formFieldLogin),
                          SizedBox(height: 30),
                          _buildLoginRow(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool email = false, bool obscure = false}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 25),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),
            ),
            SizedBox(width: 25),
          ],
        ),
        SizedBox(height: 10),
        AdminTextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "$label Musn't be Empty";
            } else if (email && !value.contains("@")) {
              return "Not a Valid Email";
            } else if (obscure && value.length < 7) {
              return "Password Must Be More Than 7";
            }
            return null;
          },
          obscure: obscure,
        ),
      ],
    );
  }

  Widget _buildSignUpButton(
      BuildContext context,
      AuthCubit cubit,
      TextEditingController emailController,
      TextEditingController passwordController1,
      TextEditingController passwordController2,
      TextEditingController nameController,
      GlobalKey<FormState> formFieldLogin,
      ) {
    return InkWell(
      onTap: () {
        final isValidForm = formFieldLogin.currentState!.validate();
        if (isValidForm) {
          cubit.signUpCubit(emailController.text, passwordController1.text, nameController.text);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.red,
        ),
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width < 600 ? 250 : 550,
        child: Text(
          "تسجيل الحساب",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLoginRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 30),
        InkWell(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
            );
          },
          child: Text(
            "تسجيل الدخول",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.blue),
          ),
        ),
        SizedBox(width: 20),
        Text(
          "ComfortCare  ",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
        ),
        Text(
          "مسجل بالفعل في",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.grey),
        ),
        SizedBox(width: 25),
      ],
    );
  }
}