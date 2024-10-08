// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusResponseModel _$StatusResponseModelFromJson(Map<String, dynamic> json) {
  return _StatusResponseModel.fromJson(json);
}

/// @nodoc
mixin _$StatusResponseModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this StatusResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusResponseModelCopyWith<StatusResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusResponseModelCopyWith<$Res> {
  factory $StatusResponseModelCopyWith(
          StatusResponseModel value, $Res Function(StatusResponseModel) then) =
      _$StatusResponseModelCopyWithImpl<$Res, StatusResponseModel>;
  @useResult
  $Res call({bool status, String message});
}

/// @nodoc
class _$StatusResponseModelCopyWithImpl<$Res, $Val extends StatusResponseModel>
    implements $StatusResponseModelCopyWith<$Res> {
  _$StatusResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusResponseModelImplCopyWith<$Res>
    implements $StatusResponseModelCopyWith<$Res> {
  factory _$$StatusResponseModelImplCopyWith(_$StatusResponseModelImpl value,
          $Res Function(_$StatusResponseModelImpl) then) =
      __$$StatusResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message});
}

/// @nodoc
class __$$StatusResponseModelImplCopyWithImpl<$Res>
    extends _$StatusResponseModelCopyWithImpl<$Res, _$StatusResponseModelImpl>
    implements _$$StatusResponseModelImplCopyWith<$Res> {
  __$$StatusResponseModelImplCopyWithImpl(_$StatusResponseModelImpl _value,
      $Res Function(_$StatusResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$StatusResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusResponseModelImpl implements _StatusResponseModel {
  const _$StatusResponseModelImpl(
      {required this.status, required this.message});

  factory _$StatusResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusResponseModelImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;

  @override
  String toString() {
    return 'StatusResponseModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of StatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusResponseModelImplCopyWith<_$StatusResponseModelImpl> get copyWith =>
      __$$StatusResponseModelImplCopyWithImpl<_$StatusResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusResponseModelImplToJson(
      this,
    );
  }
}

abstract class _StatusResponseModel implements StatusResponseModel {
  const factory _StatusResponseModel(
      {required final bool status,
      required final String message}) = _$StatusResponseModelImpl;

  factory _StatusResponseModel.fromJson(Map<String, dynamic> json) =
      _$StatusResponseModelImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;

  /// Create a copy of StatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusResponseModelImplCopyWith<_$StatusResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
