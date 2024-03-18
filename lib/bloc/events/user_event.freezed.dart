// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUsers,
    required TResult Function(List<User> users) usersUpdated,
    required TResult Function() distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUsers,
    TResult? Function(List<User> users)? usersUpdated,
    TResult? Function()? distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUsers,
    TResult Function(List<User> users)? usersUpdated,
    TResult Function()? distract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUsers value) loadUsers,
    required TResult Function(UsersUpdated value) usersUpdated,
    required TResult Function(Distract value) distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUsers value)? loadUsers,
    TResult? Function(UsersUpdated value)? usersUpdated,
    TResult? Function(Distract value)? distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUsers value)? loadUsers,
    TResult Function(UsersUpdated value)? usersUpdated,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadUsersImplCopyWith<$Res> {
  factory _$$LoadUsersImplCopyWith(
          _$LoadUsersImpl value, $Res Function(_$LoadUsersImpl) then) =
      __$$LoadUsersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUsersImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LoadUsersImpl>
    implements _$$LoadUsersImplCopyWith<$Res> {
  __$$LoadUsersImplCopyWithImpl(
      _$LoadUsersImpl _value, $Res Function(_$LoadUsersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadUsersImpl implements LoadUsers {
  const _$LoadUsersImpl();

  @override
  String toString() {
    return 'UserEvent.loadUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadUsersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUsers,
    required TResult Function(List<User> users) usersUpdated,
    required TResult Function() distract,
  }) {
    return loadUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUsers,
    TResult? Function(List<User> users)? usersUpdated,
    TResult? Function()? distract,
  }) {
    return loadUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUsers,
    TResult Function(List<User> users)? usersUpdated,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUsers value) loadUsers,
    required TResult Function(UsersUpdated value) usersUpdated,
    required TResult Function(Distract value) distract,
  }) {
    return loadUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUsers value)? loadUsers,
    TResult? Function(UsersUpdated value)? usersUpdated,
    TResult? Function(Distract value)? distract,
  }) {
    return loadUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUsers value)? loadUsers,
    TResult Function(UsersUpdated value)? usersUpdated,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (loadUsers != null) {
      return loadUsers(this);
    }
    return orElse();
  }
}

abstract class LoadUsers implements UserEvent {
  const factory LoadUsers() = _$LoadUsersImpl;
}

/// @nodoc
abstract class _$$UsersUpdatedImplCopyWith<$Res> {
  factory _$$UsersUpdatedImplCopyWith(
          _$UsersUpdatedImpl value, $Res Function(_$UsersUpdatedImpl) then) =
      __$$UsersUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class __$$UsersUpdatedImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UsersUpdatedImpl>
    implements _$$UsersUpdatedImplCopyWith<$Res> {
  __$$UsersUpdatedImplCopyWithImpl(
      _$UsersUpdatedImpl _value, $Res Function(_$UsersUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$UsersUpdatedImpl(
      null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$UsersUpdatedImpl implements UsersUpdated {
  const _$UsersUpdatedImpl(final List<User> users) : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'UserEvent.usersUpdated(users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersUpdatedImpl &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersUpdatedImplCopyWith<_$UsersUpdatedImpl> get copyWith =>
      __$$UsersUpdatedImplCopyWithImpl<_$UsersUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUsers,
    required TResult Function(List<User> users) usersUpdated,
    required TResult Function() distract,
  }) {
    return usersUpdated(users);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUsers,
    TResult? Function(List<User> users)? usersUpdated,
    TResult? Function()? distract,
  }) {
    return usersUpdated?.call(users);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUsers,
    TResult Function(List<User> users)? usersUpdated,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (usersUpdated != null) {
      return usersUpdated(users);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUsers value) loadUsers,
    required TResult Function(UsersUpdated value) usersUpdated,
    required TResult Function(Distract value) distract,
  }) {
    return usersUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUsers value)? loadUsers,
    TResult? Function(UsersUpdated value)? usersUpdated,
    TResult? Function(Distract value)? distract,
  }) {
    return usersUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUsers value)? loadUsers,
    TResult Function(UsersUpdated value)? usersUpdated,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (usersUpdated != null) {
      return usersUpdated(this);
    }
    return orElse();
  }
}

abstract class UsersUpdated implements UserEvent {
  const factory UsersUpdated(final List<User> users) = _$UsersUpdatedImpl;

  List<User> get users;
  @JsonKey(ignore: true)
  _$$UsersUpdatedImplCopyWith<_$UsersUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DistractImplCopyWith<$Res> {
  factory _$$DistractImplCopyWith(
          _$DistractImpl value, $Res Function(_$DistractImpl) then) =
      __$$DistractImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DistractImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$DistractImpl>
    implements _$$DistractImplCopyWith<$Res> {
  __$$DistractImplCopyWithImpl(
      _$DistractImpl _value, $Res Function(_$DistractImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DistractImpl implements Distract {
  const _$DistractImpl();

  @override
  String toString() {
    return 'UserEvent.distract()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DistractImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUsers,
    required TResult Function(List<User> users) usersUpdated,
    required TResult Function() distract,
  }) {
    return distract();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUsers,
    TResult? Function(List<User> users)? usersUpdated,
    TResult? Function()? distract,
  }) {
    return distract?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUsers,
    TResult Function(List<User> users)? usersUpdated,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (distract != null) {
      return distract();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUsers value) loadUsers,
    required TResult Function(UsersUpdated value) usersUpdated,
    required TResult Function(Distract value) distract,
  }) {
    return distract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUsers value)? loadUsers,
    TResult? Function(UsersUpdated value)? usersUpdated,
    TResult? Function(Distract value)? distract,
  }) {
    return distract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUsers value)? loadUsers,
    TResult Function(UsersUpdated value)? usersUpdated,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (distract != null) {
      return distract(this);
    }
    return orElse();
  }
}

abstract class Distract implements UserEvent {
  const factory Distract() = _$DistractImpl;
}
