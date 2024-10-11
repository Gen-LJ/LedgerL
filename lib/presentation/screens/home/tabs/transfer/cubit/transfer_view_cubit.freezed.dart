// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserInfoEntity> walletUsers) ready,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserInfoEntity> walletUsers)? ready,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserInfoEntity> walletUsers)? ready,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferViewInitial value) initial,
    required TResult Function(TransferViewReady value) ready,
    required TResult Function(TransferViewLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferViewInitial value)? initial,
    TResult? Function(TransferViewReady value)? ready,
    TResult? Function(TransferViewLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferViewInitial value)? initial,
    TResult Function(TransferViewReady value)? ready,
    TResult Function(TransferViewLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferViewStateCopyWith<$Res> {
  factory $TransferViewStateCopyWith(
          TransferViewState value, $Res Function(TransferViewState) then) =
      _$TransferViewStateCopyWithImpl<$Res, TransferViewState>;
}

/// @nodoc
class _$TransferViewStateCopyWithImpl<$Res, $Val extends TransferViewState>
    implements $TransferViewStateCopyWith<$Res> {
  _$TransferViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferViewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TransferViewInitialImplCopyWith<$Res> {
  factory _$$TransferViewInitialImplCopyWith(_$TransferViewInitialImpl value,
          $Res Function(_$TransferViewInitialImpl) then) =
      __$$TransferViewInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferViewInitialImplCopyWithImpl<$Res>
    extends _$TransferViewStateCopyWithImpl<$Res, _$TransferViewInitialImpl>
    implements _$$TransferViewInitialImplCopyWith<$Res> {
  __$$TransferViewInitialImplCopyWithImpl(_$TransferViewInitialImpl _value,
      $Res Function(_$TransferViewInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferViewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TransferViewInitialImpl implements TransferViewInitial {
  const _$TransferViewInitialImpl();

  @override
  String toString() {
    return 'TransferViewState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferViewInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserInfoEntity> walletUsers) ready,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserInfoEntity> walletUsers)? ready,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserInfoEntity> walletUsers)? ready,
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
    required TResult Function(TransferViewInitial value) initial,
    required TResult Function(TransferViewReady value) ready,
    required TResult Function(TransferViewLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferViewInitial value)? initial,
    TResult? Function(TransferViewReady value)? ready,
    TResult? Function(TransferViewLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferViewInitial value)? initial,
    TResult Function(TransferViewReady value)? ready,
    TResult Function(TransferViewLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransferViewInitial implements TransferViewState {
  const factory TransferViewInitial() = _$TransferViewInitialImpl;
}

/// @nodoc
abstract class _$$TransferViewReadyImplCopyWith<$Res> {
  factory _$$TransferViewReadyImplCopyWith(_$TransferViewReadyImpl value,
          $Res Function(_$TransferViewReadyImpl) then) =
      __$$TransferViewReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserInfoEntity> walletUsers});
}

/// @nodoc
class __$$TransferViewReadyImplCopyWithImpl<$Res>
    extends _$TransferViewStateCopyWithImpl<$Res, _$TransferViewReadyImpl>
    implements _$$TransferViewReadyImplCopyWith<$Res> {
  __$$TransferViewReadyImplCopyWithImpl(_$TransferViewReadyImpl _value,
      $Res Function(_$TransferViewReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletUsers = null,
  }) {
    return _then(_$TransferViewReadyImpl(
      walletUsers: null == walletUsers
          ? _value._walletUsers
          : walletUsers // ignore: cast_nullable_to_non_nullable
              as List<UserInfoEntity>,
    ));
  }
}

/// @nodoc

class _$TransferViewReadyImpl implements TransferViewReady {
  const _$TransferViewReadyImpl(
      {required final List<UserInfoEntity> walletUsers})
      : _walletUsers = walletUsers;

  final List<UserInfoEntity> _walletUsers;
  @override
  List<UserInfoEntity> get walletUsers {
    if (_walletUsers is EqualUnmodifiableListView) return _walletUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletUsers);
  }

  @override
  String toString() {
    return 'TransferViewState.ready(walletUsers: $walletUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferViewReadyImpl &&
            const DeepCollectionEquality()
                .equals(other._walletUsers, _walletUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_walletUsers));

  /// Create a copy of TransferViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferViewReadyImplCopyWith<_$TransferViewReadyImpl> get copyWith =>
      __$$TransferViewReadyImplCopyWithImpl<_$TransferViewReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserInfoEntity> walletUsers) ready,
    required TResult Function() loading,
  }) {
    return ready(walletUsers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserInfoEntity> walletUsers)? ready,
    TResult? Function()? loading,
  }) {
    return ready?.call(walletUsers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserInfoEntity> walletUsers)? ready,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(walletUsers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransferViewInitial value) initial,
    required TResult Function(TransferViewReady value) ready,
    required TResult Function(TransferViewLoading value) loading,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferViewInitial value)? initial,
    TResult? Function(TransferViewReady value)? ready,
    TResult? Function(TransferViewLoading value)? loading,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferViewInitial value)? initial,
    TResult Function(TransferViewReady value)? ready,
    TResult Function(TransferViewLoading value)? loading,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class TransferViewReady implements TransferViewState {
  const factory TransferViewReady(
          {required final List<UserInfoEntity> walletUsers}) =
      _$TransferViewReadyImpl;

  List<UserInfoEntity> get walletUsers;

  /// Create a copy of TransferViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferViewReadyImplCopyWith<_$TransferViewReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransferViewLoadingImplCopyWith<$Res> {
  factory _$$TransferViewLoadingImplCopyWith(_$TransferViewLoadingImpl value,
          $Res Function(_$TransferViewLoadingImpl) then) =
      __$$TransferViewLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransferViewLoadingImplCopyWithImpl<$Res>
    extends _$TransferViewStateCopyWithImpl<$Res, _$TransferViewLoadingImpl>
    implements _$$TransferViewLoadingImplCopyWith<$Res> {
  __$$TransferViewLoadingImplCopyWithImpl(_$TransferViewLoadingImpl _value,
      $Res Function(_$TransferViewLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferViewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TransferViewLoadingImpl implements TransferViewLoading {
  const _$TransferViewLoadingImpl();

  @override
  String toString() {
    return 'TransferViewState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferViewLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserInfoEntity> walletUsers) ready,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserInfoEntity> walletUsers)? ready,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserInfoEntity> walletUsers)? ready,
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
    required TResult Function(TransferViewInitial value) initial,
    required TResult Function(TransferViewReady value) ready,
    required TResult Function(TransferViewLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransferViewInitial value)? initial,
    TResult? Function(TransferViewReady value)? ready,
    TResult? Function(TransferViewLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransferViewInitial value)? initial,
    TResult Function(TransferViewReady value)? ready,
    TResult Function(TransferViewLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransferViewLoading implements TransferViewState {
  const factory TransferViewLoading() = _$TransferViewLoadingImpl;
}
