import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_aoi_model.freezed.dart';

@freezed
class WordAoi with _$WordAoi {
  const factory WordAoi({
    double? x,
    double? y,
    double? width,
    double? height,
    String? word,
  }) = _WordAoi;
}
