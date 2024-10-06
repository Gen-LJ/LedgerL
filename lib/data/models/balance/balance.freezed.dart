// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) {
  return _BalanceModel.fromJson(json);
}

/// @nodoc
mixin _$BalanceModel {
  String get currency => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;

  /// Serializes this BalanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceModelCopyWith<BalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceModelCopyWith<$Res> {
  factory $BalanceModelCopyWith(
          BalanceModel value, $Res Function(BalanceModel) then) =
      _$BalanceModelCopyWithImpl<$Res, BalanceModel>;
  @useResult
  $Res call({String currency, num amount});
}

/// @nodoc
class _$BalanceModelCopyWithImpl<$Res, $Val extends BalanceModel>
    implements $BalanceModelCopyWith<$Res> {
  _$BalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceModelImplCopyWith<$Res>
    implements $BalanceModelCopyWith<$Res> {
  factory _$$BalanceModelImplCopyWith(
          _$BalanceModelImpl value, $Res Function(_$BalanceModelImpl) then) =
      __$$BalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currency, num amount});
}

/// @nodoc
class __$$BalanceModelImplCopyWithImpl<$Res>
    extends _$BalanceModelCopyWithImpl<$Res, _$BalanceModelImpl>
    implements _$$BalanceModelImplCopyWith<$Res> {
  __$$BalanceModelImplCopyWithImpl(
      _$BalanceModelImpl _value, $Res Function(_$BalanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? amount = null,
  }) {
    return _then(_$BalanceModelImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceModelImpl implements _BalanceModel {
  const _$BalanceModelImpl({required this.currency, required this.amount});

  factory _$BalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceModelImplFromJson(json);

  @override
  final String currency;
  @override
  final num amount;

  @override
  String toString() {
    return 'BalanceModel(currency: $currency, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceModelImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currency, amount);

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceModelImplCopyWith<_$BalanceModelImpl> get copyWith =>
      __$$BalanceModelImplCopyWithImpl<_$BalanceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceModelImplToJson(
      this,
    );
  }
}

abstract class _BalanceModel implements BalanceModel {
  const factory _BalanceModel(
      {required final String currency,
      required final num amount}) = _$BalanceModelImpl;

  factory _BalanceModel.fromJson(Map<String, dynamic> json) =
      _$BalanceModelImpl.fromJson;

  @override
  String get currency;
  @override
  num get amount;

  /// Create a copy of BalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceModelImplCopyWith<_$BalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
