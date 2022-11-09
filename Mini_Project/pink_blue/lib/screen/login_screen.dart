import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:pink_blue/home.dart';
import 'package:pink_blue/providers/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LoginViewModel>(context, listen: false);
    userProvider.checkLogin(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Image(
                  image: AssetImage('assets/image/logo.png'),
                  height: 250,
                  width: 250,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value != null && value.length < 4) {
                      return 'Enter at least 4 characters';
                    } else {
                      return null; //form is valid
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (email) {
                    // 5 install package email_validator
                    if (email != null && !EmailValidator.validate(email)) {
                      return 'Enter a valid email';
                    } else {
                      return null; //form is valid
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<LoginViewModel>(
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: value.toogle,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.toogleTheme();
                          },
                          icon: Icon(value.toogle
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelText: 'Password',
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.3)),
                        border: OutlineInputBorder(),
                      ),
                      validator: (password) {
                        if (password != null && password.length < 5) {
                          return 'Enter min. 5 characters';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    String username = _nameController.text;
                    String email = _emailController.text;
                    if (isValidForm) {
                      userProvider.addBool(false);
                      userProvider.setName(username);
                      userProvider.setEmail(email);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                        (route) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Hallo! Selamat Datang'),
                          backgroundColor: Color.fromARGB(255, 233, 136, 168),
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 233, 136, 168),
                    minimumSize: Size(240.0, 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 14.0,
                    ),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
