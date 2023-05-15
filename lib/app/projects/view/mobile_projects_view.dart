import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class MobileProjectsView extends StatelessWidget {
  const MobileProjectsView({
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
        return PageContainer.mobile(
          child: Column(
            children: [
              CenterLeft(
                child: Text(
                  'Project Tracker',
                  style: appTheme.textTheme.displaySmall,
                ),
              ),
              const Divider(),
              const Gap(8),
              const ProfileHeader.mobile(),
              const Divider(),
              const Expanded(child: ListSection()),
            ],
          ),
        );
      },
    );
  }
}
