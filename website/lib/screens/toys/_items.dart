enum ToyTypes {
  movie,
  game,
  tool,
  ;

  String get name {
    switch (this) {
      case ToyTypes.game:
        return 'Games';
      case ToyTypes.tool:
        return 'Tools';
      case ToyTypes.movie:
        return 'Movies';
    }
  }
}

final items = [
  const Toy(
    title: 'Mira and Gosha',
    description: 'Short animations by psychologists',
    image: 'images/toys/mira_gosha.png',
    link: 'https://www.youtube.com/@miragosha',
    iosLink: 'https://www.youtube.com/@miragosha',
    type: ToyTypes.movie,
  ),
  const Toy(
    title: 'Sesame Street',
    description: 'Short animations targeting emotional development',
    image: 'images/toys/sesame_movie.png',
    link:
        'https://www.sesamestreet.org/parents/learning-areas/emotional-development',
    iosLink:
        'https://www.sesamestreet.org/parents/learning-areas/emotional-development',
    type: ToyTypes.movie,
  ),
  const Toy(
    title: 'Daniel Tiger' 's Feelings',
    description: 'Play with Daniel Tiger and toys feelings',
    image: 'images/toys/daniel.webp',
    iosLink:
        'https://apps.apple.com/us/app/daniel-tigers-grr-ific-feelings/id899193797',
    link:
        'https://play.google.com/store/apps/details?id=org.pbskids.dtgrrificfeelings',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'Breathe, Think, Do with Sesame',
    description: 'Sesame monster is trying to calm down',
    image: 'images/toys/sesame_game.webp',
    iosLink:
        'https://apps.apple.com/us/app/breathe-think-do-with-sesame/id721853597',
    link:
        'https://play.google.com/store/apps/details?id=air.com.sesameworkshop.ResilienceThinkBreathDo',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'Wisdom: The World of Emotions',
    description: 'Recognize and regulate anger in self and others',
    image: 'images/toys/wisdom.webp',
    iosLink:
        'https://apps.apple.com/us/app/wisdom-the-world-of-emotions/id1182494093',
    link:
        'https://play.google.com/store/apps/details?id=com.WisdomEnglishunlockA.ipa',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'Feeling Arrow',
    description: 'Control people with arrows of feelings',
    image: 'images/toys/feeling_arrow.webp',
    iosLink: 'https://apps.apple.com/us/app/feeling-arrow/id1628597068',
    link:
        'https://play.google.com/store/apps/details?id=com.YsoCorp.Feelingarrow',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'Zoo Academy',
    description: 'Social Emotional Game for K-1 Students',
    image: 'images/toys/zoo.png',
    iosLink: 'https://www.centervention.com/zoo-academy/',
    link: 'https://www.centervention.com/zoo-academy/',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'How We Feel',
    description: 'An emotional wellbeing journal',
    image: 'images/toys/how_we_feel.webp',
    iosLink: 'https://apps.apple.com/us/app/how-we-feel/id1562706384',
    link:
        'https://play.google.com/store/apps/details?id=org.howwefeel.moodmeter',
    type: ToyTypes.tool,
  ),
  const Toy(
    title: 'Pluck It',
    description: 'A weird game about emotions',
    image: 'images/toys/pluck_it.webp',
    iosLink:
        'https://apps.apple.com/us/app/pluck-it-hairs-and-emotions/id1377729521',
    link:
        'https://play.google.com/store/apps/details?id=com.feelinggame.pluckit',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'Messenger Kids',
    description: 'Messaging controlled by parents',
    image: 'images/toys/messenger.webp',
    iosLink: 'https://apps.apple.com/us/app/messenger-kids/id1285713171',
    link: 'https://play.google.com/store/apps/details?id=com.facebook.talk',
    type: ToyTypes.tool,
  ),
  const Toy(
    title: 'IntroDUCKtion',
    description: 'IntroDUCKtion to big feelings',
    image: 'images/toys/introducktion.webp',
    iosLink:
        'https://apps.apple.com/us/app/introducktion-to-big-feelings/id553721733',
    link: 'https://play.google.com/store/apps/details?id=com.introDucktion',
    type: ToyTypes.game,
  ),
  const Toy(
    title: 'Peppy Pals',
    description: 'Game to explore emotions',
    image: 'images/toys/peppy_pals.webp',
    iosLink: 'https://apps.apple.com/us/app/peppy-pals/id1457065641',
    link:
        'https://play.google.com/store/apps/details?id=com.peppypals.socialskills',
    type: ToyTypes.game,
  ),
];

class Toy {
  const Toy({
    required this.type,
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
  final ToyTypes type;
}
