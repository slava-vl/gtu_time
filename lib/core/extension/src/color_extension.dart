import 'dart:ui';

extension ColorToColorFilter on Color {
  ColorFilter get filter => ColorFilter.mode(this, .srcIn);
}
