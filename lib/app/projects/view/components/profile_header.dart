import 'package:auto_size_text/auto_size_text.dart';
import 'package:community_material_icon/community_material_icon.dart';
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      state.user?.avatarUrl ?? '',
                    ),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        state.user?.name ?? '',
                        style: appTheme.textTheme.headlineMedium,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              'Username:',
                              style: appTheme.textTheme.titleSmall,
                              maxLines: 1,
                            ),
                          ),
                          const Gap(2),
                          Flexible(
                            child: AutoSizeText(
                              state.user?.login ?? '',
                              style: appTheme.textTheme.titleSmall?.copyWith(
                                color: appTheme.colorScheme.secondary,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      _HirableWidget(
                        hirable: state.user?.hirable ?? true,
                        company: state.user?.company ?? '',
                      ),
                      // const Gap(16),
                      Expanded(child: Container()),
                      FilledButton.icon(
                        onPressed: () => pageLaunchUrl(
                          Uri.parse(state.user?.htmlUrl ?? ''),
                        ),
                        icon: const Icon(CommunityMaterialIcons.github),
                        label: const Text('My Github'),
                      ),
                      const Gap(4),
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

class _HirableWidget extends StatelessWidget {
  const _HirableWidget({
    super.key,
    required this.hirable,
    required this.company,
  });

  final bool hirable;
  final String company;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    if (hirable) {
      return Text(
        'Is Hirable: Ready for work!',
        style: appTheme.textTheme.bodySmall,
      );
    }
    return Text(
      'Is Hirable: Currently working at $company',
      style: appTheme.textTheme.bodySmall,
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
          height: 120,
        );
}
