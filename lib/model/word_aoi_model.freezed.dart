// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_aoi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WordAoi {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  String? get word => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WordAoiCopyWith<WordAoi> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordAoiCopyWith<$Res> {
  factory $WordAoiCopyWith(WordAoi value, $Res Function(WordAoi) then) =
      _$WordAoiCopyWithImpl<$Res, WordAoi>;
  @useResult
  $Res call(
      {double? x, double? y, double? width, double? height, String? word});
}

/// @nodoc
class _$WordAoiCopyWithImpl<$Res, $Val extends WordAoi>
    implements $WordAoiCopyWith<$Res> {
  _$WordAoiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? word = freezed,
  }) {
    return _then(_value.copyWith(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordAoiCopyWith<$Res> implements $WordAoiCopyWith<$Res> {
  factory _$$_WordAoiCopyWith(
          _$_WordAoi value, $Res Function(_$_WordAoi) then) =
      __$$_WordAoiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? x, double? y, double? width, double? height, String? word});
}

/// @nodoc
class __$$_WordAoiCopyWithImpl<$Res>
    extends _$WordAoiCopyWithImpl<$Res, _$_WordAoi>
    implements _$$_WordAoiCopyWith<$Res> {
  __$$_WordAoiCopyWithImpl(_$_WordAoi _value, $Res Function(_$_WordAoi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? word = freezed,
  }) {
    return _then(_$_WordAoi(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_WordAoi implements _WordAoi {
  const _$_WordAoi({this.x, this.y, this.width, this.height, this.word});

  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? width;
  @override
  final double? height;
  @override
  final String? word;

  @override
  String toString() {
    return 'WordAoi(x: $x, y: $y, width: $width, height: $height, word: $word)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordAoi &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.word, word) || other.word == word));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, width, height, word);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordAoiCopyWith<_$_WordAoi> get copyWith =>
      __$$_WordAoiCopyWithImpl<_$_WordAoi>(this, _$identity);
}

abstract class _WordAoi implements WordAoi {
  const factory _WordAoi(
      {final double? x,
      final double? y,
      final double? width,
      final double? height,
      final String? word}) = _$_WordAoi;

  @override
  double? get x;
  @override
  double? get y;
  @override
  double? get width;
  @override
  double? get height;
  @override
  String? get word;
  @override
  @JsonKey(ignore: true)
  _$$_WordAoiCopyWith<_$_WordAoi> get copyWith =>
      throw _privateConstructorUsedError;
}
