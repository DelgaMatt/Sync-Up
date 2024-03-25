import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_up/app/router/sync_router.dart';
import 'package:sync_up/features/authentication/auth_controller.dart';

final supabase = Supabase.instance.client;

class AuthCard extends ConsumerStatefulWidget {
  const AuthCard({super.key});

  @override
  ConsumerState<AuthCard> createState() {
    return AuthCardState();
  }
}

class AuthCardState extends ConsumerState<AuthCard> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var enteredEmail = '';
  var enteredUsername = '';
  var enteredPassword = '';
  var _isAuthenticating = false;

  void _submit() async {
    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });

      if (_isLogin) {
        final sm = ScaffoldMessenger.of(context); //

        await ref
            .read(authProvider.notifier)
            .login(enteredEmail, enteredPassword);

        sm.showSnackBar(
          const SnackBar(content: Text('logged in')),
        );

        if (context.mounted) {
          context.go(RoutePath.home.path);
        }
      } else {
        final sm = ScaffoldMessenger.of(context);

        await ref
            .read(authProvider.notifier)
            .signup(enteredEmail, enteredPassword, enteredUsername);

        sm.showSnackBar(
          const SnackBar(content: Text("SignedUp/LoggedIn")),
        );

        if (context.mounted) {
          context.go(RoutePath.home.path);
        }
      }
    } catch (error) {
      if (error.toString().contains('Email already taken')) {
        const SnackBar(
            content:
                Text('Email is already taken. Please choose another email'));
      } else {
        const SnackBar(
          content: Text('Something Went wrong..'),
        );
      }

      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      shadowColor: Theme.of(context).colorScheme.tertiary,
      surfaceTintColor: Theme.of(context).colorScheme.tertiary,
      elevation: 1.0,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          side: BorderSide(
              color: Theme.of(context).colorScheme.tertiary, width: 1.5)),
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
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    floatingLabelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
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
                    enteredEmail = value!;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if (!_isLogin)
                  TextFormField(
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      floatingLabelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
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
                      enteredUsername = value!;
                    },
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    floatingLabelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    enteredPassword = value!;
                  },
                ),
                const SizedBox(height: 12),
                if (_isAuthenticating)
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                if (!_isAuthenticating)
                  ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                  ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                    _isLogin
                        ? 'Create an Account'
                        : 'I already have an account',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
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
