import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: EducationPage());

  @override
  Widget build(BuildContext context) {
    return const EducationView();
  }
}

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Card(
                      child: Text(
                        'Education:',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    const PSUTile(),
                    const SOUTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PSUTile extends StatelessWidget {
  const PSUTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Text(
                  'Portland State Univeristy',
                  style: Theme.of(context).textTheme.caption,
                ),
                const Image(
                  image: AssetImage(
                    'images/psu.jpg',
                  ),
                ),
                const Card(
                  child: Text(
                      'I got my masters here, going to add more deets laterz'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SOUTile extends StatelessWidget {
  const SOUTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Text(
                  'Southern Oregon Univeristy',
                  style: Theme.of(context).textTheme.caption,
                ),
                const Image(
                  image: AssetImage(
                    'images/sou.jpg',
                  ),
                ),
                const Card(
                  child: Text(
                      'I got my bachelors here, going to add more deets later'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
