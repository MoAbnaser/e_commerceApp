import 'package:e_commerce_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  final double? value;
  const HorizontalSpace({
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * value!,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double? value;
  const VerticalSpace({
    required this.value,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * value!,
    );
  }
}
