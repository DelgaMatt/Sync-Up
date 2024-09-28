// import 'package:flutter/material.dart';
// import 'package:sync_up/features/team_cards/data_models/team_model.dart';
// import 'package:sync_up/features/team_cards/data_models/team_data.dart';

// class ArtistCard extends StatefulWidget {
//   const ArtistCard({required this.teamMembers, super.key});

//   final List<TeamMembers> teamMembers;

//   @override
//   State<ArtistCard> createState() => _ArtistCardState();
// }

// class _ArtistCardState extends State<ArtistCard> {
//   // @override
//   // void initState() {
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext, context) {
//     return Container(
//               height: MediaQuery.of(context).size.height * 0.3, // ignore this, cos I am giving height to the container
//               width: MediaQuery.of(context).size.width * 0.5, // ignore this, cos I am giving width to the container
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: teamMe,
//                   )
//               ),
//               alignment: Alignment.bottomCenter, // This aligns the child of the container
//               child: const Padding(
//                   padding: EdgeInsets.only(bottom: 10.0), //some spacing to the child from bottom
//                   child: Text('Hello', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
//    )
// );
//   }
// }
