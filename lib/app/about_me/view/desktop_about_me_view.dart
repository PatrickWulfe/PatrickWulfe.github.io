part of 'about_me_page.dart';

class DesktopAboutMeView extends HookWidget {
  const DesktopAboutMeView({
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
        return Container(
          margin: const EdgeInsets.all(64),
          child: Column(
            children: [
              CenterLeft(
                child: Text(
                  'About Me',
                  style: appTheme.textTheme.displayMedium,
                ),
              ),
              const Divider(),
              const Gap(32),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    aboutMe,
                    style: appTheme.textTheme.bodyLarge,
                  ).animate().fadeIn(
                        delay: .2.seconds,
                        duration: .3.seconds,
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
