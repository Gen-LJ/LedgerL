// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LedgerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BalanceEntity> allBalance) ready,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BalanceEntity> allBalance)? ready,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BalanceEntity> allBalance)? ready,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LedgerInitial value) initial,
    required TResult Function(LedgerReady value) ready,
    required TResult Function(LedgerLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerInitial value)? initial,
    TResult? Function(LedgerReady value)? ready,
    TResult? Function(LedgerLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerInitial value)? initial,
    TResult Function(LedgerReady value)? ready,
    TResult Function(LedgerLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerStateCopyWith<$Res> {
  factory $LedgerStateCopyWith(
          LedgerState value, $Res Function(LedgerState) then) =
      _$LedgerStateCopyWithImpl<$Res, LedgerState>;
}

/// @nodoc
class _$LedgerStateCopyWithImpl<$Res, $Val extends LedgerState>
    implements $LedgerStateCopyWith<$Res> {
  _$LedgerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedgerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LedgerInitialImplCopyWith<$Res> {
  factory _$$LedgerInitialImplCopyWith(
          _$LedgerInitialImpl value, $Res Function(_$LedgerInitialImpl) then) =
      __$$LedgerInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LedgerInitialImplCopyWithImpl<$Res>
    extends _$LedgerStateCopyWithImpl<$Res, _$LedgerInitialImpl>
    implements _$$LedgerInitialImplCopyWith<$Res> {
  __$$LedgerInitialImplCopyWithImpl(
      _$LedgerInitialImpl _value, $Res Function(_$LedgerInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LedgerInitialImpl implements LedgerInitial {
  const _$LedgerInitialImpl();

  @override
  String toString() {
    return 'LedgerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LedgerInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BalanceEntity> allBalance) ready,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BalanceEntity> allBalance)? ready,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BalanceEntity> allBalance)? ready,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LedgerInitial value) initial,
    required TResult Function(LedgerReady value) ready,
    required TResult Function(LedgerLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerInitial value)? initial,
    TResult? Function(LedgerReady value)? ready,
    TResult? Function(LedgerLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerInitial value)? initial,
    TResult Function(LedgerReady value)? ready,
    TResult Function(LedgerLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LedgerInitial implements LedgerState {
  const factory LedgerInitial() = _$LedgerInitialImpl;
}

/// @nodoc
abstract class _$$LedgerReadyImplCopyWith<$Res> {
  factory _$$LedgerReadyImplCopyWith(
          _$LedgerReadyImpl value, $Res Function(_$LedgerReadyImpl) then) =
      __$$LedgerReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BalanceEntity> allBalance});
}

/// @nodoc
class __$$LedgerReadyImplCopyWithImpl<$Res>
    extends _$LedgerStateCopyWithImpl<$Res, _$LedgerReadyImpl>
    implements _$$LedgerReadyImplCopyWith<$Res> {
  __$$LedgerReadyImplCopyWithImpl(
      _$LedgerReadyImpl _value, $Res Function(_$LedgerReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allBalance = null,
  }) {
    return _then(_$LedgerReadyImpl(
      allBalance: null == allBalance
          ? _value._allBalance
          : allBalance // ignore: cast_nullable_to_non_nullable
              as List<BalanceEntity>,
    ));
  }
}

/// @nodoc

class _$LedgerReadyImpl implements LedgerReady {
  const _$LedgerReadyImpl({required final List<BalanceEntity> allBalance})
      : _allBalance = allBalance;

  final List<BalanceEntity> _allBalance;
  @override
  List<BalanceEntity> get allBalance {
    if (_allBalance is EqualUnmodifiableListView) return _allBalance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allBalance);
  }

  @override
  String toString() {
    return 'LedgerState.ready(allBalance: $allBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerReadyImpl &&
            const DeepCollectionEquality()
                .equals(other._allBalance, _allBalance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_allBalance));

  /// Create a copy of LedgerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerReadyImplCopyWith<_$LedgerReadyImpl> get copyWith =>
      __$$LedgerReadyImplCopyWithImpl<_$LedgerReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BalanceEntity> allBalance) ready,
    required TResult Function() loading,
  }) {
    return ready(allBalance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BalanceEntity> allBalance)? ready,
    TResult? Function()? loading,
  }) {
    return ready?.call(allBalance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BalanceEntity> allBalance)? ready,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(allBalance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LedgerInitial value) initial,
    required TResult Function(LedgerReady value) ready,
    required TResult Function(LedgerLoading value) loading,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerInitial value)? initial,
    TResult? Function(LedgerReady value)? ready,
    TResult? Function(LedgerLoading value)? loading,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerInitial value)? initial,
    TResult Function(LedgerReady value)? ready,
    TResult Function(LedgerLoading value)? loading,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class LedgerReady implements LedgerState {
  const factory LedgerReady({required final List<BalanceEntity> allBalance}) =
      _$LedgerReadyImpl;

  List<BalanceEntity> get allBalance;

  /// Create a copy of LedgerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedgerReadyImplCopyWith<_$LedgerReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LedgerLoadingImplCopyWith<$Res> {
  factory _$$LedgerLoadingImplCopyWith(
          _$LedgerLoadingImpl value, $Res Function(_$LedgerLoadingImpl) then) =
      __$$LedgerLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LedgerLoadingImplCopyWithImpl<$Res>
    extends _$LedgerStateCopyWithImpl<$Res, _$LedgerLoadingImpl>
    implements _$$LedgerLoadingImplCopyWith<$Res> {
  __$$LedgerLoadingImplCopyWithImpl(
      _$LedgerLoadingImpl _value, $Res Function(_$LedgerLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LedgerLoadingImpl implements LedgerLoading {
  const _$LedgerLoadingImpl();

  @override
  String toString() {
    return 'LedgerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LedgerLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<BalanceEntity> allBalance) ready,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<BalanceEntity> allBalance)? ready,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<BalanceEntity> allBalance)? ready,
    TResult Function()? loading,
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
    required TResult Function(LedgerInitial value) initial,
    required TResult Function(LedgerReady value) ready,
    required TResult Function(LedgerLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerInitial value)? initial,
    TResult? Function(LedgerReady value)? ready,
    TResult? Function(LedgerLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerInitial value)? initial,
    TResult Function(LedgerReady value)? ready,
    TResult Function(LedgerLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LedgerLoading implements LedgerState {
  const factory LedgerLoading() = _$LedgerLoadingImpl;
}
