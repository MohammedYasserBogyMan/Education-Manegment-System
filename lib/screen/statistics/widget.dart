import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({super.key, required this.child, required this.delay});

  final Widget child;
  final double delay;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: (500 * widget.delay).round()),
        vsync: this);
    animation2 = Tween<double>(begin: -40, end: 0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Transform.translate(
      offset: Offset(0, animation2.value),
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    required this.height,
    this.color,
  });

  final Widget child;
  final double height;
  final MaterialColor? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height,
      decoration: BoxDecoration(
        color: color != null ? null : Colors.white,
        gradient: color == null
            ? null
            : LinearGradient(colors: [color!.shade300, color!.shade500]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 60,
          ),
        ],
      ),
      child: child,
    );
  }
}

class ProgressWithText extends StatefulWidget {
  const ProgressWithText({
    super.key,
    required this.indicatorValue,
    required this.title,
    required this.value,
  });

  final double indicatorValue;
  final String title;
  final int value;

  @override
  State<ProgressWithText> createState() => _ProgressWithTextState();
}

class _ProgressWithTextState extends State<ProgressWithText>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? valueAnimation;
  Animation<double>? indicatorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    valueAnimation =
        Tween<double>(begin: 0, end: widget.value * 1).animate(_controller!)
          ..addListener(() {
            setState(() {});
          });
    indicatorAnimation = Tween<double>(begin: 0, end: widget.indicatorValue)
        .animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 200)).then(
        (value) => _controller!.forward(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = (MediaQuery.sizeOf(context).width / 2) - 35;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${valueAnimation?.value ?? 0}".split('.')[0],
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox.square(
            dimension: w - 80,
            child: RotatedBox(
              quarterTurns: 3,
              child: CircularProgressIndicator(
                color: Colors.deepPurple.shade400,
                strokeCap: StrokeCap.round,
                strokeWidth: 10,
                value: indicatorAnimation?.value ?? 0,
                backgroundColor: Colors.deepPurple.withOpacity(.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
