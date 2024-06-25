/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/bottom_nav
  $AssetsIconsBottomNavGen get bottomNav => const $AssetsIconsBottomNavGen();

  /// Directory path: assets/icons/common
  $AssetsIconsCommonGen get common => const $AssetsIconsCommonGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onboarding.png
  AssetGenImage get onboarding =>
      const AssetGenImage('assets/images/onboarding.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [onboarding, splash];
}

class $AssetsIconsBottomNavGen {
  const $AssetsIconsBottomNavGen();

  /// Directory path: assets/icons/bottom_nav/selected
  $AssetsIconsBottomNavSelectedGen get selected =>
      const $AssetsIconsBottomNavSelectedGen();

  /// Directory path: assets/icons/bottom_nav/unselected
  $AssetsIconsBottomNavUnselectedGen get unselected =>
      const $AssetsIconsBottomNavUnselectedGen();
}

class $AssetsIconsCommonGen {
  const $AssetsIconsCommonGen();

  /// File path: assets/icons/common/en.png
  AssetGenImage get en => const AssetGenImage('assets/icons/common/en.png');

  /// File path: assets/icons/common/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/icons/common/eye.svg');

  /// File path: assets/icons/common/eye_off.svg
  SvgGenImage get eyeOff =>
      const SvgGenImage('assets/icons/common/eye_off.svg');

  /// File path: assets/icons/common/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons/common/filter.svg');

  /// File path: assets/icons/common/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/common/notification.svg');

  /// File path: assets/icons/common/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/common/search.svg');

  /// File path: assets/icons/common/trash.svg
  SvgGenImage get trash => const SvgGenImage('assets/icons/common/trash.svg');

  /// File path: assets/icons/common/vn.png
  AssetGenImage get vn => const AssetGenImage('assets/icons/common/vn.png');

  /// List of all assets
  List<dynamic> get values =>
      [en, eye, eyeOff, filter, notification, search, trash, vn];
}

class $AssetsIconsBottomNavSelectedGen {
  const $AssetsIconsBottomNavSelectedGen();

  /// File path: assets/icons/bottom_nav/selected/cart.svg
  SvgGenImage get cart =>
      const SvgGenImage('assets/icons/bottom_nav/selected/cart.svg');

  /// File path: assets/icons/bottom_nav/selected/heart.svg
  SvgGenImage get heart =>
      const SvgGenImage('assets/icons/bottom_nav/selected/heart.svg');

  /// File path: assets/icons/bottom_nav/selected/home.svg
  SvgGenImage get home =>
      const SvgGenImage('assets/icons/bottom_nav/selected/home.svg');

  /// File path: assets/icons/bottom_nav/selected/search.svg
  SvgGenImage get search =>
      const SvgGenImage('assets/icons/bottom_nav/selected/search.svg');

  /// File path: assets/icons/bottom_nav/selected/user.svg
  SvgGenImage get user =>
      const SvgGenImage('assets/icons/bottom_nav/selected/user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [cart, heart, home, search, user];
}

class $AssetsIconsBottomNavUnselectedGen {
  const $AssetsIconsBottomNavUnselectedGen();

  /// File path: assets/icons/bottom_nav/unselected/cart.svg
  SvgGenImage get cart =>
      const SvgGenImage('assets/icons/bottom_nav/unselected/cart.svg');

  /// File path: assets/icons/bottom_nav/unselected/heart.svg
  SvgGenImage get heart =>
      const SvgGenImage('assets/icons/bottom_nav/unselected/heart.svg');

  /// File path: assets/icons/bottom_nav/unselected/home.svg
  SvgGenImage get home =>
      const SvgGenImage('assets/icons/bottom_nav/unselected/home.svg');

  /// File path: assets/icons/bottom_nav/unselected/search.svg
  SvgGenImage get search =>
      const SvgGenImage('assets/icons/bottom_nav/unselected/search.svg');

  /// File path: assets/icons/bottom_nav/unselected/user.svg
  SvgGenImage get user =>
      const SvgGenImage('assets/icons/bottom_nav/unselected/user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [cart, heart, home, search, user];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
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
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
