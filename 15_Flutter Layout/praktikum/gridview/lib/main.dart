import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = "GridView";

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: GridView.count(
                crossAxisCount: 4,
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: ChoiceCard(choice: choices[index]),
                  );
                }))));
  }
}

class Grid {
  Grid({required this.title, required this.icon});

  final String title;

  final IconData icon;
}

List<Grid> choices = [
  Grid(title: 'Pets', icon: Icons.pets),
  Grid(title: 'Pregnant Woman', icon: Icons.pregnant_woman),
  Grid(title: 'Spatial Audio Off', icon: Icons.spatial_audio_off),
  Grid(title: 'Rounded Corner', icon: Icons.rounded_corner),
  Grid(title: 'Rowing', icon: Icons.rowing),
  Grid(title: 'Timeline', icon: Icons.timeline),
  Grid(title: 'Update', icon: Icons.update),
  Grid(title: 'Clock', icon: Icons.access_time_filled),
  Grid(title: 'Hand', icon: Icons.back_hand),
  Grid(title: 'Euro', icon: Icons.euro),
  Grid(title: 'Google Translate', icon: Icons.g_translate),
  Grid(title: 'Remove Shopping Cart', icon: Icons.remove_shopping_cart),
  Grid(title: 'Restore', icon: Icons.restore_page),
  Grid(title: 'Speaker Notes Off', icon: Icons.speaker_notes_off),
  Grid(title: 'Delete', icon: Icons.delete_forever),
  Grid(title: 'Accessibility', icon: Icons.accessibility),
  Grid(title: 'Check', icon: Icons.check_circle_outline),
  Grid(title: 'Delete Outline', icon: Icons.delete_outline),
  Grid(title: 'Done', icon: Icons.done_outline),
  Grid(title: 'Maximize', icon: Icons.maximize),
  Grid(title: 'Minimize', icon: Icons.minimize),
  Grid(title: 'Offline Bolt Rounded', icon: Icons.offline_bolt_rounded),
  Grid(title: 'Swap Horizontal Circle', icon: Icons.swap_horizontal_circle),
  Grid(title: 'Accessible Forward', icon: Icons.accessible_forward),
];

class ChoiceCard extends StatelessWidget {
  ChoiceCard({Key? key, required this.choice}) : super(key: key);

  final Grid choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline4;

    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child:
                        Icon(choice.icon, size: 90.0, color: textStyle?.color)),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}
