import 'package:flutter/material.dart';

class RadioSelect extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const RadioSelect({Key key, @required this.value, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onChanged(!value);
      },
      child: ClipOval(
        child: SizedBox(
          width: 14,
          height: 14,
          child: value
              ? Icon(
                  Icons.check_circle,
                  color: Colors.white24,
                  size: 14,
                )
              : Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  child: null,
                ),
        ),
      ),
    );
  }
}
