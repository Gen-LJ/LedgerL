// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBalanceModel _$UserBalanceModelFromJson(Map<String, dynamic> json) {
  return _UserBalanceModel.fromJson(json);
}

/// @nodoc
mixin _$UserBalanceModel {
  String get id => throw _privateConstructorUsedError;
  List<BalanceModel> get balance => throw _privateConstructorUsedError;

  /// Serializes this UserBalanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBalanceModelCopyWith<UserBalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBalanceModelCopyWith<$Res> {
  factory $UserBalanceModelCopyWith(
          UserBalanceModel value, $Res Function(UserBalanceModel) then) =
      _$UserBalanceModelCopyWithImpl<$Res, UserBalanceModel>;
  @useResult
  $Res call({String id, List<BalanceModel> balance});
}

/// @nodoc
class _$UserBalanceModelCopyWithImpl<$Res, $Val extends UserBalanceModel>
    implements $UserBalanceModelCopyWith<$Res> {
  _$UserBalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as List<BalanceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBalanceModelImplCopyWith<$Res>
    implements $UserBalanceModelCopyWith<$Res> {
  factory _$$UserBalanceModelImplCopyWith(_$UserBalanceModelImpl value,
          $Res Function(_$UserBalanceModelImpl) then) =
      __$$UserBalanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<BalanceModel> balance});
}

/// @nodoc
class __$$UserBalanceModelImplCopyWithImpl<$Res>
    extends _$UserBalanceModelCopyWithImpl<$Res, _$UserBalanceModelImpl>
    implements _$$UserBalanceModelImplCopyWith<$Res> {
  __$$UserBalanceModelImplCopyWithImpl(_$UserBalanceModelImpl _value,
      $Res Function(_$UserBalanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? balance = null,
  }) {
    return _then(_$UserBalanceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value._balance
          : balance // ignore: cast_nullable_to_non_nullable
              as List<BalanceModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBalanceModelImpl implements _UserBalanceModel {
  const _$UserBalanceModelImpl(
      {required this.id, required final List<BalanceModel> balance})
      : _balance = balance;

  factory _$UserBalanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceModelImplFromJson(json);

  @override
  final String id;
  final List<BalanceModel> _balance;
  @override
  List<BalanceModel> get balance {
    if (_balance is EqualUnmodifiableListView) return _balance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balance);
  }

  @override
  String toString() {
    return 'UserBalanceModel(id: $id, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._balance, _balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_balance));

  /// Create a copy of UserBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceModelImplCopyWith<_$UserBalanceModelImpl> get copyWith =>
      __$$UserBalanceModelImplCopyWithImpl<_$UserBalanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceModelImplToJson(
      this,
    );
  }
}

abstract class _UserBalanceModel implements UserBalanceModel {
  const factory _UserBalanceModel(
      {required final String id,
      required final List<BalanceModel> balance}) = _$UserBalanceModelImpl;

  factory _UserBalanceModel.fromJson(Map<String, dynamic> json) =
      _$UserBalanceModelImpl.fromJson;

  @override
  String get id;
  @override
  List<BalanceModel> get balance;

  /// Create a copy of UserBalanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBalanceModelImplCopyWith<_$UserBalanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
