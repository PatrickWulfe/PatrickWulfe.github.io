part of 'about_me_page.dart';

class TabletAboutMeView extends HookWidget {
  const TabletAboutMeView({
    super.key,
    required this.aboutMe,
  });

  final String aboutMe;

  @override
  Widget build(BuildContext context) {
    final opacity = useState<double>(0);
    useEffect(
      () {
        final timer = Timer(
          .3.seconds,
          () {
            opacity.value = 1;
          },
        );

        return timer.cancel;
      },
      const [],
    );
    final appTheme = Theme.of(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return PageContainer.tablet(
          child: Column(
            children: [
              CenterLeft(
                child: AutoSizeText(
                  'About Me',
                  style: appTheme.textTheme.displayMedium,
                ),
              ),
              const Divider(),
              const Gap(32),
              Expanded(
                child: SingleChildScrollView(
                  child: AnimatedOpacity(
                    opacity: opacity.value,
                    duration: .4.seconds,
                    child: AutoSizeText(
                      aboutMe,
                      style: appTheme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
