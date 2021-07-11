// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthStateLoading loading() {
    return const _AuthStateLoading();
  }

  _AuthStateAuthenticated authenticated() {
    return const _AuthStateAuthenticated();
  }

  _AuthStateNotAuthenticated notAuthenticated() {
    return const _AuthStateNotAuthenticated();
  }

  _AuthStateError error([String? error]) {
    return _AuthStateError(
      error,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
    required TResult Function(_AuthStateNotAuthenticated value)
        notAuthenticated,
    required TResult Function(_AuthStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    TResult Function(_AuthStateNotAuthenticated value)? notAuthenticated,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$AuthStateLoadingCopyWith<$Res> {
  factory _$AuthStateLoadingCopyWith(
          _AuthStateLoading value, $Res Function(_AuthStateLoading) then) =
      __$AuthStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateLoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateLoadingCopyWith<$Res> {
  __$AuthStateLoadingCopyWithImpl(
      _AuthStateLoading _value, $Res Function(_AuthStateLoading) _then)
      : super(_value, (v) => _then(v as _AuthStateLoading));

  @override
  _AuthStateLoading get _value => super._value as _AuthStateLoading;
}

/// @nodoc

class _$_AuthStateLoading implements _AuthStateLoading {
  const _$_AuthStateLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    TResult Function(String? error)? error,
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
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
    required TResult Function(_AuthStateNotAuthenticated value)
        notAuthenticated,
    required TResult Function(_AuthStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    TResult Function(_AuthStateNotAuthenticated value)? notAuthenticated,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthStateLoading implements AuthState {
  const factory _AuthStateLoading() = _$_AuthStateLoading;
}

/// @nodoc
abstract class _$AuthStateAuthenticatedCopyWith<$Res> {
  factory _$AuthStateAuthenticatedCopyWith(_AuthStateAuthenticated value,
          $Res Function(_AuthStateAuthenticated) then) =
      __$AuthStateAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateAuthenticatedCopyWith<$Res> {
  __$AuthStateAuthenticatedCopyWithImpl(_AuthStateAuthenticated _value,
      $Res Function(_AuthStateAuthenticated) _then)
      : super(_value, (v) => _then(v as _AuthStateAuthenticated));

  @override
  _AuthStateAuthenticated get _value => super._value as _AuthStateAuthenticated;
}

/// @nodoc

class _$_AuthStateAuthenticated implements _AuthStateAuthenticated {
  const _$_AuthStateAuthenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthStateAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
    required TResult Function(String? error) error,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
    required TResult Function(_AuthStateNotAuthenticated value)
        notAuthenticated,
    required TResult Function(_AuthStateError value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    TResult Function(_AuthStateNotAuthenticated value)? notAuthenticated,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthStateAuthenticated implements AuthState {
  const factory _AuthStateAuthenticated() = _$_AuthStateAuthenticated;
}

/// @nodoc
abstract class _$AuthStateNotAuthenticatedCopyWith<$Res> {
  factory _$AuthStateNotAuthenticatedCopyWith(_AuthStateNotAuthenticated value,
          $Res Function(_AuthStateNotAuthenticated) then) =
      __$AuthStateNotAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthStateNotAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateNotAuthenticatedCopyWith<$Res> {
  __$AuthStateNotAuthenticatedCopyWithImpl(_AuthStateNotAuthenticated _value,
      $Res Function(_AuthStateNotAuthenticated) _then)
      : super(_value, (v) => _then(v as _AuthStateNotAuthenticated));

  @override
  _AuthStateNotAuthenticated get _value =>
      super._value as _AuthStateNotAuthenticated;
}

/// @nodoc

class _$_AuthStateNotAuthenticated implements _AuthStateNotAuthenticated {
  const _$_AuthStateNotAuthenticated();

  @override
  String toString() {
    return 'AuthState.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AuthStateNotAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
    required TResult Function(String? error) error,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
    required TResult Function(_AuthStateNotAuthenticated value)
        notAuthenticated,
    required TResult Function(_AuthStateError value) error,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    TResult Function(_AuthStateNotAuthenticated value)? notAuthenticated,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthStateNotAuthenticated implements AuthState {
  const factory _AuthStateNotAuthenticated() = _$_AuthStateNotAuthenticated;
}

/// @nodoc
abstract class _$AuthStateErrorCopyWith<$Res> {
  factory _$AuthStateErrorCopyWith(
          _AuthStateError value, $Res Function(_AuthStateError) then) =
      __$AuthStateErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$AuthStateErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateErrorCopyWith<$Res> {
  __$AuthStateErrorCopyWithImpl(
      _AuthStateError _value, $Res Function(_AuthStateError) _then)
      : super(_value, (v) => _then(v as _AuthStateError));

  @override
  _AuthStateError get _value => super._value as _AuthStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_AuthStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthStateError implements _AuthStateError {
  const _$_AuthStateError([this.error]);

  @override
  final String? error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$AuthStateErrorCopyWith<_AuthStateError> get copyWith =>
      __$AuthStateErrorCopyWithImpl<_AuthStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() notAuthenticated,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? notAuthenticated,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateLoading value) loading,
    required TResult Function(_AuthStateAuthenticated value) authenticated,
    required TResult Function(_AuthStateNotAuthenticated value)
        notAuthenticated,
    required TResult Function(_AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateLoading value)? loading,
    TResult Function(_AuthStateAuthenticated value)? authenticated,
    TResult Function(_AuthStateNotAuthenticated value)? notAuthenticated,
    TResult Function(_AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthStateError implements AuthState {
  const factory _AuthStateError([String? error]) = _$_AuthStateError;

  String? get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AuthStateErrorCopyWith<_AuthStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
