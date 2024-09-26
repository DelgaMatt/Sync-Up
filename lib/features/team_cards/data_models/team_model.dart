import 'package:flutter/material.dart';

class TeamMembers {
  final String name;
  final String bio;
  final String instagram;
  final String soundcloud;
  final Image biopic;
  final Image logo;

  TeamMembers({
    required this.name,
    required this.bio,
    required this.instagram,
    required this.soundcloud,
    required this.biopic,
    required this.logo,
  });
}
