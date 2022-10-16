import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_bloc/screens/home_screen.dart';
import 'package:register_bloc/bloc/register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = BlocProvider.of<RegisterBloc>(context);
    userProvider.add(
      CheckUser(context: context),
    );
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
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (phone) {
                    if (phone != null && phone.length < 10) {
                      return 'Enter min. 10 digit';
                    } else {
                      return null; //form is valid
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterChanged) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: state.toogle,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(ChangeUser());
                            },
                            icon: Icon(state.toogle
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
                    }
                    return const Text('Coba Lagi!');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    String username = _nameController.text;
                    String email = _emailController.text;

                    if (isValidForm) {
                      userProvider.add(AddBool(newUser: false));
                      userProvider.add(AddName(username: username));
                      userProvider.add(AddEmail(email: email));
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
