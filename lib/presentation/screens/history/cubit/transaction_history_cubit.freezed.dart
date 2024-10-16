// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionHistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)
        ready,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(THistoryInitial value) initial,
    required TResult Function(THistoryReady value) ready,
    required TResult Function(THistoryLoading value) loading,
    required TResult Function(THistoryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(THistoryInitial value)? initial,
    TResult? Function(THistoryReady value)? ready,
    TResult? Function(THistoryLoading value)? loading,
    TResult? Function(THistoryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(THistoryInitial value)? initial,
    TResult Function(THistoryReady value)? ready,
    TResult Function(THistoryLoading value)? loading,
    TResult Function(THistoryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryStateCopyWith<$Res> {
  factory $TransactionHistoryStateCopyWith(TransactionHistoryState value,
          $Res Function(TransactionHistoryState) then) =
      _$TransactionHistoryStateCopyWithImpl<$Res, TransactionHistoryState>;
}

/// @nodoc
class _$TransactionHistoryStateCopyWithImpl<$Res,
        $Val extends TransactionHistoryState>
    implements $TransactionHistoryStateCopyWith<$Res> {
  _$TransactionHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$THistoryInitialImplCopyWith<$Res> {
  factory _$$THistoryInitialImplCopyWith(_$THistoryInitialImpl value,
          $Res Function(_$THistoryInitialImpl) then) =
      __$$THistoryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$THistoryInitialImplCopyWithImpl<$Res>
    extends _$TransactionHistoryStateCopyWithImpl<$Res, _$THistoryInitialImpl>
    implements _$$THistoryInitialImplCopyWith<$Res> {
  __$$THistoryInitialImplCopyWithImpl(
      _$THistoryInitialImpl _value, $Res Function(_$THistoryInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$THistoryInitialImpl implements THistoryInitial {
  const _$THistoryInitialImpl();

  @override
  String toString() {
    return 'TransactionHistoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$THistoryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)
        ready,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult Function()? loading,
    TResult Function(String message)? error,
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
    required TResult Function(THistoryInitial value) initial,
    required TResult Function(THistoryReady value) ready,
    required TResult Function(THistoryLoading value) loading,
    required TResult Function(THistoryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(THistoryInitial value)? initial,
    TResult? Function(THistoryReady value)? ready,
    TResult? Function(THistoryLoading value)? loading,
    TResult? Function(THistoryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(THistoryInitial value)? initial,
    TResult Function(THistoryReady value)? ready,
    TResult Function(THistoryLoading value)? loading,
    TResult Function(THistoryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class THistoryInitial implements TransactionHistoryState {
  const factory THistoryInitial() = _$THistoryInitialImpl;
}

/// @nodoc
abstract class _$$THistoryReadyImplCopyWith<$Res> {
  factory _$$THistoryReadyImplCopyWith(
          _$THistoryReadyImpl value, $Res Function(_$THistoryReadyImpl) then) =
      __$$THistoryReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<TransactionEntity> transactions,
      DocumentSnapshot<Object?> lastDocument,
      bool loadingMore});
}

/// @nodoc
class __$$THistoryReadyImplCopyWithImpl<$Res>
    extends _$TransactionHistoryStateCopyWithImpl<$Res, _$THistoryReadyImpl>
    implements _$$THistoryReadyImplCopyWith<$Res> {
  __$$THistoryReadyImplCopyWithImpl(
      _$THistoryReadyImpl _value, $Res Function(_$THistoryReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? lastDocument = null,
    Object? loadingMore = null,
  }) {
    return _then(_$THistoryReadyImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      lastDocument: null == lastDocument
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>,
      loadingMore: null == loadingMore
          ? _value.loadingMore
          : loadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$THistoryReadyImpl implements THistoryReady {
  const _$THistoryReadyImpl(
      {required final List<TransactionEntity> transactions,
      required this.lastDocument,
      this.loadingMore = false})
      : _transactions = transactions;

  final List<TransactionEntity> _transactions;
  @override
  List<TransactionEntity> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final DocumentSnapshot<Object?> lastDocument;
  @override
  @JsonKey()
  final bool loadingMore;

  @override
  String toString() {
    return 'TransactionHistoryState.ready(transactions: $transactions, lastDocument: $lastDocument, loadingMore: $loadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$THistoryReadyImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.lastDocument, lastDocument) ||
                other.lastDocument == lastDocument) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      lastDocument,
      loadingMore);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$THistoryReadyImplCopyWith<_$THistoryReadyImpl> get copyWith =>
      __$$THistoryReadyImplCopyWithImpl<_$THistoryReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)
        ready,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return ready(transactions, lastDocument, loadingMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return ready?.call(transactions, lastDocument, loadingMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(transactions, lastDocument, loadingMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(THistoryInitial value) initial,
    required TResult Function(THistoryReady value) ready,
    required TResult Function(THistoryLoading value) loading,
    required TResult Function(THistoryError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(THistoryInitial value)? initial,
    TResult? Function(THistoryReady value)? ready,
    TResult? Function(THistoryLoading value)? loading,
    TResult? Function(THistoryError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(THistoryInitial value)? initial,
    TResult Function(THistoryReady value)? ready,
    TResult Function(THistoryLoading value)? loading,
    TResult Function(THistoryError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class THistoryReady implements TransactionHistoryState {
  const factory THistoryReady(
      {required final List<TransactionEntity> transactions,
      required final DocumentSnapshot<Object?> lastDocument,
      final bool loadingMore}) = _$THistoryReadyImpl;

  List<TransactionEntity> get transactions;
  DocumentSnapshot<Object?> get lastDocument;
  bool get loadingMore;

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$THistoryReadyImplCopyWith<_$THistoryReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$THistoryLoadingImplCopyWith<$Res> {
  factory _$$THistoryLoadingImplCopyWith(_$THistoryLoadingImpl value,
          $Res Function(_$THistoryLoadingImpl) then) =
      __$$THistoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$THistoryLoadingImplCopyWithImpl<$Res>
    extends _$TransactionHistoryStateCopyWithImpl<$Res, _$THistoryLoadingImpl>
    implements _$$THistoryLoadingImplCopyWith<$Res> {
  __$$THistoryLoadingImplCopyWithImpl(
      _$THistoryLoadingImpl _value, $Res Function(_$THistoryLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$THistoryLoadingImpl implements THistoryLoading {
  const _$THistoryLoadingImpl();

  @override
  String toString() {
    return 'TransactionHistoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$THistoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)
        ready,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult Function()? loading,
    TResult Function(String message)? error,
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
    required TResult Function(THistoryInitial value) initial,
    required TResult Function(THistoryReady value) ready,
    required TResult Function(THistoryLoading value) loading,
    required TResult Function(THistoryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(THistoryInitial value)? initial,
    TResult? Function(THistoryReady value)? ready,
    TResult? Function(THistoryLoading value)? loading,
    TResult? Function(THistoryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(THistoryInitial value)? initial,
    TResult Function(THistoryReady value)? ready,
    TResult Function(THistoryLoading value)? loading,
    TResult Function(THistoryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class THistoryLoading implements TransactionHistoryState {
  const factory THistoryLoading() = _$THistoryLoadingImpl;
}

/// @nodoc
abstract class _$$THistoryErrorImplCopyWith<$Res> {
  factory _$$THistoryErrorImplCopyWith(
          _$THistoryErrorImpl value, $Res Function(_$THistoryErrorImpl) then) =
      __$$THistoryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$THistoryErrorImplCopyWithImpl<$Res>
    extends _$TransactionHistoryStateCopyWithImpl<$Res, _$THistoryErrorImpl>
    implements _$$THistoryErrorImplCopyWith<$Res> {
  __$$THistoryErrorImplCopyWithImpl(
      _$THistoryErrorImpl _value, $Res Function(_$THistoryErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$THistoryErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$THistoryErrorImpl implements THistoryError {
  const _$THistoryErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionHistoryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$THistoryErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$THistoryErrorImplCopyWith<_$THistoryErrorImpl> get copyWith =>
      __$$THistoryErrorImplCopyWithImpl<_$THistoryErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)
        ready,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TransactionEntity> transactions,
            DocumentSnapshot<Object?> lastDocument, bool loadingMore)?
        ready,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(THistoryInitial value) initial,
    required TResult Function(THistoryReady value) ready,
    required TResult Function(THistoryLoading value) loading,
    required TResult Function(THistoryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(THistoryInitial value)? initial,
    TResult? Function(THistoryReady value)? ready,
    TResult? Function(THistoryLoading value)? loading,
    TResult? Function(THistoryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(THistoryInitial value)? initial,
    TResult Function(THistoryReady value)? ready,
    TResult Function(THistoryLoading value)? loading,
    TResult Function(THistoryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class THistoryError implements TransactionHistoryState {
  const factory THistoryError(final String message) = _$THistoryErrorImpl;

  String get message;

  /// Create a copy of TransactionHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$THistoryErrorImplCopyWith<_$THistoryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
