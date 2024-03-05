import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:sync_up/app/router/sync_router.dart";


final goRouterProvider = Provider<GoRouter>((ref) { 
  return syncRouter;
  },
);

