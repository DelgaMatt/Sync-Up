import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AuthController extends AsyncNotifier<Session?> {
//  session is the state of the async notifier

  @override
  FutureOr<Session?> build() {
    return null;
  }

  Future<void> login(enteredEmail, enteredPassword) async {
    final AuthResponse response = await supabase.auth
        .signInWithPassword(email: enteredEmail, password: enteredPassword);

    final Session? session = response.session;
    final User? user = supabase.auth.currentUser;

    print(session);
    print(user);

    await update((previousState) => session);
    //overriding the previous state to the new session if it exists
    // update is built into the AsyncNotifier - allowing you to update the state
  }

  Future<void> signup(enteredEmail, enteredPassword, enteredUsername) async {
    final AuthResponse response = await supabase.auth.signUp(
      email: enteredEmail,
      password: enteredPassword,
    );

    final Session? session = response.session;
    final User? user = supabase.auth.currentUser;

    print(session);
    print(user);

    if (response.user == null) return;

    await supabase
        .from('profiles')
        .insert({'id': response.user!.id, 'username': enteredUsername})
        .then((response) => print("then $response"))
        .catchError((e) => print("catch $e"));

    await update((previousState) => session);
  }

  Future<void> signOut() async {
    await supabase.auth
        .signOut()
        .then((response) => print("success"))
        .catchError((e) => print("catch $e"));

    await update((previousState) => null);
  }
}

// '<>' used for types and type casting,
final authProvider = AsyncNotifierProvider<AuthController, Session?>(
  AuthController.new
  // running the default and passing along the reference object
  // called a "tear-off constructor", essentially a shortcut
);
