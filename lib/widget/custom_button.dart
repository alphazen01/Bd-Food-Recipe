import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color?color;
  const customButton({
    Key? key,
    this.icon,
    this.label,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: color,
        child: InkWell(
          onTap: (){},
          child: Container(
            child: Column(
              children: [
                Icon(icon,color: Colors.white,),
                Text("$label")
              ],
            ),
          ),
        ),
      ),
    );
  }
}