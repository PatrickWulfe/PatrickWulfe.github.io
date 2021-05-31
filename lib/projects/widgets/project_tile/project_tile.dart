import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile(
      {Key? key,
      required this.title,
      required this.description,
      required this.url})
      : super(key: key);

  final String title;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Card(
        color: Colors.white10,
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
                color: Colors.black12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Image(image: AssetImage('images/nyan.gif')),
                            Text(
                              'Nyan cat as a placeholder until I figure out what I want here',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description,
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
    );
  }

  void _handleTap() async {
    await canLaunch(url)
        ? await launch(url)
        : throw Exception('Could not launch $url');
  }
}
