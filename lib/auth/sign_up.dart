import 'package:flutter/material.dart';
import '../main_screen/main_bage.dart';
import 'LoginLayerCheck.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static List<String> genders = ["male", "female"];

  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: const Color.fromRGBO(0, 112, 205, 1),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                      child: Text(
                        "     comfort care",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 1000,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "SignUp      ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Layer_check(),
                              ),
                            );
                          },
                          child: Text(
                            "Login      ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Contact us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 20, bottom: 20),
                child: Container(
                  height: 600,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Your Name",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: SizedBox(

                                      width: 380,
                                      child: TextFormField(
                                        controller: nameController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Name",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 75,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Email Address",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: SizedBox(
                                      width: 380,
                                      child: TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          // Add email validation logic here if needed
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 75,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: SizedBox(
                                      width: 380,
                                      child: TextFormField(
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          // Add password validation logic here if needed
                                          return null;
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 75,
                              child: Row(
                                children: [
                                  const SizedBox(width: 20,),
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: DropdownButtonFormField<String>(
                                      value: genders.first,
                                      onChanged: (String? value) {},
                                      items: genders.map((String gender) {
                                        return DropdownMenuItem<String>(
                                          value: gender,
                                          child: Text(gender),
                                        );
                                      }).toList(),
                                      decoration: InputDecoration(
                                        hintText: "Select gender",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: InkWell(
                          onTap: () async{
                            if (_formKey.currentState!.validate()) {
                              // Form is validated, proceed with sign up logic
                              _handleSignUp();
                       ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Sign up has been Succful',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.red,
                            ),
                            child: Text(
                              "Join",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 400,
                        child: Divider(
                          height: 1,
                          color: Colors.black,
                          thickness: .3,
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70.0, top: 10),
                          child: Row(
                            children: [
                              Text("Already Registered in ComfartCare ?"),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignUp() {
    // Implement your sign up logic here
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Example: Print values (replace with your logic)
    print("Name: $name, Email: $email, Password: $password");

    // Add your sign up functionality here (e.g., API call, Firebase auth, etc.)
  }
}
