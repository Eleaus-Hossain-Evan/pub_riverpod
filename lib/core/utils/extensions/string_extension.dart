part of 'extensions.dart';

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalize())
      .join(' ');

  List<String> iterable() {
    List<String> items = [];
    split("").forEach((item) => items.add(item));
    return items;
  }

  String toWordTitleCase() {
    return iterable()
        .map((e) {
          if (e == e.toUpperCase()) {
            return " $e";
          } else {
            return e;
          }
        })
        .toList()
        .join('')
        .trim()
        .split(' ')
        .map((str) => str.toCapitalize())
        .join(' ');
  }
}

extension StringWidgetsExtension on String {
  Widget assetImage({
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, int?, bool)? frameBuilder,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit fit = BoxFit.cover,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) =>
      Image.asset(
        key: key,
        this,
        fit: fit,
        alignment: alignment,
        bundle: bundle,
        cacheHeight: cacheHeight,
        cacheWidth: cacheWidth,
        centerSlice: centerSlice,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: errorBuilder,
        excludeFromSemantics: excludeFromSemantics,
        filterQuality: filterQuality,
        frameBuilder: frameBuilder,
        gaplessPlayback: gaplessPlayback,
        height: height,
        width: width,
        isAntiAlias: isAntiAlias,
        matchTextDirection: matchTextDirection,
        opacity: opacity,
        package: package,
        repeat: repeat,
        scale: scale,
        semanticLabel: semanticLabel,
      );
}
