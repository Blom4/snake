import 'package:flutter/material.dart';

import '../models/position.dart';

class SnakeBoard extends StatelessWidget {
  const SnakeBoard({
    super.key,
    required this.snake,
    required this.food,
    required this.boardSize,
  });

  final List<Position> snake;
  final Position food;
  final int boardSize;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SnakeBoardPainter(
        snake: snake,
        food: food,
        boardSize: boardSize,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class SnakeBoardPainter extends CustomPainter {
  const SnakeBoardPainter({
    required this.snake,
    required this.food,
    required this.boardSize,
  });

  final List<Position> snake;
  final Position food;
  final int boardSize;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final cellSize = size.width / boardSize;

    _drawBackground(canvas, size);
    _drawGrid(canvas, size, cellSize);
    _drawSnake(canvas, cellSize);
    _drawFood(canvas, cellSize);
  }

  void _drawBackground(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = const Color(0xFF101010)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Offset.zero & size,
      paint,
    );
  }

  void _drawGrid(
    Canvas canvas,
    Size size,
    double cellSize,
  ) {
    final paint = Paint()
      ..color = const Color(0xFF252525)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (var x = 0; x <= boardSize; x++) {
      final dx = x * cellSize;

      canvas.drawLine(
        Offset(dx, 0),
        Offset(dx, size.height),
        paint,
      );
    }

    for (var y = 0; y <= boardSize; y++) {
      final dy = y * cellSize;

      canvas.drawLine(
        Offset(0, dy),
        Offset(size.width, dy),
        paint,
      );
    }
  }

  void _drawSnake(
    Canvas canvas,
    double cellSize,
  ) {
    final paint = Paint()
      ..color = const Color(0xFF4CAF50)
      ..style = PaintingStyle.fill;

    for (var index = 0; index < snake.length; index++) {
      final segment = snake[index];

      final rect = Rect.fromLTWH(
        segment.x * cellSize,
        segment.y * cellSize,
        cellSize,
        cellSize,
      );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          rect.deflate(1.5),
          const Radius.circular(4),
        ),
        paint,
      );
    }
  }

  void _drawFood(
    Canvas canvas,
    double cellSize,
  ) {
    final paint = Paint()
      ..color = const Color(0xFFE53935)
      ..style = PaintingStyle.fill;

    final center = Offset(
      food.x * cellSize + cellSize / 2,
      food.y * cellSize + cellSize / 2,
    );

    canvas.drawCircle(
      center,
      cellSize * 0.35,
      paint,
    );
  }

  @override
  bool shouldRepaint(
    covariant SnakeBoardPainter oldDelegate,
  ) {
    return oldDelegate.snake != snake ||
        oldDelegate.food != food ||
        oldDelegate.boardSize != boardSize;
  }
}