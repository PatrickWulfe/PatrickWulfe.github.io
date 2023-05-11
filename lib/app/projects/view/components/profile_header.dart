import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_project/app/app_index.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state.user != null) {
          final appTheme = Theme.of(context);
          return SizedBox(
            height: 300,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    state.user?.avatarUrl ?? '',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () =>
                          pageLaunchUrl(Uri.parse(state.user?.htmlUrl ?? '')),
                      child: Text(state.user?.htmlUrl ?? ''),
                    ),
                    Text(
                      state.user?.name ?? '',
                      style: appTheme.textTheme.headlineMedium,
                    ),
                    Text(
                      state.user?.login ?? '',
                      style: appTheme.textTheme.headlineSmall,
                    ),
                    if (state.user?.hirable ?? true)
                      const Text('Ready for work!'),
                    if (!(state.user?.hirable ?? true) &&
                        state.user?.company != null)
                      Text('Currently working at ${state.user?.company ?? ''}'),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
