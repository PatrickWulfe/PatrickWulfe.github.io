import 'package:auto_size_text/auto_size_text.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_project/app/app_index.dart';

class ProfileHeader extends StatelessWidget {
  const factory ProfileHeader.desktop() = _DesktopProfileHeader;

  const factory ProfileHeader.mobile() = _MobileProfileHeader;
  const factory ProfileHeader.tablet() = _TabletProfileHeader;
  const ProfileHeader._({
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
            height: 250,
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
                      Text(
                        state.user?.name ?? '',
                        style: appTheme.textTheme.displaySmall,
                        maxLines: 1,
                      ),
                      const Gap(8),
                      Row(
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              'Username:',
                              style: appTheme.textTheme.headlineSmall,
                              maxLines: 1,
                            ),
                          ),
                          const Gap(2),
                          Flexible(
                            child: AutoSizeText(
                              state.user?.login ?? '',
                              style: appTheme.textTheme.headlineSmall?.copyWith(
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
                        hirableStyle: appTheme.textTheme.labelLarge!,
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

class _DesktopProfileHeader extends ProfileHeader {
  const _DesktopProfileHeader() : super._();
}

class _HirableWidget extends StatelessWidget {
  final bool hirable;

  final String company;
  final TextStyle hirableStyle;
  const _HirableWidget({
    super.key,
    required this.hirable,
    required this.company,
    required this.hirableStyle,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Row(
      children: [
        Text(
          'Is Hirable: ',
          style: hirableStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        if (hirable)
          Text(
            'Ready for work!',
            style: hirableStyle.copyWith(color: appTheme.colorScheme.primary),
          )
        else
          Text(
            'Currently working at $company',
            style: hirableStyle,
          )
      ],
    );
  }
}

class _MobileProfileHeader extends ProfileHeader {
  const _MobileProfileHeader() : super._();
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state.user != null) {
          final appTheme = Theme.of(context);
          return SizedBox(
            height: 120,
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
                        maxLines: 1,
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
                      const Gap(2),
                      _HirableWidget(
                        hirable: state.user?.hirable ?? true,
                        company: state.user?.company ?? '',
                        hirableStyle: appTheme.textTheme.labelLarge!,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: FilledButton.icon(
                            onPressed: () => pageLaunchUrl(
                              Uri.parse(state.user?.htmlUrl ?? ''),
                            ),
                            icon: const Icon(CommunityMaterialIcons.github),
                            label: const Text('My Github'),
                          ),
                        ),
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

class _TabletProfileHeader extends ProfileHeader {
  const _TabletProfileHeader() : super._();
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state.user != null) {
          final appTheme = Theme.of(context);
          return SizedBox(
            height: 230,
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
                      Text(
                        state.user?.name ?? '',
                        style: appTheme.textTheme.headlineLarge,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Username:',
                              style: appTheme.textTheme.headlineSmall,
                              maxLines: 1,
                            ),
                          ),
                          const Gap(2),
                          Flexible(
                            child: AutoSizeText(
                              state.user?.login ?? '',
                              style: appTheme.textTheme.headlineSmall?.copyWith(
                                color: appTheme.colorScheme.secondary,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      _HirableWidget(
                        hirable: state.user?.hirable ?? true,
                        company: state.user?.company ?? '',
                        hirableStyle: appTheme.textTheme.labelLarge!,
                      ),
                      // const Gap(16),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: FilledButton.icon(
                            onPressed: () => pageLaunchUrl(
                              Uri.parse(state.user?.htmlUrl ?? ''),
                            ),
                            icon: const Icon(CommunityMaterialIcons.github),
                            label: const Text('My Github'),
                          ),
                        ),
                      ),
                      // const Gap(4),
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
