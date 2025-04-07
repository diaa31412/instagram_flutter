import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smalLike;
  final bool isAnimating;

  const LikeAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
    this.smalLike = false,
    required this.isAnimating,
  });

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    // TODO: implement ==
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.isAnimating || widget.smalLike) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(Duration(milliseconds: 200));

      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
