import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_webapp/projects/projects.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(
        child: ProjectsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const ProjectsView();
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 3 / 4,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'How I Keep Myself Busy:',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Card(
                      color: Theme.of(context).backgroundColor.withAlpha(10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.black12,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Current Projects',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CarouselSlider(
                            items: getProjectTiles(),
                            options: CarouselOptions(
                              aspectRatio: 4 / 3,
                              height: 700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ProjectTile> getProjectTiles() {
    return const [
      ProjectTile(
          title: 'PatrickWulfe.github.io',
          description: 'This webapp you are exploring right now!',
          url:
              'https://github.com/PatrickWulfe/PatrickWulfe.github.io/tree/master'),
      ProjectTile(
          title: 'mumen_finder',
          description:
              'An app meant to help users find what streaming services are'
              'hosting various anime from their "anime list" from MyAnimeList.',
          url: 'https://github.com/PatrickWulfe/mumen_finder'),
      ProjectTile(
        title: 'music_toolbox',
        description: 'Literally just a concept at this point.  Going to '
            'essenitally be a swiss army knife for musicians.  Will have a '
            'tuner, drum machine, sampler, recorder, basic synth, chord chart, '
            'music calculator, etc. all in one convenient app.',
        url: '',
      )
    ];
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.cyan.shade500,
            Colors.cyan.shade300,
          ],
        ),
      ),
    );
  }
}
