import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future login(enteredEmail, enteredPassword) async {
  final AuthResponse response = await supabase.auth.signInWithPassword(
            email: enteredEmail, password: enteredPassword);

        final Session? session = response.session;
        final User? user = supabase.auth.currentUser;

        print(session);
        print(user);
        
}