import 'package:flutter/material.dart';

class Design extends StatefulWidget {
  final Color color;
  final double blurLevel;
  final Offset offsetWhite;
  final Offset offsetBlack;
  final double height;
  final double width;
  final IconData icon;
  final double iconSize;

  const Design(
      {Key key,
      this.color,
      this.blurLevel,
      this.offsetWhite,
      this.offsetBlack,
      this.height,
      this.width,
      this.icon,
      this.iconSize})
      : super(key: key);

  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: onPointerUp,
      onPointerDown: onPointerDown,
      child: isPressed
          ? onPressed()
          : offPressed(),
    );
  }

  void onPointerUp(PointerUpEvent event) {
    setState(() {
      isPressed = false;
    });
  }

  void onPointerDown(PointerDownEvent event) {
    setState(() {
      isPressed = true;
    });
  }

  Widget offPressed() {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Color(0xFFE6EBF2),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: widget.blurLevel,
            offset: Offset(-3, -3),
            color: Colors.white.withOpacity(0.7),
          ),
          BoxShadow(
            blurRadius: widget.blurLevel,
            offset: Offset(3, 3),
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
      child: Icon(
        widget.icon,
        color: Colors.black.withOpacity(0.5),
        size: 30,
      ),
    );
  }

  Widget onPressed() {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: widget.blurLevel,
              offset: Offset(-3, -3),
              color: Colors.white.withOpacity(0.7),
            ),
            BoxShadow(
              blurRadius: widget.blurLevel,
              offset: Offset(3, 3),
              color: Colors.black.withOpacity(0.15),
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: widget.blurLevel,
                      offset: widget.offsetWhite,
                      color: Colors.white.withOpacity(0.7)
                  ),
                  BoxShadow(
                      blurRadius: widget.blurLevel,
                      offset: widget.offsetBlack,
                      color: Colors.black.withOpacity(0.25)
                  )
                ]
            ),
            child: Icon(
              widget.icon,
              size: widget.iconSize,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
