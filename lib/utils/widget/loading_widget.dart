import 'package:flutter/material.dart';
import 'package:rfidlabunasman/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String loadingText;

  const LoadingWidget({Key? key, required this.loadingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Container(
      height: s.height,
      width: s.width,
      decoration: BoxDecoration(
        color: kBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            loadingText,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kTextColor,
                ),
          ),
        ],
      ),
    );
  }
}
