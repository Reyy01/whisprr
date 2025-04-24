// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AiResponse.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiResponseDto _$AiResponseDtoFromJson(Map<String, dynamic> json) {
  return _AiResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AiResponseDto {
  List<CandidateDto>? get candidates => throw _privateConstructorUsedError;

  /// Serializes this AiResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiResponseDtoCopyWith<AiResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiResponseDtoCopyWith<$Res> {
  factory $AiResponseDtoCopyWith(
          AiResponseDto value, $Res Function(AiResponseDto) then) =
      _$AiResponseDtoCopyWithImpl<$Res, AiResponseDto>;
  @useResult
  $Res call({List<CandidateDto>? candidates});
}

/// @nodoc
class _$AiResponseDtoCopyWithImpl<$Res, $Val extends AiResponseDto>
    implements $AiResponseDtoCopyWith<$Res> {
  _$AiResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = freezed,
  }) {
    return _then(_value.copyWith(
      candidates: freezed == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiResponseDtoImplCopyWith<$Res>
    implements $AiResponseDtoCopyWith<$Res> {
  factory _$$AiResponseDtoImplCopyWith(
          _$AiResponseDtoImpl value, $Res Function(_$AiResponseDtoImpl) then) =
      __$$AiResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CandidateDto>? candidates});
}

/// @nodoc
class __$$AiResponseDtoImplCopyWithImpl<$Res>
    extends _$AiResponseDtoCopyWithImpl<$Res, _$AiResponseDtoImpl>
    implements _$$AiResponseDtoImplCopyWith<$Res> {
  __$$AiResponseDtoImplCopyWithImpl(
      _$AiResponseDtoImpl _value, $Res Function(_$AiResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = freezed,
  }) {
    return _then(_$AiResponseDtoImpl(
      candidates: freezed == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiResponseDtoImpl extends _AiResponseDto {
  const _$AiResponseDtoImpl({final List<CandidateDto>? candidates})
      : _candidates = candidates,
        super._();

  factory _$AiResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiResponseDtoImplFromJson(json);

  final List<CandidateDto>? _candidates;
  @override
  List<CandidateDto>? get candidates {
    final value = _candidates;
    if (value == null) return null;
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AiResponseDto(candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiResponseDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_candidates));

  /// Create a copy of AiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiResponseDtoImplCopyWith<_$AiResponseDtoImpl> get copyWith =>
      __$$AiResponseDtoImplCopyWithImpl<_$AiResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _AiResponseDto extends AiResponseDto {
  const factory _AiResponseDto({final List<CandidateDto>? candidates}) =
      _$AiResponseDtoImpl;
  const _AiResponseDto._() : super._();

  factory _AiResponseDto.fromJson(Map<String, dynamic> json) =
      _$AiResponseDtoImpl.fromJson;

  @override
  List<CandidateDto>? get candidates;

  /// Create a copy of AiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiResponseDtoImplCopyWith<_$AiResponseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
