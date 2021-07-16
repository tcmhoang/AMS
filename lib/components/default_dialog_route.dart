import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../config/constansts.dart';

class DefaultDialogRoute<T> extends TransitionRoute<T> {
  DefaultDialogRoute({
    required this.page,
    required this.dismissible,
  });

  final Widget page;
  final bool dismissible;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return <OverlayEntry>[
      OverlayEntry(builder: _buildModalBarrier),
      OverlayEntry(
        builder: (BuildContext context) => FadeScaleTransition(
          child: Center(child: page),
          animation: animation!,
        ),
      )
    ];
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration =>
      Duration(milliseconds: kDefaultDuration.inMilliseconds);

  Widget _buildModalBarrier(BuildContext context) {
    final Animation<double> animation = this.animation!;
    return IgnorePointer(
      // changedInternalState is called when this updates
      ignoring: animation.status == AnimationStatus.reverse ||
          // dismissed is possible when doing a manual pop gesture
          animation.status == AnimationStatus.dismissed,
      child: AnimatedModalBarrier(
        color: animation.drive(
          ColorTween(
            begin: Colors.transparent,
            end: Colors.black.withAlpha(80),
          ),
        ),
        dismissible: dismissible,
      ),
    ).backgroundBlur(7.0).animate(kDefaultDuration, Curves.easeInOutQuad);
  }
}
