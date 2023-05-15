import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({
    super.key,
    required this.padding,
    required this.maxWidth,
    required this.child,
  });

  const factory PageContainer.desktop({required Widget child}) =
      _DesktopPageContainer;
  const factory PageContainer.tablet({required Widget child}) =
      _TabletPageContainer;
  const factory PageContainer.mobile({required Widget child}) =
      _MobilePageContainer;

  final double padding;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      constraints: const BoxConstraints(maxWidth: 1200),
      child: child,
    );
  }
}

class _DesktopPageContainer extends PageContainer {
  const _DesktopPageContainer({required super.child})
      : super(
          padding: 64,
          maxWidth: 1200,
        );
}

class _TabletPageContainer extends PageContainer {
  const _TabletPageContainer({required super.child})
      : super(
          padding: 32,
          maxWidth: 1200,
        );
}

class _MobilePageContainer extends PageContainer {
  const _MobilePageContainer({required super.child})
      : super(
          padding: 16,
          maxWidth: 1000,
        );
}
