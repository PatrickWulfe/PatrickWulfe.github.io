import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ListSection extends HookWidget {
  const ListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProjectsBloc>();
    final _controller = useScrollController();
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return BlocBuilder<ProjectsBloc, ProjectsState>(
          builder: (context, state) {
            final appTheme = Theme.of(context);
            final dropdownItems = RepoSort.values
                .map<DropdownMenuItem<RepoSort>>(
                  (e) => DropdownMenuItem<RepoSort>(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList();
            return Material(
              color: const Color(0x00000000),
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Container(
                    color: const Color(0x00000000),
                    constraints: const BoxConstraints(maxHeight: 48),
                    child: Row(
                      children: [
                        const Gap(16),
                        Text(
                          'Sort By: ',
                          style: appTheme.textTheme.labelLarge,
                        ),
                        const Gap(16),
                        DropdownButton<RepoSort>(
                          value: state.sort,
                          items: dropdownItems,
                          onChanged: (sort) {
                            bloc.add(ProjectsEvent.sortChanged(sort: sort!));
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FadingEdgeScrollView.fromSingleChildScrollView(
                      child: SingleChildScrollView(
                        controller: _controller,
                        child: Column(
                          children: AnimateList(
                            autoPlay: true,
                            interval: .1.seconds,
                            effects: [
                              FadeEffect(
                                duration: .2.seconds,
                              )
                            ],
                            children: [
                              if (state.repositories != null &&
                                  state.repositories!.isNotEmpty)
                                ...state.repositories!.map(
                                  (e) => ProjectTile(
                                    title: e.name,
                                    subtitle: e.description,
                                    onTap: () => _launchUrl(
                                      Uri.parse(e.htmlUrl),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.separated(
                  //     itemCount: (state.repositories ?? []).length,
                  //     separatorBuilder: (_, __) =>
                  //         const SizedBox.square(dimension: 2),
                  //     itemBuilder: (BuildContext context, int index) {
                  //       final element = state.repositories![index];
                  //       return ProjectTile(
                  //         title: element.name,
                  //         subtitle: element.description,
                  //         onTap: () => _launchUrl(
                  //           Uri.parse(state.repositories![index].htmlUrl),
                  //         ),
                  //       ).animate().fade(
                  //             delay: (.2 * index).seconds,
                  //           );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    // throw Exception('Could not launch $url');
  }
}
