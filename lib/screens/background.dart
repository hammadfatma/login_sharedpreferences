import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/top1.png', width: size.width),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/top2.png', width: size.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/bottom1.png', width: size.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/bottom2.png', width: size.width),
          ),
          child
        ],
      ),
    );
  }
}
