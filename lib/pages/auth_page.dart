import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() {
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredUsername = '';
  var _enteredPassword = '';
  var _isAuthenticating = false;

  void _submit() async {
    _formKey.currentState!.save();
    // allows us the ability to add the onSaved function

    try {
      setState(() {
        _isAuthenticating = true;
      });

      if (_isLogin) {
        // final sm = ScaffoldMessenger.of(context);

        // authorization for signing in
        final AuthResponse response = await supabase.auth.signInWithPassword(
            email: _enteredEmail, password: _enteredPassword);

        final Session? session = response.session;
        final User? user = supabase.auth.currentUser;

        print(session);
        print(user);

        // sm.showSnackBar(
        //   SnackBar(content: Text('logged in: ${response.user!.email!}')),
        // );
      } else {
        // final sm = ScaffoldMessenger.of(context);

        // Authorization for sign up
        final AuthResponse response = await supabase.auth.signUp(
          email: _enteredEmail,
          password: _enteredPassword,
        );

        // sm.clearSnackBars();
        // sm.showSnackBar(
        //   SnackBar(
        //       content: Text("SignedUp/LoggedIn: ${response.user!.email!}")),
        // );

        print(response);

        // Storing User to database
        if (response.user == null) return;

        await supabase.from('profiles').insert(
            {'id': response.user!.id, 'username': _enteredUsername})
            .then((response) => print("then $response"))
            .catchError((e) => print("catch $e"));
      }
    } catch (error) {
      if (error.toString().contains('Email already taken')) {
        const SnackBar(
            content:
                Text('Email is already taken. Please choose another email'));
      } else {
        const SnackBar(content: Text('Something Went wrong..'),
        );
      }
          setState(() {
      _isAuthenticating = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 0,
                    left: 20,
                    right: 20,
                  ),
                  width: 400,
                  child: Image.asset('lib/assets/images/sync_up_logo.png'),
                ),
                Card(
                  color: Theme.of(context).colorScheme.background,
                  // shadowColor: Color.fromARGB(255, 221, 162, 13),
                  elevation: 2.0,
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // if (!_isLogin)
                            TextFormField(
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                floatingLabelStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                            if (!_isLogin)
                              TextFormField(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                enableSuggestions: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 4) {
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredUsername = value!;
                                },
                              ),
                            TextFormField(
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                floatingLabelStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                            const SizedBox(height: 12),
                            if (_isAuthenticating)
                              const CircularProgressIndicator(),
                            if (!_isAuthenticating)
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                child: Text(_isLogin ? 'Login' : 'Signup'),
                              ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin
                                  ? 'Create an Account'
                                  : 'I already have an account'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
