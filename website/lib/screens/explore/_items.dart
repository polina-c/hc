abstract class _SharedLinks {
  static const miraAndGosha = 'https://www.youtube.com/@miragosha';
}

final items = [
  ExploreItem(
    title: 'Mira and Gosha',
    description: 'Animations by psychologists',
    image: 'images/explore/mira_gosha.png',
    link: _SharedLinks.miraAndGosha,
    iosLink: _SharedLinks.miraAndGosha,
  ),
  ExploreItem(
    title: 'Daniel Tiger' 's Feelings',
    description: 'Play with Daniel Tiger and explore feelings',
    image: 'images/explore/daniel.webp',
    iosLink:
        'https://apps.apple.com/us/app/daniel-tigers-grr-ific-feelings/id899193797',
    link:
        'https://play.google.com/store/apps/details?id=org.pbskids.dtgrrificfeelings',
  ),
  ExploreItem(
    title: 'Breathe, Think, Do with Sesame',
    description: 'Sesame monster is trying to calm down',
    image: 'images/explore/sesame.webp',
    iosLink:
        'https://apps.apple.com/us/app/breathe-think-do-with-sesame/id721853597',
    link:
        'https://play.google.com/store/apps/details?id=air.com.sesameworkshop.ResilienceThinkBreathDo',
  ),
  ExploreItem(
    title: 'Feeling Arrow',
    description: 'Control people with arrows of feelings',
    image: 'images/explore/feeling_arrow.webp',
    iosLink: 'https://apps.apple.com/us/app/feeling-arrow/id1628597068',
    link:
        'https://play.google.com/store/apps/details?id=com.YsoCorp.Feelingarrow',
  ),
  ExploreItem(
    title: 'Zoo Academy',
    description: 'Social Emotional Game for K-1 Students',
    image: 'images/explore/zoo.png',
    iosLink: 'https://www.centervention.com/zoo-academy/',
    link: 'https://www.centervention.com/zoo-academy/',
  ),
  ExploreItem(
    title: 'How We Feel',
    description: 'An emotional wellbeing journal',
    image: 'images/explore/how_we_feel.webp',
    iosLink: 'https://apps.apple.com/us/app/how-we-feel/id1562706384',
    link:
        'https://play.google.com/store/apps/details?id=org.howwefeel.moodmeter',
  ),
  ExploreItem(
    title: 'Pluck It',
    description: 'A weird game about emotions',
    image: 'images/explore/pluck_it.webp',
    iosLink:
        'https://apps.apple.com/us/app/pluck-it-hairs-and-emotions/id1377729521',
    link:
        'https://play.google.com/store/apps/details?id=com.feelinggame.pluckit',
  ),
  ExploreItem(
    title: 'Messenger Kids',
    description: 'Messaging controlled by parents',
    image: 'images/explore/messenger.webp',
    iosLink: 'https://apps.apple.com/us/app/messenger-kids/id1285713171',
    link: 'https://play.google.com/store/apps/details?id=com.facebook.talk',
  ),
  ExploreItem(
    title: 'IntroDUCKtion',
    description: 'IntroDUCKtion to big feelings',
    image: 'images/explore/introducktion.webp',
    iosLink:
        'https://apps.apple.com/us/app/introducktion-to-big-feelings/id553721733',
    link: 'https://play.google.com/store/apps/details?id=com.introDucktion',
  ),
  ExploreItem(
    title: 'Peppy Pals',
    description: 'Game to explore emotions',
    image: 'images/explore/peppy_pals.webp',
    iosLink: 'https://apps.apple.com/us/app/peppy-pals/id1457065641',
    link:
        'https://play.google.com/store/apps/details?id=com.peppypals.socialskills',
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
