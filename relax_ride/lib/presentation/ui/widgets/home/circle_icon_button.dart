import 'package:flutter/cupertino.dart';

class CirculerIconButton extends StatefulWidget {
  const CirculerIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });
  final VoidCallback onTap;
  final IconData iconData;
  @override
  State<CirculerIconButton> createState() => _CirculerIconButtonState();
}

class _CirculerIconButtonState extends State<CirculerIconButton> {
  @override
  Widget build(BuildContext context) {
    return  Placeholder();}
}
