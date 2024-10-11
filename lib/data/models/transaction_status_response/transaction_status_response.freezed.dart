// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionStatusResponseModel _$TransactionStatusResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionStatusResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionStatusResponseModel {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TransactionModel get transactionData => throw _privateConstructorUsedError;

  /// Serializes this TransactionStatusResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionStatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionStatusResponseModelCopyWith<TransactionStatusResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStatusResponseModelCopyWith<$Res> {
  factory $TransactionStatusResponseModelCopyWith(
          TransactionStatusResponseModel value,
          $Res Function(TransactionStatusResponseModel) then) =
      _$TransactionStatusResponseModelCopyWithImpl<$Res,
          TransactionStatusResponseModel>;
  @useResult
  $Res call({bool status, String message, TransactionModel transactionData});

  $TransactionModelCopyWith<$Res> get transactionData;
}

/// @nodoc
class _$TransactionStatusResponseModelCopyWithImpl<$Res,
        $Val extends TransactionStatusResponseModel>
    implements $TransactionStatusResponseModelCopyWith<$Res> {
  _$TransactionStatusResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionStatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? transactionData = null,
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
      transactionData: null == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionModel,
    ) as $Val);
  }

  /// Create a copy of TransactionStatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionModelCopyWith<$Res> get transactionData {
    return $TransactionModelCopyWith<$Res>(_value.transactionData, (value) {
      return _then(_value.copyWith(transactionData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionStatusResponseModelImplCopyWith<$Res>
    implements $TransactionStatusResponseModelCopyWith<$Res> {
  factory _$$TransactionStatusResponseModelImplCopyWith(
          _$TransactionStatusResponseModelImpl value,
          $Res Function(_$TransactionStatusResponseModelImpl) then) =
      __$$TransactionStatusResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, TransactionModel transactionData});

  @override
  $TransactionModelCopyWith<$Res> get transactionData;
}

/// @nodoc
class __$$TransactionStatusResponseModelImplCopyWithImpl<$Res>
    extends _$TransactionStatusResponseModelCopyWithImpl<$Res,
        _$TransactionStatusResponseModelImpl>
    implements _$$TransactionStatusResponseModelImplCopyWith<$Res> {
  __$$TransactionStatusResponseModelImplCopyWithImpl(
      _$TransactionStatusResponseModelImpl _value,
      $Res Function(_$TransactionStatusResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionStatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? transactionData = null,
  }) {
    return _then(_$TransactionStatusResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      transactionData: null == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionStatusResponseModelImpl
    implements _TransactionStatusResponseModel {
  const _$TransactionStatusResponseModelImpl(
      {required this.status,
      required this.message,
      required this.transactionData});

  factory _$TransactionStatusResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionStatusResponseModelImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final TransactionModel transactionData;

  @override
  String toString() {
    return 'TransactionStatusResponseModel(status: $status, message: $message, transactionData: $transactionData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStatusResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.transactionData, transactionData) ||
                other.transactionData == transactionData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, transactionData);

  /// Create a copy of TransactionStatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStatusResponseModelImplCopyWith<
          _$TransactionStatusResponseModelImpl>
      get copyWith => __$$TransactionStatusResponseModelImplCopyWithImpl<
          _$TransactionStatusResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionStatusResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionStatusResponseModel
    implements TransactionStatusResponseModel {
  const factory _TransactionStatusResponseModel(
          {required final bool status,
          required final String message,
          required final TransactionModel transactionData}) =
      _$TransactionStatusResponseModelImpl;

  factory _TransactionStatusResponseModel.fromJson(Map<String, dynamic> json) =
      _$TransactionStatusResponseModelImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  TransactionModel get transactionData;

  /// Create a copy of TransactionStatusResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionStatusResponseModelImplCopyWith<
          _$TransactionStatusResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
