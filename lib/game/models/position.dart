import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';

@freezed
abstract class Position with _$Position {
  const factory Position({
    required int x,
    required int y,
  }) = _Position;
}