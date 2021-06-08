import 'package:flutter/material.dart';
import 'package:portfolio_webapp/projects/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    Key? key,
    required this.info,
  }) : super(key: key);

  final ProjectTileInfo info;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 2 / 3,
      child: GestureDetector(
        onTap: _handleTap,
        child: Card(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white12,
                width: 3,
              ),
            ),
            child: Column(
              children: [
                Card(
                  color: Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        info.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          FractionallySizedBox(
                            widthFactor: 4 / 5,
                            child: Image(image: AssetImage(info.image)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              info.description,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTap() async {
    await canLaunch(info.url)
        ? await launch(info.url)
        : throw Exception('Could not launch ${info.url}');
  }
}
