import 'package:flutter/gestures.dart';
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
            // height: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      state.user?.avatarUrl ?? '',
                    ),
                  ),
                ),
                const SizedBox.square(dimension: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: state.user?.htmlUrl,
                        style: appTheme.textTheme.labelMedium?.copyWith(
                          color: appTheme.colorScheme.secondary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => pageLaunchUrl(
                                Uri.parse(state.user?.htmlUrl ?? ''),
                              ),
                      ),
                      // onPressed: () =>
                      //     pageLaunchUrl(Uri.parse(state.user?.htmlUrl ?? '')),
                      // child: Text(state.user?.htmlUrl ?? ''),
                    ),
                    Text(
                      state.user?.name ?? '',
                      style: appTheme.textTheme.headlineMedium,
                    ),
                    Text(
                      state.user?.login ?? '',
                      style: appTheme.textTheme.titleMedium,
                    ),
                    if (state.user?.hirable ?? true)
                      Text(
                        'Ready for work!',
                        style: appTheme.textTheme.bodySmall,
                      ),
                    if (!(state.user?.hirable ?? true) &&
                        state.user?.company != null)
                      Text(
                        'Currently working at ${state.user?.company ?? ''}',
                        style: appTheme.textTheme.bodySmall,
                      ),
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
