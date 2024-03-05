import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future signOut() async {
  await supabase.auth.signOut()
      .then((response) => print("success"))
      .catchError((e) => print("catch $e"));
}