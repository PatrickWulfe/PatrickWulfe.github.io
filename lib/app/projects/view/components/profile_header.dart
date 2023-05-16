import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader._({
    super.key,
    required this.height,
  });

  const factory ProfileHeader.desktop() = _DesktopProfileHeader;
  const factory ProfileHeader.tablet() = _TabletProfileHeader;
  const factory ProfileHeader.mobile() = _MobileProfileHeader;

  final double height;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state.user != null) {
          final appTheme = Theme.of(context);
          return SizedBox(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        state.user?.avatarUrl ?? '',
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      ),
                      AutoSizeText(
                        state.user?.name ?? '',
                        style: appTheme.textTheme.headlineMedium,
                      ),
                      AutoSizeText(
                        state.user?.login ?? '',
                        style: appTheme.textTheme.titleMedium,
                      ),
                      const Expanded(child: SizedBox()),
                      if (state.user?.hirable ?? true)
                        AutoSizeText(
                          'Ready for work!',
                          style: appTheme.textTheme.bodySmall,
                        ),
                      if (!(state.user?.hirable ?? true) &&
                          state.user?.company != null)
                        AutoSizeText(
                          'Currently working at ${state.user?.company ?? ''}',
                          style: appTheme.textTheme.bodySmall,
                        ),
                    ],
                  ),
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

class _DesktopProfileHeader extends ProfileHeader {
  const _DesktopProfileHeader()
      : super._(
          height: 300,
        );
}

class _TabletProfileHeader extends ProfileHeader {
  const _TabletProfileHeader()
      : super._(
          height: 230,
        );
}

class _MobileProfileHeader extends ProfileHeader {
  const _MobileProfileHeader()
      : super._(
          height: 100,
        );
}
