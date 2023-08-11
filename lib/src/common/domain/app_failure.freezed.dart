// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(T? object) unexpected,
    required TResult Function() permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(T? object)? unexpected,
    TResult? Function()? permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(T? object)? unexpected,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(notFound<T> value) notFound,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(permitionDenied<T> value) permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(notFound<T> value)? notFound,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(permitionDenied<T> value)? permissionDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(notFound<T> value)? notFound,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(permitionDenied<T> value)? permissionDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<T, $Res> {
  factory $AppFailureCopyWith(
          AppFailure<T> value, $Res Function(AppFailure<T>) then) =
      _$AppFailureCopyWithImpl<T, $Res, AppFailure<T>>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<T, $Res, $Val extends AppFailure<T>>
    implements $AppFailureCopyWith<T, $Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$notFoundCopyWith<T, $Res> {
  factory _$$notFoundCopyWith(
          _$notFound<T> value, $Res Function(_$notFound<T>) then) =
      __$$notFoundCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$notFoundCopyWithImpl<T, $Res>
    extends _$AppFailureCopyWithImpl<T, $Res, _$notFound<T>>
    implements _$$notFoundCopyWith<T, $Res> {
  __$$notFoundCopyWithImpl(
      _$notFound<T> _value, $Res Function(_$notFound<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$notFound<T> implements notFound<T> {
  const _$notFound();

  @override
  String toString() {
    return 'AppFailure<$T>.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$notFound<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(T? object) unexpected,
    required TResult Function() permissionDenied,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(T? object)? unexpected,
    TResult? Function()? permissionDenied,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(T? object)? unexpected,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(notFound<T> value) notFound,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(permitionDenied<T> value) permissionDenied,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(notFound<T> value)? notFound,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(permitionDenied<T> value)? permissionDenied,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(notFound<T> value)? notFound,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(permitionDenied<T> value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class notFound<T> implements AppFailure<T> {
  const factory notFound() = _$notFound<T>;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<T, $Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected<T> value, $Res Function(_$_Unexpected<T>) then) =
      __$$_UnexpectedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? object});
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<T, $Res>
    extends _$AppFailureCopyWithImpl<T, $Res, _$_Unexpected<T>>
    implements _$$_UnexpectedCopyWith<T, $Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected<T> _value, $Res Function(_$_Unexpected<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = freezed,
  }) {
    return _then(_$_Unexpected<T>(
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Unexpected<T> implements _Unexpected<T> {
  const _$_Unexpected({this.object});

  @override
  final T? object;

  @override
  String toString() {
    return 'AppFailure<$T>.unexpected(object: $object)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unexpected<T> &&
            const DeepCollectionEquality().equals(other.object, object));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(object));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnexpectedCopyWith<T, _$_Unexpected<T>> get copyWith =>
      __$$_UnexpectedCopyWithImpl<T, _$_Unexpected<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(T? object) unexpected,
    required TResult Function() permissionDenied,
  }) {
    return unexpected(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(T? object)? unexpected,
    TResult? Function()? permissionDenied,
  }) {
    return unexpected?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(T? object)? unexpected,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(notFound<T> value) notFound,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(permitionDenied<T> value) permissionDenied,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(notFound<T> value)? notFound,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(permitionDenied<T> value)? permissionDenied,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(notFound<T> value)? notFound,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(permitionDenied<T> value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected<T> implements AppFailure<T> {
  const factory _Unexpected({final T? object}) = _$_Unexpected<T>;

  T? get object;
  @JsonKey(ignore: true)
  _$$_UnexpectedCopyWith<T, _$_Unexpected<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$permitionDeniedCopyWith<T, $Res> {
  factory _$$permitionDeniedCopyWith(_$permitionDenied<T> value,
          $Res Function(_$permitionDenied<T>) then) =
      __$$permitionDeniedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$permitionDeniedCopyWithImpl<T, $Res>
    extends _$AppFailureCopyWithImpl<T, $Res, _$permitionDenied<T>>
    implements _$$permitionDeniedCopyWith<T, $Res> {
  __$$permitionDeniedCopyWithImpl(
      _$permitionDenied<T> _value, $Res Function(_$permitionDenied<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$permitionDenied<T> implements permitionDenied<T> {
  const _$permitionDenied();

  @override
  String toString() {
    return 'AppFailure<$T>.permissionDenied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$permitionDenied<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function(T? object) unexpected,
    required TResult Function() permissionDenied,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function(T? object)? unexpected,
    TResult? Function()? permissionDenied,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function(T? object)? unexpected,
    TResult Function()? permissionDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(notFound<T> value) notFound,
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(permitionDenied<T> value) permissionDenied,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(notFound<T> value)? notFound,
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(permitionDenied<T> value)? permissionDenied,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(notFound<T> value)? notFound,
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(permitionDenied<T> value)? permissionDenied,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class permitionDenied<T> implements AppFailure<T> {
  const factory permitionDenied() = _$permitionDenied<T>;
}
