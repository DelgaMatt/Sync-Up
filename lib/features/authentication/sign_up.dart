import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future signup(enteredEmail, enteredPassword, enteredUsername) async {
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
}