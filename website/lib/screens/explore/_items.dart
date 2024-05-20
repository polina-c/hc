abstract class _SharedLinks {
  static const miraAndGosha = 'https://www.youtube.com/@miragosha';
}

final items = [
  ExploreItem(
    title: 'Mira and Gosha',
    description: 'Short animations, created by psychologists.'
        '\nIn Russian, with translation.',
    image: 'images/explore/mira_gosha.png',
    link: _SharedLinks.miraAndGosha,
    iosLink: _SharedLinks.miraAndGosha,
  ),
  ExploreItem(
    title: 'How We Feel',
    description: 'An emotional wellbeing journal.',
    image: 'images/explore/how_we_feel.webp',
    iosLink: 'https://apps.apple.com/us/app/how-we-feel/id1562706384',
    link:
        'https://play.google.com/store/apps/details?id=org.howwefeel.moodmeter',
  ),
];

class ExploreItem {
  const ExploreItem({
    required this.title,
    required this.description,
    required this.image,
    required this.link,
    required this.iosLink,
  });

  final String title;
  final String description;
  final String image;
  final String link;
  final String iosLink;
}
