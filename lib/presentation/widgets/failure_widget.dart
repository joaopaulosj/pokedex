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
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: Text(AppStrings.shared.retry),
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
