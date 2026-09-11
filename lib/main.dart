import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/snake_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: SnakeApp(),
    ),
  );
}

class SnakeApp extends StatelessWidget {
  const SnakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snake',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const SnakeScreen(),
    );
  }
}

// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const SnakeApp());
// }

// class SnakeApp extends StatelessWidget {
//   const SnakeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Snake',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         useMaterial3: true,
//       ),
//       home: const SnakeGame(),
//     );
//   }
// }

// class SnakeGame extends StatefulWidget {
//   const SnakeGame({super.key});

//   @override
//   State<SnakeGame> createState() => _SnakeGameState();
// }

// class _SnakeGameState extends State<SnakeGame> {
//   static const int boardSize = 20;

//   final Random random = Random();

//   Timer? timer;

//   List<Point<int>> snake = [
//     const Point(10, 10),
//     const Point(9, 10),
//     const Point(8, 10),
//   ];

//   Point<int> food = const Point(15, 10);

//   int dx = 1;
//   int dy = 0;

//   int score = 0;

//   bool gameOver = false;

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   void startGame() {
//     timer?.cancel();

//     timer = Timer.periodic(
//       const Duration(milliseconds: 150),
//       (_) {
//         moveSnake();
//       },
//     );
//   }

//   void moveSnake() {
//     if (gameOver) {
//       return;
//     }

//     final head = snake.first;

//     final newHead = Point<int>(
//       head.x + dx,
//       head.y + dy,
//     );

//     // Wall collision
//     if (newHead.x < 0 ||
//         newHead.x >= boardSize ||
//         newHead.y < 0 ||
//         newHead.y >= boardSize) {
//       endGame();
//       return;
//     }

//     // Snake collision
//     if (snake.contains(newHead)) {
//       endGame();
//       return;
//     }

//     setState(() {
//       snake.insert(0, newHead);

//       // Food collision
//       if (newHead == food) {
//         score++;
//         generateFood();
//       } else {
//         snake.removeLast();
//       }
//     });
//   }

//   void generateFood() {
//     Point<int> newFood;

//     do {
//       newFood = Point<int>(
//         random.nextInt(boardSize),
//         random.nextInt(boardSize),
//       );
//     } while (snake.contains(newFood));

//     food = newFood;
//   }

//   void endGame() {
//     timer?.cancel();

//     setState(() {
//       gameOver = true;
//     });
//   }

//   void changeDirection(int newDx, int newDy) {
//     // Prevent reversing directly into yourself.
//     if (dx == -newDx && dy == -newDy) {
//       return;
//     }

//     setState(() {
//       dx = newDx;
//       dy = newDy;
//     });
//   }

//   void resetGame() {
//     timer?.cancel();

//     setState(() {
//       snake = [
//         const Point(10, 10),
//         const Point(9, 10),
//         const Point(8, 10),
//       ];

//       food = const Point(15, 10);

//       dx = 1;
//       dy = 0;

//       score = 0;
//       gameOver = false;
//     });

//     startGame();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Snake'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
        
//             Text(
//               'Score: $score',
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
        
//             const SizedBox(height: 20),
        
//             Expanded(
//               child: Center(
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Container(
//                     margin: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         width: 2,
//                       ),
//                     ),
//                     child: CustomPaint(
//                       painter: SnakePainter(
//                         snake: snake,
//                         food: food,
//                         boardSize: boardSize,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
        
//             if (gameOver)
//               Column(
//                 children: [
//                   const Text(
//                     'GAME OVER',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: resetGame,
//                     child: const Text('Restart'),
//                   ),
//                 ],
//               )
//             else
//               ElevatedButton(
//                 onPressed: startGame,
//                 child: const Text('Start'),
//               ),
        
//             const SizedBox(height: 20),
        
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     changeDirection(0, -1);
//                   },
//                   icon: const Icon(Icons.arrow_upward),
//                 ),
//               ],
//             ),
        
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     changeDirection(-1, 0);
//                   },
//                   icon: const Icon(Icons.arrow_back),
//                 ),
//                 const SizedBox(width: 40),
//                 IconButton(
//                   onPressed: () {
//                     changeDirection(1, 0);
//                   },
//                   icon: const Icon(Icons.arrow_forward),
//                 ),
//               ],
//             ),
        
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     changeDirection(0, 1);
//                   },
//                   icon: const Icon(Icons.arrow_downward),
//                 ),
//               ],
//             ),
        
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SnakePainter extends CustomPainter {
//   final List<Point<int>> snake;
//   final Point<int> food;
//   final int boardSize;

//   SnakePainter({
//     required this.snake,
//     required this.food,
//     required this.boardSize,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final cellWidth = size.width / boardSize;
//     final cellHeight = size.height / boardSize;

//     final snakePaint = Paint()
//       ..style = PaintingStyle.fill;

//     final foodPaint = Paint()
//       ..style = PaintingStyle.fill;

//     // Draw snake
//     for (final segment in snake) {
//       final rect = Rect.fromLTWH(
//         segment.x * cellWidth,
//         segment.y * cellHeight,
//         cellWidth,
//         cellHeight,
//       );

//       canvas.drawRect(
//         rect.deflate(1),
//         snakePaint,
//       );
//     }

//     // Draw food
//     final foodRect = Rect.fromLTWH(
//       food.x * cellWidth,
//       food.y * cellHeight,
//       cellWidth,
//       cellHeight,
//     );

//     canvas.drawRect(
//       foodRect.deflate(2),
//       foodPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant SnakePainter oldDelegate) {
//     return true;
//   }
// }