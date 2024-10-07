// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSettingState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingStateCopyWith<AppSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingStateCopyWith<$Res> {
  factory $AppSettingStateCopyWith(
          AppSettingState value, $Res Function(AppSettingState) then) =
      _$AppSettingStateCopyWithImpl<$Res, AppSettingState>;
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$AppSettingStateCopyWithImpl<$Res, $Val extends AppSettingState>
    implements $AppSettingStateCopyWith<$Res> {
  _$AppSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingStateImplCopyWith<$Res>
    implements $AppSettingStateCopyWith<$Res> {
  factory _$$AppSettingStateImplCopyWith(_$AppSettingStateImpl value,
          $Res Function(_$AppSettingStateImpl) then) =
      __$$AppSettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$$AppSettingStateImplCopyWithImpl<$Res>
    extends _$AppSettingStateCopyWithImpl<$Res, _$AppSettingStateImpl>
    implements _$$AppSettingStateImplCopyWith<$Res> {
  __$$AppSettingStateImplCopyWithImpl(
      _$AppSettingStateImpl _value, $Res Function(_$AppSettingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
  }) {
    return _then(_$AppSettingStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$AppSettingStateImpl implements _AppSettingState {
  const _$AppSettingStateImpl({required this.themeMode});

  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'AppSettingState(themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode);

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingStateImplCopyWith<_$AppSettingStateImpl> get copyWith =>
      __$$AppSettingStateImplCopyWithImpl<_$AppSettingStateImpl>(
          this, _$identity);
}

abstract class _AppSettingState implements AppSettingState {
  const factory _AppSettingState({required final ThemeMode themeMode}) =
      _$AppSettingStateImpl;

  @override
  ThemeMode get themeMode;

  /// Create a copy of AppSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingStateImplCopyWith<_$AppSettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
