// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_balance_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferBalanceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, bool onHide) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, bool onHide)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, bool onHide)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferLoading value) loading,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFail value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferInitial value)? initial,
    TResult? Function(TransferLoading value)? loading,
    TResult? Function(TransferSuccess value)? success,
    TResult? Function(TransferFail value)? fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferLoading value)? loading,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFail value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferBalanceStateCopyWith<$Res> {
  factory $TransferBalanceStateCopyWith(TransferBalanceState value,
          $Res Function(TransferBalanceState) then) =
      _$TransferBalanceStateCopyWithImpl<$Res, TransferBalanceState>;
}

/// @nodoc
class _$TransferBalanceStateCopyWithImpl<$Res,
        $Val extends TransferBalanceState>
    implements $TransferBalanceStateCopyWith<$Res> {
  _$TransferBalanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TransferInitialImplCopyWith<$Res> {
  factory _$$TransferInitialImplCopyWith(_$TransferInitialImpl value,
          $Res Function(_$TransferInitialImpl) then) =
      __$$TransferInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int currentIndex, bool onHide});
}

/// @nodoc
class __$$TransferInitialImplCopyWithImpl<$Res>
    extends _$TransferBalanceStateCopyWithImpl<$Res, _$TransferInitialImpl>
    implements _$$TransferInitialImplCopyWith<$Res> {
  __$$TransferInitialImplCopyWithImpl(
      _$TransferInitialImpl _value, $Res Function(_$TransferInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? onHide = null,
  }) {
    return _then(_$TransferInitialImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      onHide: null == onHide
          ? _value.onHide
          : onHide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransferInitialImpl implements TransferInitial {
  const _$TransferInitialImpl({this.currentIndex = 0, this.onHide = false});

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final bool onHide;

  @override
  String toString() {
    return 'TransferBalanceState.initial(currentIndex: $currentIndex, onHide: $onHide)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferInitialImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.onHide, onHide) || other.onHide == onHide));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex, onHide);

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferInitialImplCopyWith<_$TransferInitialImpl> get copyWith =>
      __$$TransferInitialImplCopyWithImpl<_$TransferInitialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, bool onHide) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) fail,
  }) {
    return initial(currentIndex, onHide);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, bool onHide)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? fail,
  }) {
    return initial?.call(currentIndex, onHide);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, bool onHide)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(currentIndex, onHide);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferLoading value) loading,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFail value) fail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferInitial value)? initial,
    TResult? Function(TransferLoading value)? loading,
    TResult? Function(TransferSuccess value)? success,
    TResult? Function(TransferFail value)? fail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferLoading value)? loading,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFail value)? fail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransferInitial implements TransferBalanceState {
  const factory TransferInitial({final int currentIndex, final bool onHide}) =
      _$TransferInitialImpl;

  int get currentIndex;
  bool get onHide;

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferInitialImplCopyWith<_$TransferInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferLoadingImplCopyWith<$Res> {
  factory _$$TransferLoadingImplCopyWith(_$TransferLoadingImpl value,
          $Res Function(_$TransferLoadingImpl) then) =
      __$$TransferLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferLoadingImplCopyWithImpl<$Res>
    extends _$TransferBalanceStateCopyWithImpl<$Res, _$TransferLoadingImpl>
    implements _$$TransferLoadingImplCopyWith<$Res> {
  __$$TransferLoadingImplCopyWithImpl(
      _$TransferLoadingImpl _value, $Res Function(_$TransferLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TransferLoadingImpl implements TransferLoading {
  const _$TransferLoadingImpl();

  @override
  String toString() {
    return 'TransferBalanceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransferLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, bool onHide) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) fail,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, bool onHide)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? fail,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, bool onHide)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? fail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferLoading value) loading,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFail value) fail,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferInitial value)? initial,
    TResult? Function(TransferLoading value)? loading,
    TResult? Function(TransferSuccess value)? success,
    TResult? Function(TransferFail value)? fail,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferLoading value)? loading,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFail value)? fail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransferLoading implements TransferBalanceState {
  const factory TransferLoading() = _$TransferLoadingImpl;
}

/// @nodoc
abstract class _$$TransferSuccessImplCopyWith<$Res> {
  factory _$$TransferSuccessImplCopyWith(_$TransferSuccessImpl value,
          $Res Function(_$TransferSuccessImpl) then) =
      __$$TransferSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferSuccessImplCopyWithImpl<$Res>
    extends _$TransferBalanceStateCopyWithImpl<$Res, _$TransferSuccessImpl>
    implements _$$TransferSuccessImplCopyWith<$Res> {
  __$$TransferSuccessImplCopyWithImpl(
      _$TransferSuccessImpl _value, $Res Function(_$TransferSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TransferSuccessImpl implements TransferSuccess {
  const _$TransferSuccessImpl();

  @override
  String toString() {
    return 'TransferBalanceState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransferSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, bool onHide) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) fail,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, bool onHide)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? fail,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, bool onHide)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferLoading value) loading,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFail value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferInitial value)? initial,
    TResult? Function(TransferLoading value)? loading,
    TResult? Function(TransferSuccess value)? success,
    TResult? Function(TransferFail value)? fail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferLoading value)? loading,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFail value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TransferSuccess implements TransferBalanceState {
  const factory TransferSuccess() = _$TransferSuccessImpl;
}

/// @nodoc
abstract class _$$TransferFailImplCopyWith<$Res> {
  factory _$$TransferFailImplCopyWith(
          _$TransferFailImpl value, $Res Function(_$TransferFailImpl) then) =
      __$$TransferFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$TransferFailImplCopyWithImpl<$Res>
    extends _$TransferBalanceStateCopyWithImpl<$Res, _$TransferFailImpl>
    implements _$$TransferFailImplCopyWith<$Res> {
  __$$TransferFailImplCopyWithImpl(
      _$TransferFailImpl _value, $Res Function(_$TransferFailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$TransferFailImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransferFailImpl implements TransferFail {
  const _$TransferFailImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'TransferBalanceState.fail(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferFailImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferFailImplCopyWith<_$TransferFailImpl> get copyWith =>
      __$$TransferFailImplCopyWithImpl<_$TransferFailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentIndex, bool onHide) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) fail,
  }) {
    return fail(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int currentIndex, bool onHide)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? fail,
  }) {
    return fail?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentIndex, bool onHide)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferInitial value) initial,
    required TResult Function(TransferLoading value) loading,
    required TResult Function(TransferSuccess value) success,
    required TResult Function(TransferFail value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferInitial value)? initial,
    TResult? Function(TransferLoading value)? loading,
    TResult? Function(TransferSuccess value)? success,
    TResult? Function(TransferFail value)? fail,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferInitial value)? initial,
    TResult Function(TransferLoading value)? loading,
    TResult Function(TransferSuccess value)? success,
    TResult Function(TransferFail value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class TransferFail implements TransferBalanceState {
  const factory TransferFail(final String errorMessage) = _$TransferFailImpl;

  String get errorMessage;

  /// Create a copy of TransferBalanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferFailImplCopyWith<_$TransferFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
