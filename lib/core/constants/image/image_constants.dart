class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String toPng(String name) => 'assets/images/$name.png';
  String toSVG(String name) => 'assets/svg/$name.svg';
  // String toSVGIcon(String name) => 'assets/icons/$name.svg';
  // String toPNGIcon(String name) => 'assets/icons/$name.png';

  String get logo => toPng('logo');
  String get logoWhite => toPng('logo_white');
  String get logoSvg => toSVG('logo');
  String get logoWhiteSvg => toSVG('logo_white');

  String get cardChip => toPng('card_chip');
}
