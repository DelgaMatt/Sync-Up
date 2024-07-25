// import 'dart:async';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// final supabase = Supabase.instance.client;

// class EventController {
  
//   Future<List<dynamic>> getEvent(String table) async {
//     final response = await supabase
//         .from('events')
//         .select('event_name, event_date, location, artists, created_at');

//     print(response);
//     return response;
//   }
  // final eventProvider =
  //     AsyncNotifierProvider<EventController, Array?>(EventController.new);
// }
