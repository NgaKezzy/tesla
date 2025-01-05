// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContractStateCWProxy {
  ContractState images(List<XFile> images);

  ContractState status(ContractStatus status);

  ContractState files(List<XFile> files);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContractState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContractState(...).copyWith(id: 12, name: "My name")
  /// ````
  ContractState call({
    List<XFile>? images,
    ContractStatus? status,
    List<XFile>? files,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContractState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContractState.copyWith.fieldName(...)`
class _$ContractStateCWProxyImpl implements _$ContractStateCWProxy {
  const _$ContractStateCWProxyImpl(this._value);

  final ContractState _value;

  @override
  ContractState images(List<XFile> images) => this(images: images);

  @override
  ContractState status(ContractStatus status) => this(status: status);

  @override
  ContractState files(List<XFile> files) => this(files: files);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ContractState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ContractState(...).copyWith(id: 12, name: "My name")
  /// ````
  ContractState call({
    Object? images = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? files = const $CopyWithPlaceholder(),
  }) {
    return ContractState(
      images: images == const $CopyWithPlaceholder() || images == null
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<XFile>,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ContractStatus,
      files: files == const $CopyWithPlaceholder() || files == null
          ? _value.files
          // ignore: cast_nullable_to_non_nullable
          : files as List<XFile>,
    );
  }
}

extension $ContractStateCopyWith on ContractState {
  /// Returns a callable class that can be used as follows: `instanceOfContractState.copyWith(...)` or like so:`instanceOfContractState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContractStateCWProxy get copyWith => _$ContractStateCWProxyImpl(this);
}
