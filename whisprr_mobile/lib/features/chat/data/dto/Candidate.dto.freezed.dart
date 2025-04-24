// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Candidate.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CandidateDto _$CandidateDtoFromJson(Map<String, dynamic> json) {
  return _CandidateDto.fromJson(json);
}

/// @nodoc
mixin _$CandidateDto {
  String? get finishReason => throw _privateConstructorUsedError;

  /// Serializes this CandidateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateDtoCopyWith<CandidateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateDtoCopyWith<$Res> {
  factory $CandidateDtoCopyWith(
          CandidateDto value, $Res Function(CandidateDto) then) =
      _$CandidateDtoCopyWithImpl<$Res, CandidateDto>;
  @useResult
  $Res call({String? finishReason});
}

/// @nodoc
class _$CandidateDtoCopyWithImpl<$Res, $Val extends CandidateDto>
    implements $CandidateDtoCopyWith<$Res> {
  _$CandidateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finishReason = freezed,
  }) {
    return _then(_value.copyWith(
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CandidateDtoImplCopyWith<$Res>
    implements $CandidateDtoCopyWith<$Res> {
  factory _$$CandidateDtoImplCopyWith(
          _$CandidateDtoImpl value, $Res Function(_$CandidateDtoImpl) then) =
      __$$CandidateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? finishReason});
}

/// @nodoc
class __$$CandidateDtoImplCopyWithImpl<$Res>
    extends _$CandidateDtoCopyWithImpl<$Res, _$CandidateDtoImpl>
    implements _$$CandidateDtoImplCopyWith<$Res> {
  __$$CandidateDtoImplCopyWithImpl(
      _$CandidateDtoImpl _value, $Res Function(_$CandidateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finishReason = freezed,
  }) {
    return _then(_$CandidateDtoImpl(
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateDtoImpl extends _CandidateDto {
  const _$CandidateDtoImpl({this.finishReason}) : super._();

  factory _$CandidateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateDtoImplFromJson(json);

  @override
  final String? finishReason;

  @override
  String toString() {
    return 'CandidateDto(finishReason: $finishReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateDtoImpl &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, finishReason);

  /// Create a copy of CandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateDtoImplCopyWith<_$CandidateDtoImpl> get copyWith =>
      __$$CandidateDtoImplCopyWithImpl<_$CandidateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateDtoImplToJson(
      this,
    );
  }
}

abstract class _CandidateDto extends CandidateDto {
  const factory _CandidateDto({final String? finishReason}) =
      _$CandidateDtoImpl;
  const _CandidateDto._() : super._();

  factory _CandidateDto.fromJson(Map<String, dynamic> json) =
      _$CandidateDtoImpl.fromJson;

  @override
  String? get finishReason;

  /// Create a copy of CandidateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateDtoImplCopyWith<_$CandidateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
