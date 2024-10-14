import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/sign_up.dart';
import '../Widgets/AdminTextFormField.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
    GlobalKey<FormState> formFieldLogin = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Text(
              "Comfortcare",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            Text(
              ".com",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ],
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthMainState>(
        listener: (BuildContext context, AuthMainState state) {
          if(state is LoginSuccful)
            {
              Navigator.of(context).pushReplacementNamed("Home");

            }

        },
        builder: (context, state) {
          return ListView(
            children: [
              Form(
               key: formFieldLogin,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      width: (width < 600)
                          ? 300
                          : (width < 800)
                              ? 600
                              : 700,
                      height: (width < 600)
                          ? 600
                          : (width < 1200)
                              ? 600
                              : 600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "دخول",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            width: (width < 600)
                                ? 300
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 25),
                              Text(
                                "البريد الالكتروني",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 25),
                            ],
                          ),
                          SizedBox(height: 20),
                          AdminTextFormField(controller: emailController, validator: (String? email) {

                            if (email!.isEmpty) {
                              return "Email Musn't be Empty";
                            } else if (!email.contains("@")) {
                              return "Not Valid Email";
                            }
                            else {
                              return null;
                            }






                          },obscure: false,),
                          SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 25),
                              Text(
                                "كلمة المرور",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 25),
                            ],
                          ),
                          SizedBox(height: 20),

                          AdminTextFormField(controller: PasswordController, validator: (String? Password) {


                            if (Password!.isEmpty) {
                              return "Password Musn't be Empty";
                            } else if (Password.length < 7) {
                              return "Password Must Be More Than 7 ";
                            }
                            else {
                              return null;
                            }
                          },obscure: true,),

                          SizedBox(height: 60),
                          InkWell(
                            onTap: () {
                              final isValidForm = formFieldLogin.currentState!.validate();
                              if(isValidForm){
                                cubit.signInCubit(emailController.text,PasswordController.text,context);


                              }


                              },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.red,
                              ),
                              alignment: Alignment.center,
                              height: 50,
                              width: (width < 600)
                                  ? 250
                                  : (width < 800)
                                      ? 550
                                      : 650,
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                        (Route<dynamic> route) => false, // Predicate function to stop removing routes
                                  );
                                },
                                child: Text(
                                  "انضم الان",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue),
                                ),
                              ),
                              SizedBox(width: 20),

                              Text(
                                "مستخدم جديد ؟",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,                                  color: Colors.grey),
                              ),
                              SizedBox(width: 25),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
