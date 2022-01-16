import 'package:flutter/material.dart';
import 'package:pokedex/constants/app_dimens.dart';
import 'package:pokedex/constants/app_strings.dart';
import 'package:pokedex/domain/entities/failure.dart';

class FailureWidget extends StatelessWidget {
  final Failure? failure;
  final VoidCallback onRetry;

  const FailureWidget({
    Key? key,
    required this.onRetry,
    this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            ':(',
            style: TextStyle(
              color: Colors.black12,
              fontSize: 64,
            ),
          ),
          const SizedBox(height: kMarginDefault),
          Text(
            failure?.getMessage() ?? '',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kMarginDefault),
          ElevatedButton(
            child: const Text(AppStrings.retry),
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
