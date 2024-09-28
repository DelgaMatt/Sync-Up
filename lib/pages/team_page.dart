import 'package:flutter/material.dart';
import 'package:sync_up/features/team_cards/artist_card.dart';
import 'package:sync_up/features/team_cards/data_models/team_model.dart';
import 'package:sync_up/widgets/drawer/nav_drawer.dart';
import 'package:sync_up/features/team_cards/data_models/team_data.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({required this.currentMembers, super.key});

    final List<TeamMember> currentMembers;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Meet the Team'),
        titleTextStyle:
            TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 25
              ),      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Our team is comprosed of engineers, producers, Djs, Vjs, visual artists, photographers, and other specialists who all contribute their expertise, resulting in over a century of knowledge and experience.'),
            const SizedBox(height: 10,),
            const Text('Below are the founders and core group of individuals who make Sync Up possible. Click on a member to learn more and get in touch!'),
            for (final member in currentMembers)
            Align(
            alignment: Alignment.center,
             child: Container(
              transformAlignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 25),
              height: 400, // ignore this, cos I am giving height to the container
              width: 320, // ignore this, cos I am giving width to the container
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  )
                  ],
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(member.biopic),
                  )
              ),
              alignment: Alignment.bottomCenter, // This aligns the child of the container
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0), //some spacing to the child from bottom
                  child: 
                  Image(image: AssetImage(member.logo)),
              ),
              ),
            ),  
          ]
        ),
      ),
    );
  }
}