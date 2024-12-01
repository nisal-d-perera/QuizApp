import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<Auth> {
  final _form = GlobalKey<FormState>();
  var forEmail = '';
  var forPassword = '';
  var _isLogin = true;

  void _submit() async {
    final isValidate = _form.currentState!.validate();

    if (isValidate) {
      return;
    }
    _form.currentState!.save();

    
    try {
      if (_isLogin) {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: forEmail, password: forPassword);
        print(userCredential);
      } else {
        final loginUser = await _firebase.signInWithEmailAndPassword(
            email: forEmail, password: forPassword);  
        print(loginUser);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? 'An error occurred'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Email Address'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        forEmail = newValue!;
                      },
                    ),
                    const SizedBox(height: 10), // Spacing between fields
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true, // Hides the password input
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null || value.trim().length < 8) {
                          return 'Please enter valid password';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        forPassword = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: _submit,
                        child: Text(_isLogin ? 'Sign Up' : 'Login')),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? 'Alreday have an account?'
                            : 'Dont have acccount?'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
