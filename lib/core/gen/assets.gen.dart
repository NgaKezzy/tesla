/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/anim_empty.json
  String get animEmpty => 'assets/animations/anim_empty.json';

  /// File path: assets/animations/new_anim_empty.json
  String get newAnimEmpty => 'assets/animations/new_anim_empty.json';

  /// List of all assets
  List<String> get values => [animEmpty, newAnimEmpty];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/tmp.jpg
  AssetGenImage get tmp => const AssetGenImage('assets/images/tmp.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [tmp];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Decentralization.svg
  SvgGenImage get decentralization =>
      const SvgGenImage('assets/svg/Decentralization.svg');

  /// File path: assets/svg/arrow-right.svg
  SvgGenImage get arrowRight => const SvgGenImage('assets/svg/arrow-right.svg');

  /// File path: assets/svg/arrows-down.svg
  SvgGenImage get arrowsDown => const SvgGenImage('assets/svg/arrows-down.svg');

  /// File path: assets/svg/arrows-left.svg
  SvgGenImage get arrowsLeft => const SvgGenImage('assets/svg/arrows-left.svg');

  /// File path: assets/svg/arrows-up.svg
  SvgGenImage get arrowsUp => const SvgGenImage('assets/svg/arrows-up.svg');

  /// File path: assets/svg/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/svg/bell.svg');

  /// File path: assets/svg/bin.svg
  SvgGenImage get bin => const SvgGenImage('assets/svg/bin.svg');

  /// File path: assets/svg/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/svg/calendar.svg');

  /// File path: assets/svg/chart _square.svg
  SvgGenImage get chartSquare =>
      const SvgGenImage('assets/svg/chart _square.svg');

  /// File path: assets/svg/contract.svg
  SvgGenImage get contract => const SvgGenImage('assets/svg/contract.svg');

  /// File path: assets/svg/department.svg
  SvgGenImage get department => const SvgGenImage('assets/svg/department.svg');

  /// File path: assets/svg/device.svg
  SvgGenImage get device => const SvgGenImage('assets/svg/device.svg');

  /// File path: assets/svg/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/svg/edit.svg');

  /// File path: assets/svg/eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/svg/eye.svg');

  /// File path: assets/svg/lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/svg/lock.svg');

  /// File path: assets/svg/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/svg/logout.svg');

  /// File path: assets/svg/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/svg/menu.svg');

  /// File path: assets/svg/person.svg
  SvgGenImage get person => const SvgGenImage('assets/svg/person.svg');

  /// File path: assets/svg/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/svg/phone.svg');

  /// File path: assets/svg/repair.svg
  SvgGenImage get repair => const SvgGenImage('assets/svg/repair.svg');

  /// File path: assets/svg/user.svg
  SvgGenImage get user => const SvgGenImage('assets/svg/user.svg');

  /// File path: assets/svg/users_group.svg
  SvgGenImage get usersGroup => const SvgGenImage('assets/svg/users_group.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        decentralization,
        arrowRight,
        arrowsDown,
        arrowsLeft,
        arrowsUp,
        bell,
        bin,
        calendar,
        chartSquare,
        contract,
        department,
        device,
        edit,
        eye,
        lock,
        logout,
        menu,
        person,
        phone,
        repair,
        user,
        usersGroup
      ];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
