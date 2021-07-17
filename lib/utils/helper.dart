import 'dart:ui';

final List<Map<String, Color>> colorCategory = [
  {'primary': Color(0xFFFF416C), 'accent': Color(0xFFFF4B2B)},
  {'primary': Color(0xFFFC4A1A), 'accent': Color(0xFFF7B733)},
  {'primary': Color(0xFFFF5F6D), 'accent': Color(0xFFFFC371)},
  {'primary': Color(0xFF00b09b), 'accent': Color(0xFF96c93d)},
  {'primary': Color(0xFF1A2980), 'accent': Color(0xFF26D0CE)},
  {'primary': Color(0xFF1A2980), 'accent': Color(0xFF26D0CE)},
];

final Map<String, Color> colorTheme = {
  'primary': Color(0xFFFA9415),
  'success': Color(0xFF3CB8B0),
  'warning': Color(0xFFFABA15),
  'danger': Color(0xFFEB5857),
  'orange': Color(0xFFED5A16),
  'peterriver': Color(0xFF5394DE),
  'asbestos': Color(0xFF515151),
  'concrete': Color(0xFF4F4C47),
  'silver': Color(0xFFB5B5B5),
  'clouds': Color(0xFFE4E3E3),
};

double calcDiscPrice(price, discount) => price - (price * discount / 100);
