// ignore_for_file: slash_for_doc_comments, dangling_library_doc_comments

/**
Question: 
 Create a linear progress bar (do not use LinearProgressIndicator; instead, use CustomPainter to
draw it manually).
a. The progress bar color should dynamically change based on the progress value (e.g., 0-
50%: red, 50-100%: green).
b. Provide a button that, when clicked, animates the progress bar to 100%.
 */
//Solution:

import '../widgets.dart';

class AnswerForQ4 extends StatefulWidget {
  const AnswerForQ4({super.key});

  @override
  State<AnswerForQ4> createState() => _AnswerForQ4State();
}

enum AnimationDirection { forward, reverse }

class _AnswerForQ4State extends State<AnswerForQ4>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late AnimationController controller;
  late Animation<double> _animation;
  AnimationDirection lastDirection = AnimationDirection.forward;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _progress = _animation.value;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void startAnimation() {
    controller.forward(from: _progress);
    lastDirection = AnimationDirection.forward;
  }

  void resetBackAnimation() {
    controller.reverse(from: _progress);
    lastDirection = AnimationDirection.reverse;
  }

  void pauseAnimation() {
    controller.stop();
  }

  void resumeAnimation() {
    if (controller.isAnimating) return; // avoid double animation
    if (lastDirection == AnimationDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: startAnimation,
                child: const Text('Animate to 100%'),
              ),
              const SizedBox(height: 10),
              CustomPaint(
                painter: ProgressBarPainter(progress: _progress),
                child: Container(
                  width: 330,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: resetBackAnimation,
                    child: const Text('Reset'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: pauseAnimation,
                    child: const Text('Pause'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: resumeAnimation,
                    child: const Text('Resume'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  final double progress;
  ProgressBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    double borderRadius = size.height / 2;
    RRect backgroundRRect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    // Background bar
    Paint backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawRRect(backgroundRRect, backgroundPaint);

// Progress color (red to green based on percentage)
    Color progressColor = progress < 0.5 ? Colors.red : Colors.green;

    // Progress bar
    double progressWidth = size.width * progress;
    RRect progressRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, progressWidth, size.height),
      Radius.circular(borderRadius),
    );

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(progressRRect, progressPaint);
  }

  @override
  bool shouldRepaint(covariant ProgressBarPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
