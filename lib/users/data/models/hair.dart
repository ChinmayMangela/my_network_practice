enum HairType {
  curly,
  straight,
  wavy,
  bald,
  kinky,
}

class Hair {
  final String? color;
  final HairType? type;

  const Hair({
    required this.color,
    required this.type,
  });

  factory Hair.fromJson(Map<String, dynamic> hairData) {
    HairType parseHairType(String hairTypeString) {
      switch (hairTypeString) {
        case 'Curly':
          return HairType.curly;
        case 'Straight':
          return HairType.straight;
        case 'Wavy':
          return HairType.wavy;
        case 'Kinky':
          return HairType.kinky;
        default:
          return HairType.bald;
      }
    }

    return Hair(
      color: hairData['color'] ?? 'black',
      type: parseHairType(hairData['type']),
    );
  }
}
