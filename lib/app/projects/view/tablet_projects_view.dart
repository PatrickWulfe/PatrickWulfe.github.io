import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/app/app_index.dart';

class TabletProjectsView extends StatelessWidget {
  const TabletProjectsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        final appTheme = Theme.of(context);
        if (state.user == null || (state.repositories ?? []).isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Project Tracker',
                  style: appTheme.textTheme.displayMedium,
                ),
              ),
              const Divider(),
              const ProfileHeader.tablet(),
              const Divider(),
              const Expanded(child: ListSection()),
              const SizedBox.square(dimension: 16),
            ],
          ),
        );
      },
    );
  }
}
