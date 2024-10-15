// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginatedTransactionModel {
  List<TransactionModel> get transactions => throw _privateConstructorUsedError;
  DocumentSnapshot<Object?> get lastDocument =>
      throw _privateConstructorUsedError;

  /// Create a copy of PaginatedTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedTransactionModelCopyWith<PaginatedTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedTransactionModelCopyWith<$Res> {
  factory $PaginatedTransactionModelCopyWith(PaginatedTransactionModel value,
          $Res Function(PaginatedTransactionModel) then) =
      _$PaginatedTransactionModelCopyWithImpl<$Res, PaginatedTransactionModel>;
  @useResult
  $Res call(
      {List<TransactionModel> transactions,
      DocumentSnapshot<Object?> lastDocument});
}

/// @nodoc
class _$PaginatedTransactionModelCopyWithImpl<$Res,
        $Val extends PaginatedTransactionModel>
    implements $PaginatedTransactionModelCopyWith<$Res> {
  _$PaginatedTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? lastDocument = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      lastDocument: null == lastDocument
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedTransactionModelImplCopyWith<$Res>
    implements $PaginatedTransactionModelCopyWith<$Res> {
  factory _$$PaginatedTransactionModelImplCopyWith(
          _$PaginatedTransactionModelImpl value,
          $Res Function(_$PaginatedTransactionModelImpl) then) =
      __$$PaginatedTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionModel> transactions,
      DocumentSnapshot<Object?> lastDocument});
}

/// @nodoc
class __$$PaginatedTransactionModelImplCopyWithImpl<$Res>
    extends _$PaginatedTransactionModelCopyWithImpl<$Res,
        _$PaginatedTransactionModelImpl>
    implements _$$PaginatedTransactionModelImplCopyWith<$Res> {
  __$$PaginatedTransactionModelImplCopyWithImpl(
      _$PaginatedTransactionModelImpl _value,
      $Res Function(_$PaginatedTransactionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? lastDocument = null,
  }) {
    return _then(_$PaginatedTransactionModelImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>,
      lastDocument: null == lastDocument
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>,
    ));
  }
}

/// @nodoc

class _$PaginatedTransactionModelImpl implements _PaginatedTransactionModel {
  const _$PaginatedTransactionModelImpl(
      {required final List<TransactionModel> transactions,
      required this.lastDocument})
      : _transactions = transactions;

  final List<TransactionModel> _transactions;
  @override
  List<TransactionModel> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final DocumentSnapshot<Object?> lastDocument;

  @override
  String toString() {
    return 'PaginatedTransactionModel(transactions: $transactions, lastDocument: $lastDocument)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedTransactionModelImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.lastDocument, lastDocument) ||
                other.lastDocument == lastDocument));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), lastDocument);

  /// Create a copy of PaginatedTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedTransactionModelImplCopyWith<_$PaginatedTransactionModelImpl>
      get copyWith => __$$PaginatedTransactionModelImplCopyWithImpl<
          _$PaginatedTransactionModelImpl>(this, _$identity);
}

abstract class _PaginatedTransactionModel implements PaginatedTransactionModel {
  const factory _PaginatedTransactionModel(
          {required final List<TransactionModel> transactions,
          required final DocumentSnapshot<Object?> lastDocument}) =
      _$PaginatedTransactionModelImpl;

  @override
  List<TransactionModel> get transactions;
  @override
  DocumentSnapshot<Object?> get lastDocument;

  /// Create a copy of PaginatedTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedTransactionModelImplCopyWith<_$PaginatedTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
