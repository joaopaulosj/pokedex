import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_colors.dart';
import 'package:pokedex/constants/app_dimens.dart';

class StatBar extends StatelessWidget {
  final String label;
  final double progress;

  const StatBar({
    Key? key,
    required this.label,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12.0)),
        const SizedBox(height: kMarginSmall),
        Container(
          height: kMarginDefault,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              Flexible(
                flex: (progress * 100).toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.statColor(label),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              Flexible(
                flex: 100 - (progress * 100).toInt(),
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
